const express = require('express');
const app = express(),
	bodyParser = require('body-parser');
const cors = require('cors');
const { Client } = require('pg');

port = 5001;

app.use(bodyParser.json());
app.use(cors())

// commented lines are for debugging
const client = new Client({
	host: 'postgres-service.default.svc.cluster.local',
	//host: '192.168.49.2',
	//port: '5432',
	port: '30002',
	user: 'postgresadmin',
	password: 'aStrongPassword',
	database: 'postgresdb'
})

// when client connects, use a callback to set up the database if not already set up
client.connect((err) => {
	if (err) {
		console.log(`Connection error! \n ${err.stack}`);
		return;
	}

	console.log("Connected to database!");
	
	// check if the table exists
	client.query(
		`SELECT * FROM information_schema.tables
      	WHERE table_schema = 'public'
      	AND table_name = 'number_table';`,
		(err, res) => {
        	if (err) {
          		console.error(`Error getting table info! ${err.stack}`);
        	} else if (res.rows.length === 0) { 
          		console.log('Table does not exist, creating...');
          		
				client.query(
            		`CREATE TABLE number_table (
						id serial PRIMARY KEY,
						number integer NOT NULL
					);
					INSERT INTO number_table (id, number) VALUES (1, 0);`,
            		(err, res) => {
              			if (err) {
                			console.error(`Error creating table! \n ${err.stack}`);
              			} else {
                			console.log('Table created');
              			}
            		}
          		);
        	} else {
          		console.log('Table exists');
        	}
      	}
	);
})

app.get('/api/number', (req, resp) => {
	let number = null;

	client.query(
		`SELECT number FROM number_table`,
		(err, res) => {
			if (err) {
				console.log(`Error getting number! \n ${err.stack}`)
			} else {
				number = res.rows[0].number;
				console.log(`The number is: ${number}`);
				resp.json({number: `${number}`})
			}
		}
	)
});

app.post('/api/number', (req, resp) => {
	
	client.query(
		`BEGIN;
		UPDATE number_table SET number = number + 1 WHERE id = 1;
		SELECT number FROM number_table WHERE id = 1;
		COMMIT;`,
		(err, res) => {
			if (err) {
				console.log(`Error incrementing number! \n ${err.stack}`);
				// makes sure that the increment is a success, otherwise the db is rolledback
				client.query("ROLLBACK", (err) => {
					if (err) {
						console.log(`Rollback error! \n ${err.stack}`);
					} else {
						console.log("Rollback success!");
					}
				});
			} else {
				console.log("Incremented number");
			}
		}
	)

	resp.send("Incremented!");
});

app.listen(port, () => {
	console.log(`server listening on port: ${port}`);
});

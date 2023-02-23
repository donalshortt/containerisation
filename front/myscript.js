const hello = 3;

const url = "http://192.168.49.2:30000/api/number"

function getNumber() {
	const Http = new XMLHttpRequest();

	Http.open("GET", url);
	Http.send();

	Http.onreadystatechange=(e)=> {
		console.log(Http.response);
	}
}

function incrementNumber() {
	const Http = new XMLHttpRequest();

	Http.open("POST", url);
	Http.send();

	Http.onreadystatechange=(e)=> {
		console.log(`${Http.response}`);
	}
}

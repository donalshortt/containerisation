const hello = 3;

const url = "http://api-service.default.svc.cluster.local:30001/api/number"

function getNumber() {
	const Http = new XMLHttpRequest();

	Http.open("GET", url);
	Http.setRequestHeader('Access-Control-Allow-Origin', '*');
	Http.send();

	Http.onreadystatechange=(e)=> {
		console.log(Http.response);
	}
}

function incrementNumber() {
	const Http = new XMLHttpRequest();

	Http.open("POST", url);
	Http.setRequestHeader('Access-Control-Allow-Origin', '*');
	Http.send();

	Http.onreadystatechange=(e)=> {
		console.log(`${Http.response}`);
	}
}

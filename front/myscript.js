function getNumber() {
	const Http = new XMLHttpRequest();
	const url = "http://localhost:5001"

	Http.open("GET", url);
	Http.send();

	Http.onreadystatechange=(e)=> {
		console.log(`Number: ${Http.responseText}`);
	}
}

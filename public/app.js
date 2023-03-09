
function something()
{
	let x = window.localStorage.getItem('bbb');

	x = x * 1 + 1; // фишка чтобы не было конкатенации строк

	window.localStorage.setItem('bbb', x);
	
	alert(x);
}

function add_to_cart(id)
{
	alert('You added pizza with id: ' + id);
}
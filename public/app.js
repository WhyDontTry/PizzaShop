
function something()
{
	alert('Items in your cart: ' + cart_get_number_of_items());
}

function add_to_cart(id)
{
	let key = 'product_' + id;
	let x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
}

function cart_get_number_of_items()
{
	let items = 0;

	for (let i = 0; i < window.localStorage.length; i++)
	{
		const key = window.localStorage.key(i);
		if ( key.indexOf('product_') == 0 ) {
			items += Number(window.localStorage.getItem(key));
		}
	}
	
	return items;
}
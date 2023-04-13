<?php
session_start();
include_once 'lib/CartLib.php';
$cart = new CartLib();

if ($_POST) {
	extract($_POST);

	if ($type == 'add_cart') {
		$item = array(
						'id' => $product_id,
						'name' => $product_name,
						'qty' => $product_qty,
						'price' => $product_price,
						'image' => $product_image,
					);
		$resp = $cart->insert_item($item);
	}

	if ($type == 'get_all') {
		$resp = $cart->get_all_items();
	}
}
    echo json_encode($resp);
?>
# Once https is live include this feature to PHP throughout the website

<?php

if ($_SERVER['EXECUTION_ENV'] == 'development') {
	$siteUrl = 'https://' . $_SERVER['HTTP_HOST'] . '/';
} else if ($_SERVER['EXECUTION_ENV'] == 'staging') {
	$siteUrl = 'https://' . $_SERVER['HTTP_HOST'] . '/';
} else {
	$siteUrl = 'https://www.theroyalambassador.com/';
}

$baseUrl = $siteUrl;
$site_url = $siteUrl;

?>

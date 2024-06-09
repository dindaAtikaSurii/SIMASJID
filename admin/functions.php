<?php
function dbConnect(){
	$db=new mysqli("localhost:3308","root","","db_masjid");
	return $db;
}
?>
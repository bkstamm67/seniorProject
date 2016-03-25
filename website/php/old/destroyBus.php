<?php

include('connect.php');

$id=$_POST["id"];

$query = $mysqli->query("DELETE FROM business WHERE business_id='$id';");

if($query){
    echo "Success";
}
else{
    echo "FAILURE!";
}
?>
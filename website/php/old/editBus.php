<?php

include('connect.php');

//header('Content-Type: application/json');
//NEED TO INSERT LAT LONG IN THIS FILE!!

$id=$_POST["id"];
$business=$_POST["business"];
$address=$_POST["address"];
$city=$_POST["city"];
$state=$_POST["state"];
$telephone=$_POST["telephone"];
$website=$_POST["website"];
$notes=$_POST["notes"];

$query = $mysqli->query("UPDATE business SET name='$business', address='$address', city='$city', state='$state', telephone='$telephone', website='$website', notes='$notes' WHERE business_id='$id';");

if($query){
    echo "Success";
}
else{
    echo "FAILURE!";
}
?>
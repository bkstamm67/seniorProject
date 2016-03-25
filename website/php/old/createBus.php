<?php

include('connect.php');

//header('Content-Type: application/json');
//NEED TO INSERT LAT LONG IN THIS FILE!!

$business=$_POST["business"];
$address=$_POST["address"];
$city=$_POST["city"];
$state=$_POST["state"];
$telephone=$_POST["telephone"];
$website=$_POST["website"];
$notes=$_POST["notes"];

$query = $mysqli->query("INSERT into business(name, address, city, state, telephone, website, notes) values ('$business', '$address', '$city', '$state', '$telephone', '$website', '$notes');");

if($query){
    echo "Success";
}
else{
    echo "FAILURE!";
}
?>
<?php
/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding js, html file is ajax.js & index.html  
*************************/
//Needed to connect to db
include('connect.php');
ini_set('display_errors', 'On');

$user=$_POST["userName"];
$pass=$_POST["pass"];

if($mysqli->connect_errno){
    echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
    }
$query = $mysqli->query("SELECT * FROM adminUser WHERE userName='$user' AND password='$pass';");
if (mysqli_num_rows($query)>0) {
    echo "good";
}else{
    echo "bad";
}
?>
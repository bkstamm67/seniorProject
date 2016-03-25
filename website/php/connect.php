<?php  
//Turn on error reporting
ini_set('display_errors', 'On');

//Variables for the database
$dbUser = '';//database user goes here 
$host = '';//host name goes here
$dbPass = '';//password goes here
$db = '';//database name goes here

//Connects to database
$mysqli = new mysqli($host, $dbUser, $dbPass, $db);

if($mysqli->connect_errno){
    echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
    }
?>

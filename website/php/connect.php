<?php  
//Turn on error reporting
ini_set('display_errors', 'On');

//Variables for the database
$dbUser = 'brian';//'stammbr-db';
$host = 'localhost';//'oniddb.cws.oregonstate.edu';
$dbPass = 'cardinals';//'EdIN2EJcEdi2t9PD';
$db = 'stammbr';//'stammbr-db';

//Connects to database
$mysqli = new mysqli($host, $dbUser, $dbPass, $db);

if($mysqli->connect_errno){
    echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
    }
?>

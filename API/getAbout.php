<?php
	/*
		Travis Boaz, boazt@oregonstate.edu
		Brian Stamm, stammbr@oregonstate.edu
		Andrew Kasnevich, kasnevia@oregonstate.edu
		CS 419 Winter 2016 - Group 2
		February 28, 2016
	*/

	/* get connection data */
	require "config.php";

	/* attempt connection */
	$mysqli = new mysqli($mysqlHost, $mysqlUser, $mysqlPassword, $mysqlName);

	/* connect? */
	if ($mysqli->connect_errno) {
		printf("failure: %s\n", $mysqli->connect_errno);
		exit();
	}

	/* set charset to hopefully deal with atypical characters entered via web interface */
	$mysqli->set_charset("UTF8");

	/* establish array to receive query response */
	$data = array();

	/* request ALL data from adminTable */
	$query = "SELECT * FROM adminTable";

	/* receive data */
	$result = $mysqli->query($query);

	/* transfer data to array for use */
	while($row = $result -> fetch_assoc()){
		$data[] = $row;
	}

	/* encode in json for data transfer to iOS app */
	echo json_encode($data);
    
	/* terminate query */
	$result->close();
 
 	/* terminate db connection */
 	$mysqli->close();

?>

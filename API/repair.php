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

	/* request entire repair table */
	$query = "SELECT * FROM repair ORDER BY item";

	/* receive data */
	$result = $mysqli->query($query);
	
	/* create array to receive data */
	$data = array();
	
	/* fetch data to array line by line */
	while($row = $result -> fetch_assoc()){
		$data[] = $row;
	}

	/* json encdode for transmissions */
	echo json_encode($data);

 	/* close query */
 	$result->close();
 
  	/* close db connection */
 	$mysqli->close();

?>
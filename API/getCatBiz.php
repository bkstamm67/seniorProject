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

	/* retrieve HTTP variable and create receiving array */
	if (isset($_GET["id"])){	
		$rid = $_GET["id"];
		$data = array();
	}

	$stmt = $mysqli->stmt_init();
	/* prepare query */
	if ($stmt = $mysqli->prepare("SELECT bid FROM repair_bus WHERE rid=?")) {

    	/* bind parameters for markers */
    	$stmt->bind_param("i", $rid);

    	/* execute query */
    	$stmt->execute();
    	
    	mysqli_stmt_bind_result($stmt, $bid);
    	
    	while (mysqli_stmt_fetch($stmt)) {
        $data[] = $bid;
    	}
    	
    	/* close query statement */
    	$stmt->close();
	}
	
	/* encode in json for data transfer to iOS app */
	echo json_encode($data);

	
	/* terminate db connection */
 	$mysqli->close();

?>
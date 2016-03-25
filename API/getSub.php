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
	/* prepare query - get all subcategory ids for a specific category */
	if ($stmt = $mysqli->prepare("SELECT sid FROM reuse_subcat WHERE rid=?")) {
	
    	/* bind parameters for markers */
    	$stmt->bind_param("s", $rid);

    	/* execute query */
    	$stmt->execute();
    	
    	mysqli_stmt_bind_result($stmt, $sid);
    	
    	while (mysqli_stmt_fetch($stmt)) {
        	$data[] = $sid;
    	}
    	
    	/* close statement */
    	$stmt->close();
	}

	/* create output array */
	$output = array();
	$j = 0;
	
	/* step through ids retrieving names */
	for($i = 0; $i < sizeof($data);$i++){

		$sid = $data[$i];

		$stmt = $mysqli->stmt_init();
		/* prepare query - get all subcategory names using above obtained ids */
		if ($stmt = $mysqli->prepare("SELECT itemSub FROM reuseSubcategory WHERE subcatID=?")) {
	
			/* bind parameters for markers */
    		$stmt->bind_param("i", $sid);
    		
    		/* execute query */
    		$stmt->execute();
    		
    		mysqli_stmt_bind_result($stmt, $itemSub);
    	
    		
    		while (mysqli_stmt_fetch($stmt)) {
        		
        		$output[$j]["subcatID"] = $sid;
        		$output[$j]["itemSub"] = $itemSub;
        		$j = $j+1;
    		}
    	
    		/* close statement */
    		$stmt->close();
		} else { echo "here";}
	
	}	
	
	/* encode for json transmission to app */
	echo json_encode($output);

	/* terminate db connection */
 	$mysqli->close();

?>
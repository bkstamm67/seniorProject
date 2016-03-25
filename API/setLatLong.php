<?php
	/*
		Travis Boaz, boazt@oregonstate.edu
		Brian Stamm, stammbr@oregonstate.edu
		Andrew Kasnevich, kasnevia@oregonstate.edu
		CS 419 Winter 2016 - Group 2
		February 28, 2016
	*/
	
	/*
		This application is intended as a helper application to populate the lattitude and 
		longitude fields of the businesses entered via scrip at database initiation. These 
		values will have to be calculated at each business data entry once the database has
		been established.
		
		This API call should ONLY be available during intial set-up of database as it creates
		a security issue whereby anyone making the call could tie up the database and over 
		utilize the Google Maps API resulting in denial of service.
	*/	
	
	/*
		STILL BUGGY CAN ONLY RUN ONCE A DAY DUE TO GOOGLE MAPS DAILY LIMIT
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
	
	/* request ALL data from business */
	$query = "SELECT * FROM business";

	/* execute query  and get results */
	$result = $mysqli->query($query);
	
	/* fetch the results into an array */
	while($row = $result -> fetch_assoc()){
		$data[] = $row;
	}
	
	/* close query statement */
	$result->close();

	/* encode */
	$jsonedData = json_encode($data, JSON_PARTIAL_OUTPUT_ON_ERROR);


	/* decode */
	$json = json_decode($jsonedData, true);
	
	/* establish array to segregate business */
	$unlocated = array();
	
	/* Google Maps API url building blocks */
	$base = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=";
	$key = "&key=";  //KEY NEEDS TO BE INSERTED HERE

	/* step through all businesses */
	for($i = 0; $i < sizeof($json);$i++)
	{
		
		//$mysqli->query("UPDATE business SET longitude=0, latitude=0 WHERE business_id=$i");
		
		/* check if a business has a address */
		if (strcmp($json[$i]["address"], "") !== 0) {
			
			/* check if address is atypical i.e. PO Box */
			if (ord($json[$i]["address"]) < 58 && ord($json[$i]["address"]) > 47) {
				
				/* check if lat and long are missing for businesses that should have them */
				if ((strcmp($json[$i]["latitude"], "0") == 0) || (strcmp($json[$i]["longitude"], "0") == 0)){
						
					/*strip address of offending charachters and build url */		
					$str = $json[$i]["address"];
					$str = str_replace(' ', '+', $str);
					$str = str_replace('/', '+', $str);
					$str = str_replace(',', "", $str);
					$str = str_replace('#', "", $str);
					$str = str_replace('.', "", $str);
					$city = $json[$i]["city"];
					$state = $json[$i]["state"];
					$plus = "+";
					$address = "{$base}{$str}{$plus}{$city}{$plus}{$state}{$key}";
					
					//echo $address;
					//echo "<br>";
					
					/* send Google Maps API call */
					$jsonLatLong = file_get_contents($address);
					
					/* decode results */
					$decoded = json_decode($jsonLatLong, true);
				
					/* parse desired values */
					$lat = $decoded[results][0][geometry][location][lat];
					$long = $decoded[results][0][geometry][location][lng];
				
					//$lat = 0;
					//$long = 0;
					
					/* id starts from 1 not 0 in DB */
					$id = $json[$i]["business_id"];
				
					/* prepare statement to update each business latitude and longitude */
					if ($stmt = $mysqli->prepare("UPDATE business SET longitude=?, latitude=? WHERE business_id=?")) {

    					/* bind parameters for markers */
    					$stmt->bind_param("ddi", $long, $lat, $id);

						/* execute update */
    					$stmt->execute();
    	
    					/* error ? */
   		 				if ($stmt->errno) {
  							echo "FAILURE!!! " . $stmt->error;
						}
						
						/* close statement */
    					$stmt->close();
					}
					
					echo $lat; 
					echo ", ";
					echo $long;
					echo "<br>";
					
				
				}
			}		
		}
	}
 
 	/* close db connection */
 	$mysqli->close();

?>
<?php
/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding js, html file is business.js & business.html  
*************************/
//Needed to connect to db
include('connect.php');
ini_set('display_errors', 'On');
header('Content-Type: application/json');
$action=$_POST["action"];
$source = array();

switch ($action) {
    //This returns a specific business to the .js file
    case 'all':
        $id=$_POST["id"];
        $query = $mysqli->query("SELECT business_id, name, address, city, state, telephone, website, notes FROM business WHERE business_id='$id';");
        $row=mysqli_fetch_assoc($query);
        array_push($source, $row['name'], $row['address'], $row['city'], $row['state'], $row['telephone'], $row['website'], $row['notes'], $row['business_id']);
        echo json_encode($source);
        break;
    
    //This returns all the businesses and their ids to the .js file
    case 'list':
        $query = $mysqli->query("SELECT business_id, name FROM business;");
        while($row = mysqli_fetch_array($query)){
            array_push($source, $row['business_id'], $row['name']);
        }
        echo json_encode($source, JSON_UNESCAPED_SLASHES); 
        break;

    //This creates a new business and returns the status of the INSERT to the .js file
    case 'create':
        $business=$_POST["business"];
        $address=$_POST["address"];
        $city=$_POST["city"];
        $state=$_POST["state"];
        $telephone=$_POST["telephone"];
        $website=$_POST["website"];
        $notes=$_POST["notes"];
        //Needed in case there are any special characters
        $business = $mysqli->real_escape_string($business);
        $address = $mysqli->real_escape_string($address);
        $city = $mysqli->real_escape_string($city);
        $notes = $mysqli->real_escape_string($notes);
        
        $query = $mysqli->query("INSERT into business(name, address, city, state, telephone, website, notes) values ('$business', '$address', '$city', '$state', '$telephone', '$website', '$notes');");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //This edits a business and returns the status of the UPDATE to the .js file
    case 'edit':
        $id=$_POST["id"];
        $business=$_POST["business"];
        $address=$_POST["address"];
        $city=$_POST["city"];
        $state=$_POST["state"];
        $telephone=$_POST["telephone"];
        $website=$_POST["website"];
        $notes=$_POST["notes"];

        $business = $mysqli->real_escape_string($business);
        $address = $mysqli->real_escape_string($address);
        $city = $mysqli->real_escape_string($city);
        $notes = $mysqli->real_escape_string($notes);

        $query = $mysqli->query("UPDATE business SET name='$business', address='$address', city='$city', state='$state', telephone='$telephone', website='$website', notes='$notes' WHERE business_id='$id';");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //This deletes a business and returns the status of the DELETE to the .js file
    case 'delete':
        $id=$_POST["id"];
        $query = $mysqli->query("DELETE FROM business WHERE business_id='$id';");

        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //Something unknown has happened
    default:
        echo json_encode("Unknown error in PHP file!");

}
?>


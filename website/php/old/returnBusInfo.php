<?php

include('connect.php');

//header('Content-Type: application/json');
//$source = array();
$array = array();
$id=$_POST["id"];
$query = $mysqli->query("SELECT business_id, name, address, city, state, telephone, website, notes FROM business WHERE business_id='$id';");
//$array = mysqli_fetch_row($query)

//while($row=mysqli_fetch_assoc($query)){
//    $array[] = $row['name'];
//}

$row=mysqli_fetch_assoc($query);
array_push($array, $row['name'], $row['address'], $row['city'], $row['state'], $row['telephone'], $row['website'], $row['notes'], $row['business_id']);


//while($row = mysqli_fetch_array($query)){
    //array_push($source, $row['business_id'], $row['name']);
    //print_r($source);
//}
//$array = mysqli_fetch_all($query);
//if(!($stmt = $mysqli->prepare("SELECT * FROM adminUser WHERE userName='$user' AND password='$pass';"))){
    //echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
//}

//if(!$stmt->execute()){
    //echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
//}
//if(!$stmt->bind_result($name)){
    //echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
//}

//while($stmt->fetch()){
    //array_push($source, $row['userName'], $row['password']);
//}
//$stmt->close();
/*
//Executes query
$results = $mysqli_query('SELECT userName, password FROM adminUser;') or die(mysql_error());
$source = array();

//Build source string

*/
echo json_encode($array);
?>
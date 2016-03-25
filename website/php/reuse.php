<?php
/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding js, html file is reuse.js & reuse.html  
*************************/
include('connect.php');
ini_set('display_errors', 'On');
header('Content-Type: application/json');
$action=$_POST["action"];
$source = array();

switch ($action) {
    //This returns a specific reuse category to the .js file
    case 'all':
        $id=$_POST["id"];
        $query = $mysqli->query("SELECT reuseID, item, notes FROM reuse WHERE reuseID='$id';");
        $row=mysqli_fetch_assoc($query);
        array_push($source, $row['reuseID'], $row['item'], $row['notes']);
        echo json_encode($source);
        break;

    //This returns all the reuse categories and their ids to the .js file
    case 'list':
        $query = $mysqli->query("SELECT item, reuseID FROM reuse;");
        while($row = mysqli_fetch_array($query)){
            array_push($source, $row['reuseID'], $row['item']);
        }
        echo json_encode($source);
        break;
    
    //This creates a new category and returns the status of the INSERT to the .js file
    case 'create':
        $item=$_POST["item"];
        $notes=$_POST["notes"];
        //Needed in case there are any special characters
        $item = $mysqli->real_escape_string($item);
        $notes = $mysqli->real_escape_string($notes);

        $query = $mysqli->query("INSERT into reuse (item, notes) values ('$item', '$notes');");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //This edits a reuse category and returns the status of the UPDATE to the .js file
    case 'edit':
        $id=$_POST["id"];
        $item=$_POST["item"];
        $notes=$_POST["notes"];
        $item = $mysqli->real_escape_string($item);
        $notes = $mysqli->real_escape_string($notes);
        
        $query = $mysqli->query("UPDATE reuse SET item='$item', notes='$notes' WHERE reuseID='$id';");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //This deletes a reuse and returns the status of the DELETE to the .js file
    case 'delete':
        $id=$_POST["id"];
        $query = $mysqli->query("DELETE FROM reuse WHERE reuseID='$id';");
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
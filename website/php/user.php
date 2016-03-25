<?php
/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding js, html file is userAction.js & user.html  
*************************/
include('connect.php');
ini_set('display_errors', 'On');
header('Content-Type: application/json');
$action=$_POST["action"];
$source = array();

switch ($action) {
    //This returns a specific user to the .js file
    case 'all':
        $id=$_POST["id"];
        $query = $mysqli->query("SELECT userID, fName, lName, userName, password, email FROM adminUser WHERE userID='$id';");
        $row=mysqli_fetch_assoc($query);
        array_push($source, $row['userID'], $row['fName'], $row['lName'], $row['userName'], $row['password'], $row['email']);
        echo json_encode($source);
        break;
    
    //This returns all the user and their ids to the .js file
    case 'list':
        $query = $mysqli->query("SELECT userName, userID FROM adminUser;");
        while($row = mysqli_fetch_array($query)){
            array_push($source, $row['userID'], $row['userName']);
        }
        echo json_encode($source);
        break;

    //This creates a new business and returns the status of the INSERT to the .js file
    case 'create':
        $first=$_POST["first"];
        $last=$_POST["last"];
        $user=$_POST["user"];
        $pass=$_POST["pass"];
        $email=$_POST["email"];
        //Needed in case there are any special characters
        $first = $mysqli->real_escape_string($first);
        $last = $mysqli->real_escape_string($last);
        $user = $mysqli->real_escape_string($user);
        $pass = $mysqli->real_escape_string($pass);
        $email = $mysqli->real_escape_string($email);

        $query = $mysqli->query("INSERT into adminUser (fName, lName, userName, password, email) values ('$first', '$last', '$user', '$pass','$email');");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //This edits a user and returns the status of the UPDATE to the .js file
    case 'edit':
        $id=$_POST["id"];
        $first=$_POST["first"];
        $last=$_POST["last"];
        $user=$_POST["user"];
        $pass=$_POST["pass"];
        $email=$_POST["email"];

        $query = $mysqli->query("UPDATE adminUser SET fName='$first', lName='$last', userName='$user', password='$pass', email='$email' WHERE userID='$id';");
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
        $query = $mysqli->query("DELETE FROM adminUser WHERE userID='$id';");
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
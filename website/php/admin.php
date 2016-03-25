<?php

include('connect.php');

header('Content-Type: application/json');
$action=$_POST["action"];
$source = array();

switch ($action) {
    case 'all':
        $id=$_POST["id"];
        $query = $mysqli->query("SELECT adminID, title, notes, about FROM adminTable WHERE adminID='$id';");
        $row=mysqli_fetch_assoc($query);
        array_push($source, $row['adminID'], $row['title'], $row['notes'], $row['about']);
        echo json_encode($source);
        break;
    
    case 'list':
        $query = $mysqli->query("SELECT title, adminID FROM adminTable;");
        while($row = mysqli_fetch_array($query)){
            array_push($source, $row['adminID'], $row['title']);
        }
        echo json_encode($source);
        break;

    case 'create':
        $title=$_POST["title"];
        $notes=$_POST["notes"];
        $about=$_POST["about"];
        $title = $mysqli->real_escape_string($title);
        $notes = $mysqli->real_escape_string($notes);
        $about = $mysqli->real_escape_string($about);

        $query = $mysqli->query("INSERT into adminTable (title, notes, about) values ('$item', '$notes', '$about');");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    case 'edit':
        $id=$_POST["id"];
        $title=$_POST["title"];
        $notes=$_POST["notes"];
        $about=$_POST["about"];
        $title = $mysqli->real_escape_string($title);
        $notes = $mysqli->real_escape_string($notes);
        $about = $mysqli->real_escape_string($about);
        
        $query = $mysqli->query("UPDATE adminTable SET title='$title', notes='$notes', about='$about' WHERE adminID='$id';");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    case 'delete':
        $id=$_POST["id"];
        $query = $mysqli->query("DELETE FROM adminTable WHERE adminID='$id';");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    default:
        echo json_encode("Unknown error in PHP file!");
}
?>
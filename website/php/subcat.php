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
        $query = $mysqli->query("SELECT subcatID, itemSub, notes FROM reuseSubcategory WHERE subcatID='$id';");
        $row=mysqli_fetch_assoc($query);
        array_push($source, $row['subcatID'], $row['itemSub'], $row['notes']);
        echo json_encode($source);
        break;
    
    //This returns only specific grouping of the reuse subcategories and their ids to the .js file
    case 'list':
        $id=$_POST["id"];
        $query = $mysqli->query("SELECT rsc.itemSub, rsc.subcatID FROM reuseSubcategory AS rsc INNER JOIN reuse_subcat ON rsc.subcatID = reuse_subcat.sid INNER JOIN reuse ON reuse_subcat.rid = reuse.reuseID WHERE reuse.reuseID='$id';");
        while($row = mysqli_fetch_array($query)){
            array_push($source, $row['subcatID'], $row['itemSub']);
        }
        echo json_encode($source);
        break;

    //This returns all the reuse subcategories and their ids to the .js file
    case 'listall':
        $query = $mysqli->query("SELECT subcatID, itemSub FROM reuseSubcategory;");
        while($row = mysqli_fetch_array($query)){
            array_push($source, $row['subcatID'], $row['itemSub']);
        }
        echo json_encode($source);
        break;

    //This creates a new category and returns the status of the INSERT to the .js file
    case 'create':
        $item=$_POST["item"];
        $notes=$_POST["notes"];
        $reuse=$_POST["reuse"];
        $item = $mysqli->real_escape_string($item);
        $notes = $mysqli->real_escape_string($notes);

        $query = $mysqli->query("INSERT into reuseSubcategory (itemSub, notes) values ('$item', '$notes');");
        $query2 = $mysqli->query("INSERT into reuse_subcat (rid, sid) values ('$reuse', (SELECT subcatID FROM reuseSubcategory WHERE itemSub='$item' AND notes='$notes'));");
        if($query && $query2){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //This edits a reuse subcategory and returns the status of the UPDATE to the .js file
    case 'edit':
        $id=$_POST["id"];
        $item=$_POST["item"];
        $notes=$_POST["notes"];
        $item = $mysqli->real_escape_string($item);
        $notes = $mysqli->real_escape_string($notes);
        
        $query = $mysqli->query("UPDATE reuseSubcategory SET itemSub='$item', notes='$notes' WHERE subcatID='$id';");
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
        $query = $mysqli->query("DELETE FROM reuseSubcategory WHERE subcatID='$id';");
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
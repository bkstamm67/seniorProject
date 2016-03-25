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
$reuse = 'reuse';
$repair = 'repair';
$none = 'none';
$source2 = array();
$source3 = array();

switch ($action) {

    //First call to see which categories business is in
    case 'rr':
        $id=$_POST["id"];
        //First query checks reuse & subcategories
        $query = $mysqli->query("SELECT tmp.subcatID, rsc.itemSub, reuse.item FROM (SELECT reuse_bus.subcatID FROM reuse_bus WHERE BID ='$id') AS tmp INNER JOIN reuseSubcategory AS rsc ON rsc.subcatID = tmp.subcatID INNER JOIN reuse_subcat ON reuse_subcat.sid = rsc.subcatID INNER JOIN reuse ON reuse.reuseID = reuse_subcat.rid;");
        //If there is results, returns those
        if(mysqli_num_rows($query)>0){
            array_push($source, $reuse);
            while($row = mysqli_fetch_array($query)){
                array_push($source, $row['subcatID'], $row['item'], $row['itemSub']);
            }
            echo json_encode($source);
            break;
        }
        //If not, then checks REPAIR    
        else{
            $query2 = $mysqli->query("SELECT repairID, item FROM repair INNER JOIN repair_bus ON repair.repairID = repair_bus.rid INNER JOIN business ON business.business_id = repair_bus.bid WHERE bid='$id';");
            if(mysqli_num_rows($query2)>0){
                array_push($source, $repair);
                while($row = mysqli_fetch_array($query2)){
                    array_push($source, $row['repairID'], $row['item']);
                }
                echo json_encode($source);
                break;
            }
            //if not found, sends none
            else{
                array_push($source, $none);
                echo json_encode($source);
                break;
            }
        }
        echo json_encode("FAILURE!");
        break;

    //Adds business to repair cat
    case 'addRepair':
        $bid=$_POST["bid"];
        $rid=$_POST["rid"];
        $query = $mysqli->query("INSERT into repair_bus (bid, rid) values ('$bid', '$rid');");
        if($query){
            echo json_encode("Success");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //Adds to reuse categorie
    case 'addReuse':
        $bid=$_POST["bid"];
        $sid=$_POST["sid"];
        $query = $mysqli->query("INSERT into reuse_bus (bid, subcatID, reuseID) values ('$bid', '$sid', (SELECT rid FROM reuse_subcat WHERE sid='$sid'));");
        if($query){
            echo json_encode("Success!");
        }
        else{
            echo json_encode("FAILURE!");
        }
        
        break;

    //Removes from repair cat
    case 'removeRepair':
        $bid=$_POST["bid"];
        $rid=$_POST["rid"];
        $query = $mysqli->query("DELETE FROM repair_bus WHERE rid='$rid' AND bid='$bid';");
        if($query){
            echo json_encode("Success!");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;

    //Removes from reuse & subcat
    case 'removeReuse':
        $bid=$_POST["bid"];
        $sid=$_POST["sid"];
        $query = $mysqli->query("DELETE FROM reuse_bus WHERE subcatID='$sid' AND bid='$bid';");
        if($query){
            echo json_encode("Success!");
        }
        else{
            echo json_encode("FAILURE!");
        }
        break;
        
    //Unknown error
    default:
        echo json_encode("Unknown error in PHP file!");
}
?>
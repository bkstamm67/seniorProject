/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is repair.php & repair.html  
*************************/

function isOdd(num) { return num % 2;}

//Loading the page, getting the businesses.
$(document).ready(function(){
    //Makes call to DB, gets all repair names and ids, #1
    //holds the id on the html, hidden from user
    $("#hide").hide();
    $.ajax({
        url: "php/repair.php",
        type: "post",
        data:  "action=list",
        success: function(data){
            //creates drop down list
            var repairList = '<select class="form-control" id="repairSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    repairList += "'>"+ val +"</option>";
                } else{
                    repairList += "<option value='" + val;
                }
            });
            repairList += '</select>';
            //Creates button
            repairList += "</br><button class='btn btn-default' id='repairEdit'>Select</button>";
            $('#repairList').html(repairList);

            //Creates event listener for new button
            $("#repairEdit").on("click",function() {
            //Gets value of repair selected
                var id = $("#repairSelect").val();
                console.log(id);
                //Makes call to database, sending repair id, AJAX 2
                $.ajax({
                    url: "php/repair.php",
                    type: "post",
                    dataType: "json",
                    data: "action=all&id="+id,
                    success: function(data){
                        //Gets data & puts in html
                        $("#id").text(data[0]);
                        $("#name").val(data[1]);
                        $("#notes").val(data[2]);
                        event.preventDefault();
                    },
                    error: function(xhr, desc, err){
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError: " + err);
                        alert("There was some error.");   
                    }
                });//End of AJAX 2
            });//End of the event listener
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }  
    }); //End AJAX #1
}); //end of ready

//Event listener for create button
$("#create").on("click", function(event){
    event.preventDefault();
    var name = $("#name").val();
    var notes = $("#notes").val();
    if(name === ''){
        alert("Category needs a name.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/repair.php",
            type: "post",
            data: "action=create&item="+name+"&notes="+notes,
            success: function(data){
                if(data === "Success"){
                    alert("Category successfully created.");
                    location.reload();                
                }
                else{
                    alert("There was an error adding your category.  Please try again.");
                    location.reload();   
                }
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");
            }
        });//End of ajax
    }    
});//done with create

//Event listener for edit button
$("#edit").on("click", function(){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    var notes = $("#notes").val();
    if(id === ''){
        alert("Need to select a category to edit.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/repair.php",
            type: "post",
            dataType: "json",
            data: "action=edit&id="+id+"&item="+name+"&notes="+notes,
            success: function(data){
                if(data === "Success"){
                    alert("Category successfully edited.");
                    location.reload();                
                }
                else{
                    alert("There was an error editing the new category.  Please try again.");
                    location.reload();   
                }
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");
            }
        });//End of ajax
    }    
});//done with edit

//Event listener for delete button
$("#delete").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    if(id === ''){
        alert("Need to select a category to delete.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/repair.php",
            type: "post",
            data: "action=delete&id="+id,
            success: function(data){
                if(data === "Success"){
                    alert("Category successfully deleted.");
                    location.reload();                
                }
                else{
                    alert("There was an error deleting the new category.  Please try again.");
                    location.reload();   
                }
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");
            }
        });//End of ajax
    } 
});//done with delete*/
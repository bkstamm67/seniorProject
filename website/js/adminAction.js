/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is admin.php & admin.html  
*************************/

function isOdd(num) { return num % 2;}

//Loading the page, getting the businesses.
$(document).ready(function(){
   $.ajax({
        url: "php/admin.php",
        type: "post",
        data:  "action=list",
        success: function(data){
            var adminList = '<select class="form-control" id="adminSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    adminList += "'>"+ val +"</option>";
                } else{
                    adminList += "<option value='" + val;
                }
            });
            adminList += '</select>';
            adminList += "</br><button class='btn btn-default' id='adminEdit'>Select</button>";
            $('#adminList').html(adminList);
            $("#adminEdit").on("click",function() {
            //Gets value of admin notes selected
                var id = $("#adminSelect").val();
                //Makes call to database, sending admin note id
                $.ajax({
                    url: "php/admin.php",
                    type: "post",
                    dataType: "json",
                    data: "action=all&id="+id,
                    success: function(data){
                        //Gets data & populates fields
                        $("#id").text(data[0]);
                        $("#name").val(data[1]);
                        $("#notes").val(data[2]);
                        $('#about').val(data[3]);
                        event.preventDefault();
                    },
                    error: function(xhr, desc, err){
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError: " + err);
                        alert("There was some error.");   
                    }
                });
            });
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }  
    }); //End AJAX returnBus
}); //end of ready

//Does the action for creating
$("#create").on("click", function(event){
    event.preventDefault();
    var name = $("#name").val();
    var notes = $("#notes").val();
    var about = $("#about").val();
    $.ajax({
        url: "php/admin.php",
        type: "post",
        data: "action=create&title="+name+"&notes="+notes+"&about="+about,
        success: function(data){
                if(data === "Success"){
                    alert("Admin field successfully created.");
                    location.reload();                
                }
                else{
                    alert("There was an error adding your admin field.  Please try again.");
                    location.reload();   
                }
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");
        }
    });//End of ajax    
});//done with create

//This does the action for editing
$("#edit").on("click", function(){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    var notes = $("#notes").val();
    var about = $("#about").val();
    $.ajax({
        url: "php/admin.php",
        type: "post",
        dataType: "json",
        data: "action=edit&id="+id+"&title="+name+"&notes="+notes+"&about="+about,
        success: function(data){
            if(data === "Success"){
                alert("Admin field successfully edited.");
                location.reload();                
            }
            else{
                alert("There was an error editing your admin field.  Please try again.");
                location.reload();   
            }
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");
        }
    });//End of ajax    
});//done with edit

//Does the deleting
$("#delete").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    $.ajax({
        url: "php/admin.php",
        type: "post",
        data: "action=delete&id="+id,
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
});//done with delete*/
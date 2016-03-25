/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is reuse.php & reuse.html  
*************************/

function isOdd(num) { return num % 2;}

//Loading the page, getting the reuse categories.
$(document).ready(function(){
    //holds the id on the html, hidden from user
    $("#hide").hide();
    //AJAX Call #1
   $.ajax({
        url: "php/reuse.php",
        type: "post",
        data:  "action=list",
        success: function(data){
            //Creates drop down list for categories and button for selecting
            var reuseList = '<select class="form-control" id="reuseSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    reuseList += "'>"+ val +"</option>";
                } else{
                    reuseList += "<option value='" + val;
                }
            });
            reuseList += '</select>';
            reuseList += "</br><button class='btn btn-default' id='reuseEdit'>Select</button>";
            $('#reuseList').html(reuseList);
            
            //Creates listener for the select button
            $("#reuseEdit").on("click",function() {
            //Gets value of business selected
                var id = $("#reuseSelect").val();
                //Makes call to database, sending business name, AJAX #2
                $.ajax({
                    url: "php/reuse.php",
                    type: "post",
                    dataType: "json",
                    data: "action=all&id="+id,
                    success: function(data){
                        //Gets data and fills form with it
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
                });//END OF AJAX #2
            });//End of select button function
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }  
    }); //End AJAX #1 
}); //end of ready

//When user clicks on "Create" button
$("#create").on("click", function(event){
    event.preventDefault();
    var name = $("#name").val();
    var notes = $("#notes").val();
    //Error checking, needs to have a name to create
    if(name === ''){
        alert("Category needs a name.");
        location.reload();
    }
    else{
        //AJAX call #1
        $.ajax({
            url: "php/reuse.php",
            type: "post",
            data: "action=create&item="+name+"&notes="+notes,
            success: function(data){
                if(data === "Success"){
                    alert("Category successfully created.");
                    location.reload();                
                }
                else{
                    alert("There was an error adding the new category.  Please try again.");
                    location.reload();   
                }
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");
            }
        });//End of ajax #1
    }    
});//done with create

//Action when edit button is created, similar to edit
$("#edit").on("click", function(){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    var notes = $("#notes").val();
    if(id === ''){
        alert("Please select a category to edit.")
    }
    else{
        $.ajax({
            url: "php/reuse.php",
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

//Action when delete button is created, similar to edit
$("#delete").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    if(id === ''){
        alert("Please select a category to delete.")
    }
    else{
        $.ajax({
            url: "php/reuse.php",
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
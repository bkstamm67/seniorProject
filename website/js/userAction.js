/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is user.php & user.html  
*************************/
function isOdd(num) { return num % 2;}

//Loading the page, getting the users.
$(document).ready(function(){
    //holds the id on the html, hidden from user
    $("#hide").hide();
    //AJAX #1, gets user name
    $.ajax({
        url: "php/user.php",
        type: "post",
        data:  "action=list",
        success: function(data){
            //Builds drop down list
            var userList = '<select class="form-control" id="userSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    userList += "'>"+ val +"</option>";
                } else{
                    userList += "<option value='" + val;
                }
            });
            userList += '</select>';
            //Creates button to select user
            userList += "</br><button class='btn btn-default' id='userEdit'>Select</button>";
            $('#userList').html(userList);

            //Event listener when button selected
            $("#userEdit").on("click",function() {
            //Gets value of user selected
                var id = $("#userSelect").val();
                //Makes call to database, sending business name, AJAX #2
                $.ajax({
                    url: "php/user.php",
                    type: "post",
                    dataType: "json",
                    data: "action=all&id="+id,
                    success: function(data){
                        //Gets data & fills html form
                        $("#id").text(data[0]);
                        $("#fname").val(data[1]);
                        $("#lname").val(data[2]);
                        $('#userName').val(data[3]);
                        $('#password').val(data[4]);
                        $('#email').val(data[5]);
                        event.preventDefault();
                    },
                    error: function(xhr, desc, err){
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError: " + err);
                        alert("There was some error.");   
                    }
                });//End of AJAX #2
            });//end of Event listener
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }  
    }); //End AJAX #2 
}); //end of ready

//Function when Create is clicked
$("#create").on("click", function(event){
    event.preventDefault();
    //Gets values
    var first = $("#fname").val();
    var last = $("#lname").val();
    var user = $('#userName').val();
    var pass = $('#password').val();
    var email = $('#email').val();
    //Needs a user name and password, throws error
    if(user === '' || pass === ''){
        alert("User needs a name and/or password.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/user.php",
            type: "post",
            data: "action=create&first="+first+"&last="+last+"&user="+user+"&pass="+pass+"&email="+email,
            success: function(data){
                if(data === "Success"){
                    alert("User successfully created.");
                    location.reload();                
                }
                else{
                    alert("There was an error adding the user.  Please try again.");
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

//Action for the edit button
$("#edit").on("click", function(){
    event.preventDefault();
    var id = $("#id").text();
    var first = $("#fname").val();
    var last = $("#lname").val();
    var user = $('#userName').val();
    var pass = $('#password').val();
    var email = $('#email').val();
    //Error checking
    if(id === ''){
        alert("User needs to be selected.");
        location.reload();
    }
    else{
        if(user === '' || pass === ''){
            alert("User needs a name and/or password to be edited.");
            location.reload();
        }
        else{
            //AJAX call
            $.ajax({
                url: "php/user.php",
                type: "post",
                data: "action=edit&id="+id+"&first="+first+"&last="+last+"&user="+user+"&pass="+pass+"&email="+email,
                success: function(data){
                    //Checks result
                    if(data === "Success"){
                        alert("User successfully edited.");
                        location.reload();                
                    }
                    else{
                        console.log(data);
                        alert("There was an error editing the user.  Please try again.");
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
    }    
});//done with edit

//Action for the delete button
$("#delete").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    if(id === ''){
        alert("User needs to be selected.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/user.php",
            type: "post",
            data: "action=delete&id="+id,
            success: function(data){
                //Checks response
                if(data === "Success"){
                    alert("User has been successfully deleted.");
                    location.reload();                
                }
                else{
                    alert("There was an error deleting the user.  Please try again.");
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
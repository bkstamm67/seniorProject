/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is business.php & business.html  
*************************/

//function used for building html dynamically
function isOdd(num) { return num % 2;}

//When page is loaded, function fills drop list of businesses
$(document).ready(function() {
    //Makes call to DB, gets all business names and ids, #1
    //holds the id on the html, hidden from user
    $("#hide").hide();
    $.ajax({
        url: "php/business.php",
        type: "post",
        data: "action=list",
        success: function(data) {
            //Creates drop list
            var busList = '<select class="form-control" id="busSelect">';
            //Fills list with busineses and business id
            $.each(data, function(key, val) {
                if (isOdd(key)) {
                    busList += "'>" + val + "</option>";
                } else {
                    busList += "<option value='" + val;
                }
            });
            busList += '</select>';
            //Creates button to select the business
            busList += "</br><button id='busEdit' class='btn btn-default'>Select</button>";
            //Adds to the html
            $('#businessList').html(busList);

            //Creating an action for button when clicked.
            $("#busEdit").on("click", function() {
                //Gets value of business selected
                var id = $("#busSelect").val();
                //Makes call to DB, sending business id #, #2
                $.ajax({
                    url: "php/business.php",
                    type: "post",
                    dataType: "json",
                    data: "action=all&id=" + id,
                    success: function(data) {
                        //Uses data and puts in html form
                        $("#name").val(data[0]);
                        $("#address").val(data[1]);
                        $("#city").val(data[2]);
                        $("#telephone").val(data[4]);
                        $("#website").val(data[5]);
                        $("#notes").val(data[6]);
                        $("#id").text(data[7]);
                        event.preventDefault();
                    },
                    error: function(xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError: " + err);
                        alert("There was some error.");
                    }
                }); //end of ajax #2 
            }); //End of busEdit click
        },
        error: function(xhr, desc, err) {
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");
        }
    });//End of Ajax #1
}); //end of ready

//When user clicks the "Create" button
$("#create").on("click", function(event){
    event.preventDefault();
    var name = $("#name").val();
    var address = $("#address").val();
    var city = $("#city").val();
    var state = $("#state").val();
    var telephone = $("#telephone").val();
    var website = $("#website").text();
    var notes = $("#notes").val();
    if(name === ''){
        alert("Business needs a name.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/business.php",
            type: "post",
            data: "action=create&business="+name+"&address="+address+"&city="+city+"&state="+state+"&telephone="+telephone+"&website="+website+"&notes="+notes,
            success: function(response, status){
                if(response === "Success"){
                    //console.log("Message response:  " + response);
                    alert("Business successfully created.");
                    location.reload();                
                }
                else{
                    alert("There was an error adding your busineses.  Please try again.");
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

//When user clicks on the edit button
$("#edit").on("click", function(){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    var address = $("#address").val();
    var city = $("#city").val();
    var state = $("#state").val();
    var telephone = $("#telephone").val();
    var website = $("#website").val();
    var notes = $("#notes").val();
    //If there was no id, then a business was not selected, reload page.
    if (id === ""){
        alert("No business was selected, please try again.");
        location.reload();        
    }
    //Makes AJAX call to db
    $.ajax({
        url: "php/business.php",
        type: "post",
        data: "action=edit&id="+id+"&business="+name+"&address="+address+"&city="+city+"&state="+state+"&telephone="+telephone+"&website="+website+"&notes="+notes,
        success: function(response, status){
            //Notifies user about result
            if(response === "Success"){
                alert("Business successfully editted.");
                location.reload();
            }
            else{
                alert("There was an error submitting those changes.");
                location.reload();                
            }   
        },
        //Error connecting
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");
        }
    });//End of ajax    
});//done with edit

//When user clicks on Delete button
$("#delete").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    //If there was no id, then a business was not selected, reload page.
    if (id === ""){
        alert("No business was selected, please try again.");
        location.reload();        
    }
    //AJAX call to DB
    $.ajax({
        url: "php/business.php",
        type: "post",
        data: "action=delete&id="+id,
        success: function(response, status){
            //Notifies user about result
            if(response === "Success"){
                alert(name + "was successfully deleted.");
                location.reload();
            }
            else{
                alert("There was an error deleting" + name);
                location.reload();                
            }  
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");
        }
    });//End of ajax 
});//done with delete

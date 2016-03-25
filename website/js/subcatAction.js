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
    $("#createList").hide();
   //AJAX #1
   $.ajax({ 
        url: "php/reuse.php",
        type: "post",
        data:  "action=list",
        success: function(data){
            //creates drop down list for the reuse categories
            var reuseList = '<select class="form-control" id="reuseSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    reuseList += "'>"+ val +"</option>";
                } else{
                    reuseList += "<option value='" + val;
                }
            });
            reuseList += '</select>';
            //Creates button to specify a reuse category
            reuseList += "</br><button class='btn btn-default' id='reuseEdit'>Select Reuse</button>";
            $('#reuseList').html(reuseList);

            //Creates event listener for button
            $("#reuseEdit").on("click",function() {
                //Gets value of categeory selected
                var id = $("#reuseSelect").val();
                //Makes call to database, sending category id - AJAX 2
                $.ajax({
                    url: "php/subcat.php",
                    type: "post",
                    dataType: "json",
                    data: "action=list&id="+id,
                    success: function(data){
                        //Gets data, creates another drop down list
                        var subList = '<select class="form-control" id="subSelect">';
                        $.each(data, function(key, val){
                            if(isOdd(key)){
                                subList += "'>"+ val +"</option>";
                            } else{
                                subList += "<option value='" + val;
                            }
                        });
                        subList += '</select>';
                        //Creates a button to select subcat
                        subList += "</br><button class='btn btn-default' id='subEdit'>Select Subcategory</button>";
                        $('#subList').html(subList);

                        //Event listener for button
                        $('#subEdit').on("click", function(){
                            var id = $("#subSelect").val();
                            //AJAX #3 - Fills dropdown list that applies only to category selected
                            $.ajax({
                                url: "php/subcat.php",
                                type: "post",
                                dataType: "json",
                                data: "action=all&id="+id,
                                success: function(data){
                                    //Fills html form
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
                            });//end of sub AJAX #3
                        });//End of subEdit click
                    },
                    error: function(xhr, desc, err){
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError: " + err);
                        alert("There was some error.");   
                    }
                }); //End of AJAX 2
            }); //End of Category event listener
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }  
    }); //End AJAX #1 returnBus
   //AJAX #4 - this is the initial list created of the subcategories - has all at first
   $.ajax({
        url: "php/subcat.php",
        type: "post",
        dataType: "json",
        data: "action=listall",
        success: function(data){
            //Gets data - fills drop down list
            var subList = '<select class="form-control" id="subSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    subList += "'>"+ val +"</option>";
                } else{
                    subList += "<option value='" + val;
                }
            });
            subList += '</select>';
            //Creates button, same as above (which it will be replaced)
            subList += "</br><button class='btn btn-default' id='subEdit'>Select Subcategory</button>";
            $('#subList').html(subList);

            //Event listener for button
            $('#subEdit').on("click", function(){
                var id = $("#subSelect").val();
                //AJAX #5
                $.ajax({
                    url: "php/subcat.php",
                    type: "post",
                    dataType: "json",
                    data: "action=all&id="+id,
                    success: function(data){
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
                });//end of AJAX #5
            });//End of subEdit click
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }
   });//end of ajax #4
}); //end of ready

//Create listener
$("#create").on("click", function(event){
    event.preventDefault();
    //Shows new section
    $('#createList').show();
    //Gets the list of Reuse categories, AJAX #1
    $.ajax({
        url: "php/reuse.php",
        type: "post",
        data:  "action=list",
        success: function(data){
            var createReuseList = '<select class="form-control" id="crl">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    createReuseList += "'>"+ val +"</option>";
                } else{
                    createReuseList += "<option value='" + val;
                }
            });
            createReuseList += '</select>';
            //Creates button to select category
            createReuseList += "</br><button class='btn btn-default' id='finalCreate'>Finish Create</button>";
            $('#createReuseList').html(createReuseList);

            //Event listener
            $("#finalCreate").on("click", function(event){
                event.preventDefault();
                var name = $("#name").val();
                var notes = $("#notes").val();
                var reuse = $("#crl").val();
                if(name === ''){
                    alert("Category needs a name.");
                    location.reload();
                }
                else{
                    $.ajax({
                        url: "php/subcat.php",
                        type: "post",
                        data: "action=create&item="+name+"&notes="+notes+"&reuse="+reuse,
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
                    });//End of ajax
                }    
            });//finished finalClick button
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");
        }
    });
});//done with create

//Edit event listener
$("#edit").on("click", function(){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    var notes = $("#notes").val();
    if(id === ''){
        alert("Please select a category to edit.");
        location.reload();
    }
    else{
        if(name === ''){
            alert("Category needs a name.");
            location.reload();
        }
        else{
            $.ajax({
                url: "php/subcat.php",
                type: "post",
                dataType: "json",
                data: "action=edit&id="+id+"&item="+name+"&notes="+notes,
                success: function(data){
                    if(data === "Success"){
                        alert("Category successfully edited.");
                        location.reload();                
                    }
                    else{
                        alert("There was an error editing the category.  Please try again.");
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

//Delete event listener
$("#delete").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    var name = $("#name").val();
    if(id === ''){
        alert("Please select a category to delete.");
        location.reload();
    }
    else{
        $.ajax({
            url: "php/subcat.php",
            type: "post",
            data: "action=delete&id="+id,
            success: function(data){
                    if(data === "Success"){
                        alert("Category successfully deleted.");
                        location.reload();                
                    }
                    else{
                        alert("There was an error deleting the category.  Please try again.");
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
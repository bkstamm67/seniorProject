/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is relation.php & relationship.html  
*************************/

function isOdd(num) { return num % 2;}

//Loading the page, getting the businesses.
$(document).ready(function(){
    $("#hide").hide();
    //AJAX call 1 - call to business.php, get businesses for drop down
    $.ajax({
        url: "php/business.php",
        type: "post",
        data: "action=list",
        success: function(data){
            //Create drop down
            var busList = '<select class="form-control" id="busSelect">';
            $.each(data, function(key, val){
                if(isOdd(key)){
                    busList += "'>"+ val +"</option>";
                } else{
                    busList += "<option value='" + val + "' id='"+val;
                }
            });
            busList += '</select>';
            //Create button to select
            busList += "</br><button class='btn btn-default' id='busEdit'>Select</button>";
            $('#businessList').html(busList);
            
            //Event listener for button
            $("#busEdit").on("click",function() {
                //Gets value of business selected
                var id = $("#busSelect").val();
                var ans = "#"+id;
                var name = $(ans).text();
                $("#id").text(id);
                $("#name").text(name);
                //AJAX #2 - gets the categories of the business
                $.ajax({
                    url: "php/relation.php",
                    type: "post",
                    dataType: "json",
                    data: "action=rr&id="+id,
                    success: function(data){
                        //Gets data - if reuse, creates one drop down list
                        if(data[0] === 'reuse'){
                            //Creates list - special id so can tell which selected
                            var bigList = '<select class="form-control" id="removeReuseSelect">';
                            $.each(data, function(key, val){
                                //Sends value of subcat and reuse
                                if(key != 0){
                                    if(key%3 == 0){
                                        bigList += val + "</option>"
                                    }
                                    if(key%3 ==1){
                                        bigList += "<option value='" + val;
                                    }
                                    if(key%3 == 2){
                                        bigList += "'>" + val +", ";
                                    } 
                                }
                            });
                            bigList += '</select>';
                            $('#bigList').html(bigList);
                        }
                        //Does same for repair
                        else if(data[0] === 'repair'){
                            var bigList = '<select class="form-control" id="removeRepairSelect">';
                            $.each(data, function(key, val){
                                if(key != 0){
                                    if(isOdd(key)){
                                        bigList += "<option value='" + val + "' id='"+val;
                                    } else{
                                        bigList += "'>"+ val +"</option>";
                                    }
                                }
                            });
                            bigList += '</select>';
                            $('#bigList').html(bigList);
                        }//end of else if
                        else{
                            var list = "<p>Business is not currently listed with any categories.</p>";
                            $("#bigList").html(list);
                        }
                        event.preventDefault();
                    },
                    error: function(xhr, desc, err){
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError: " + err);
                        alert("There was some error.");   
                    }
                }); //End of AJAX 2
            });
        },
        error: function(xhr, desc, err){
            console.log(xhr);
            console.log("Details: " + desc + "\nError: " + err);
            alert("There was some error.");   
        }  
    }); //End AJAX 1 returnBus
}); //end of ready

//Radio button listener
$("input[name=cat]:radio").on("click", function(event){
    //Gets value
    if($(this).val() == "reuse"){
        //Remove in case of refresh or user pic -REUSE SECTION
        $("#repairSelect").remove();
        $("#addRepairButton").remove();
        //AJAX for reuse cats
        $.ajax({
            url: "php/reuse.php",
            type: "post",
            data:  "action=list",
            success: function(data){
                //Creates drop down
                var reuseList = '<select class="form-control" id="reuseSelect">';
                $.each(data, function(key, val){
                    if(isOdd(key)){
                        reuseList += "'>"+ val +"</option>";
                    } else{
                        reuseList += "<option value='" + val;
                    }
                });
                reuseList += '</select>';
                //Button to select category
                reuseList += "</br><button class='btn btn-default' id='reuseAddButton'>Select Main Category</button>";
                $('#reuseAdd').html(reuseList);

                //Event listener REUSE
                $("#reuseAddButton").on("click", function(event){
                    event.preventDefault();
                    var main = $("#reuseSelect").val();
                    //AJAX #2
                    $.ajax({
                        url: "php/subcat.php",
                        type: "post",
                        dataType: "json",
                        data: "action=list&id="+main,
                        success: function(data){
                            //Gets subcategory
                            var subList = '<select class="form-control" id="subSelect">';
                            $.each(data, function(key, val){
                                if(isOdd(key)){
                                    subList += "'>"+ val +"</option>";
                                } else{
                                    subList += "<option value='" + val;
                                }
                            });
                            subList += '</select>';
                            //Create button to select
                            subList += "</br><button class='btn btn-default' id='subAdd'>Select</button>";
                            //Put on top of previous (to prevent user error)
                            $('#reuseAdd').html(subList);

                            //Event listener, adds reuse/subcat to business
                            $("#subAdd").on("click", function(event){
                                event.preventDefault();
                                var sub = $("#subSelect").val();
                                var test = $("#id").text();
                                //Makes sure user selected a business
                                if(test){
                                    $.ajax({
                                        url: "php/relation.php",
                                        type: "post",
                                        data: "action=addReuse&bid="+test+"&sid="+sub,
                                        success: function(data){
                                            if(data === "Success"){
                                                alert("Category successfully added to business.");
                                                location.reload();                
                                            }
                                            else{
                                                alert("There was an error adding the category to the business.  Please try again.");
                                                location.reload();   
                                            }
                                        },
                                        error: function(xhr, desc, err){
                                            console.log(xhr);
                                            console.log("Details: " + desc + "\nError: " + err);
                                            alert("There was some error.");   
                                        }
                                    });///End of ajax
                                }//End of test if statement
                                else{
                                    alert("You must select a business to add to this category first.");
                                }
                            });//End of subAdd click function
                        },
                        error: function(xhr, desc, err){
                            console.log(xhr);
                            console.log("Details: " + desc + "\nError: " + err);
                            alert("There was some error.");    
                        }
                    });//End of reuseMainAddButton AJAX

                });//End of reuseMainAddButton click function
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");
            }
        });//End of Ajax
    }//End of if statement

    //REPAIR SECTION
    else{
        //Removes reuse buttons/lists
        $("#subAdd").remove();
        $("#subSelect").remove();
        $("#reuseSelect").remove();
        $("#reuseAddButton").remove();
        //AJAX 1 to get repair cats
        $.ajax({
            url: "php/repair.php",
            type: "post",
            data:  "action=list",
            success: function(data){
                //Creates drop down
                var repairList = '<select class="form-control" id="repairSelect">';
                console.log("Data: " + data);
                $.each(data, function(key, val){
                    if(isOdd(key)){
                        repairList += "'>"+ val +"</option>";
                    } else{
                        repairList += "<option value='" + val;
                    }
                });
                repairList += '</select>';
                //Creates button for selecting
                repairList += "</br><button class='btn btn-default' id='addRepairButton'>Add</button>";
                $("#repairAdd").html(repairList);

                //Event listener for button
                $("#addRepairButton").on("click", function(event){
                    event.preventDefault();
                    //Makes sure user picked a business
                    var test = $("#id").text();
                    if(test){
                        var rid = $("#repairSelect").val();
                        //AJAX 2 adds business to repair
                        $.ajax({
                            url: "php/relation.php",
                            type: "post",
                            data: "action=addRepair&bid="+test+"&rid="+rid,
                            success: function(data){
                                if(data === "Success"){
                                    alert("The category was successfully added.");
                                    location.reload();
                                }
                                else{
                                    alert("There was some error in submitting.");
                                    location.reload();
                                }
                            },
                            error: function(xhr, desc, err){
                                console.log(xhr);
                                console.log("Details: " + desc + "\nError: " + err);
                                alert("There was some error.");   
                            }
                        });///End of ajax
                    }
                    else{
                        alert("You must select a business to add to this category first.");
                    }
                })//End of addrepairbutton
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");   
            }
        });//End of AJAX
    }//End of else  
});//end of reuseAddRadio

//Remove button listener
$("#remove").on("click", function(event){
    event.preventDefault();
    var id = $("#id").text();
    var repairName = $("#removeRepairSelect").val();
    var reuseName = $("#removeReuseSelect").val();
    var business = $("#name").text();
    //Checks which category (reuse / repair) is to be removed
    if(repairName != undefined){
        //AJAX -1
        $.ajax({
            url: "php/relation.php",
            type: "post",
            data: "action=removeRepair&bid="+id+"&rid="+repairName,
            success: function(data){
                alert(business + " was successfully removed from that repair category.");
                location.reload();
            },
            error: function(xhr, desc, err){
                console.log(xhr);
                console.log("Details: " + desc + "\nError: " + err);
                alert("There was some error.");   
                }
            });///End of ajax 1
    }
    else{
        //REUSE Selection
        if(reuseName != undefined){
            //Ajax 2
            $.ajax({
                url: "php/relation.php",
                type: "post",
                data: "action=removeReuse&bid="+id+"&sid="+reuseName,
                success: function(data){
                    console.log("YAY!");
                    console.log("Data: " + data);
                    alert(business + " was successfully removed from that reuse category.");
                    location.reload();
                },
                error: function(xhr, desc, err){
                    console.log(xhr);
                    console.log("Details: " + desc + "\nError: " + err);
                    alert("There was some error.");   
                }
            });///End of ajax 2
        }//end of if
        else{
            alert("A business needs to be selected first.");
        }//end of else   
    }//end of else, catching reuse ajax call & no selection
});//End of remove event listener.
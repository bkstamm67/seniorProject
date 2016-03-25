/*************************
Names:  Travis Boaz, Andrew Kasnevich, Brian Stamm
Group:  2
Assignment:  Final Project  Reuse & Repair App
Date:  3.17.16
Notes:  Corresponding php, html file is business.php & business.html  
*************************/
$(function(){
    $("form").submit(function(event) {
        //Basic error handling, check if user name and password are entered
        event.preventDefault();
        if(validate()){
            var user = $("#userName").val();
            var pass = $("#password").val();
            
            //Go to php file, sending username and password
            $.ajax({
                url: "php/login.php",
                type: "post",
                data: "userName="+user+"&pass="+pass,
                success: function(response, status){
                    if(response === "bad"){
                        event.preventDefault();
                        alert("The user name and/or password was incorrect.  Please try again.");
                    }
                    if(response === 'good'){
                        window.location= 'menu.html';
                    }
                },
                error: function(xhr, desc, err) {
                    event.preventDefault();
                    alert("There was some error.");
                }
            });//end of ajax call
        }
    })
})
//Makes sure that a value is submitted for both password and username
validate = function(){
    if($("#userName").val() === ''){
        alert("Please type in a user name.");
        return false;           
    }
    else{
        if($("#password").val() === ''){
            alert("Please type in a password.");
            return false;
        }
    }
    return true; 
} 

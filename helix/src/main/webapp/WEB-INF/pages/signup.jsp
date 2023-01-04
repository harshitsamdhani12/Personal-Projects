<html>
<link rel = "shortcut icon" type = "image/png" href = "static/images/favicon.png"/>
<link rel = "shortcut icon" type = "image/png" href = "static/images/apple-touch-icon.png"/>
   <head>

        <script
         src="https://code.jquery.com/jquery-3.6.0.min.js"
         integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
         crossorigin="anonymous"></script>

          <meta charset="utf-8" />
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
          />
          <meta name="description" content="" />
          <title>Samdhani - Authentication</title>

          <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
          />

   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
      <style>
      html,
      body {
        height: 100%;
      }
      body {
        height: 100vh;
        align-items: center;
        background-color: #f5f5f5;
        width: 100%;
        max-width: 360px;
        margin: 0 auto;
      }

      .btn-primary {
        background-color: #5000ff;
      }
      .btn-primary:hover {
        background-color: #4d02ee;
      }

      .error-text {
        text-align: center;
        color: #ff0000;
      }

      .links {
        text-align: right;
        margin-top: 1rem;
      }

      .links a {
        margin-top: 0.5rem;
      }

      .content {
        margin-top: 6rem;
        padding: 1rem;
      }

      .my-2 {
        margin-top: 2rem !important;
        margin-bottom: 2rem !important;
      }

      hr.divider {
        text-align: center;
        color: rgba(0, 0, 0, 0.5);
      }

      hr.divider:after {
        content: "Or";
        display: inline-block;
        position: relative;
        top: -14px;
        text-align: center;
        padding: 0 16px;
        background-color: #f5f5f5;
      }

      .auth-container {
        padding: 15px;
        margin: 0 auto;
      }

      .auth-container .form-control {
        position: relative;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
      }

      .auth-container input[type="email"] {
        margin-bottom: -1px;
      }
      </style>
   </head>
   <body>
   <!DOCTYPE html>
   <html lang="en">

     <body style="margin:0 auto;">
       <p class="links">
         <a href="/local/signin">Sign in using Email →</a>
       </p>

       <p class="links">
         <a href="/">Sign in using Google →</a>
       </p>

       <div style="margin-top: 5rem">

           <a href="/"
             ><img
               class="mb-4"
               src="https://saasbase-auth-advanced.herokuapp.com/images/saasbase.png"
               alt=""
               width="72"
               height="72"
           /></a>
           <h1 class="h3 mb-3 font-weight-normal">Create Your Account</h1>
           <p class="mb-3 text-muted">
             Welcome to the Social Networks of Coders by Mission Helix
           </p>

           <div class="text-left">
             <div class="form-group">
               <label for="exampleInputEmail1">Name</label>
               <input
                 name="name"
                 type="text"
                 aria-label="name"
                 class="form-control"
                 id ="signup-name"
                 placeholder="Fill Your Name"
                 required
               />
             </div>

             <div class="form-group">
               <label name="email" for="exampleInputEmail1">Email Address</label>
               <input
                 type="email"
                 class="form-control"
                 id="signup-email"
                 name="email"
                 aria-describedby="emailHelp"
                 placeholder="Fill your email"
                 required
               />
               <small id="emailHelp" class="form-text text-muted"
                 >We'll never share your email with anyone else</small
               >
             </div>
             <div class="form-group">
               <label for="exampleInputPassword1">Password</label>
               <input
                 type="password"
                 name="password"
                 class="form-control"
                 id="signup-password"
                 placeholder="********"
                 required
               />
             </div>
             <p style ="color : red  ; display:none" id ="signup-error"> sdhhfdkjhjsdkjhf</p>
           </div>

        <button class="btn btn-primary btn-block" type="submit" id ="btn-signup">Sign Up</button>


           <script>

           function validateSignupForm(){
           var name =$("#signup-name").val();

           var email =$("#signup-email").val();
           var password = $("#signup-password").val();

           var error = "";
           if(!name){
           error+= "Name is empty. ";
           }

           if(!email){
           error+= "Email is empty. ";
           }
           if(!password){
           error+= "Password is empty. ";
           }
           if( password.length <6 ){
           error+="Password Length must be greater than 5 characters. " ;

           }

           $("#signup-error").html(error);

           if (error.length >0){
           return false;
           }

           return true;

           }


           $("#btn-signup").click(
           function(){
             var isFormValid = validateSignupForm();

             if(isFormValid){
               $("#signup-error").hide();
                          var name =$("#signup-name").val();

                          var email =$("#signup-email").val();
                          var password = $("#signup-password").val();

              var user ={
                "name" :  name ,
                "email" :       email ,
                "password" :   password

              };


              $.ajax({
              type: "POST" ,
              url: "/signup",
              data: JSON.stringify(user),
              success: function(response){
               if(!!response){
               if(response.user_created === true ){
                alert(response.message);
               }
               }

               },
              contentType: "application/json"
              });


             }else{
             $("#signup-error").show();
             alert ("Form is invalid. ");
             }



           });
          </script>
           <div class="mt-5 mb-3 text-center">
             <a class="text-muted" href="https://saasbase.dev">
               Built by SaaSBase
             </a>
           </div>

       </div>

       <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
         crossorigin="anonymous"
       ></script>



    </body>
 </html>

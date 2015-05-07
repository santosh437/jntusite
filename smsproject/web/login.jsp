<!DOCTYPE html>
<html lang="en">
	

<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
                <link rel="shortcut icon" href="./assets/dist/images/icon.ico" type="image/x-icon">
		<link rel="icon" href="./assets/dist/images/icon.ico" type="image/x-icon">
		<title>Login Page -JNTUK</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="./assets/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!-- ace styles -->
		<link rel="stylesheet" href="./assets/dist/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="./assets/dist/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="./assets/dist/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="./assets/dist/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="./assets/dist/js/html5shiv.min.js"></script>
		<script src="./assets/dist/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									
									<span class="red"><img src="./assets/dist/images/gallery/a.png" width="76" height="76" alt="JNTUK" align="left"></span>
									<span class="white" id="id-text2">JNTUK Student Application</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; MSIT</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative" style="margin-top:30px;">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>
                                                                                          
                                                                                        <form method="post"  name="login_Form" id="login_Form" onsubmit = "login()">
                                                                                            <div style="color:red;" id="error_message_display" name="error_message_display"></div>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" id="username" class="form-control" placeholder="Username" name="username" pattern="[a-zA-Z]{4,10}" title="name should be filled" required="required" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                                                                                    <input type="password" id="passwordid" class="form-control" placeholder="Password" name="passwordid" pattern="[a-zA-Z0-9_@./#&+-]{5,16}"  title="Password should be 8 charecter length" required="required" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Remember Me</span>
														</label>														
													</div>
                                                                                                        <div>
                                                                                                            <button id="login_Form" onlick="login()"  class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span>
                                                                                                            </button>
                                                                                                        </div>

													<div class="space-4"></div>
												</fieldset>
											</form>

																			</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													I forgot my password
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>
												Enter your email and to receive instructions
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" required/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Send Me!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>

											<form name="Register_Form" id="Register_Form">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" required/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" required/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" required/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" reuired/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Register</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Back to login
											</a>
										</div>
                                                                            
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="./ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="./ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='./assets/dist/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='./assets/dist/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='./assets/dist/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
		</script>
<script>
 
function login()
{
    var error_message="";
    
    var username = $("#username").val(); 
    
    var password = $("#passwordid").val();
    
    if(username == "" || username == null)
    {
         error_message="* User Name is Required";
         
         document.login_Form.username.username.focus();
         
         document.getElementById("error_message_display").innerHTML=error_message;
         
         return false;
    }
    
    else if(username.length > 0)            
    {  
        var userRegEx =/^[a-zA-Z\-]+$/;

        var  str = document.login_Form.username.value;

        if(!str.match(userRegEx))
        { 

            error_message="* Enter valid User Name";

            document.login_Form.username.focus();

            document.getElementById("error_message_display").innerHTML=error_message;

            return false;
        }            
    }
    
    if(password == "")
    {            
        error_message="* Password is Required";

        document.login_Form.passwordid.focus();
        document.getElementById("error_message_display").innerHTML=error_message;
        return false;
    }
}
jQuery(document).ready(function()
{
  //  alert("Hello Submit");
  $("#login_Form").click(function() 
    {
           // alert("inside");
            var username= $("#username").val();
       //  alert("hello"+email);
            var password = $("#passwordid").val();
          // alert("hello"+password);
            if(username=="" || password=="")
            {	
                    return;
            }

            var str = $(this).serialize();
            $.ajax(
            {

                type: "POST",

                url: "./actions/logincheck.jsp",

                data: str,

                success: function(msg) 
                {
                    msg = msg.trim();
                    //alert("hello msg"+msg);
                    if(msg == 'admin') 
                    {
                        window.location = "index.jsp";
                    }
                    if(msg == 'failed') 
                    {
                        result = "Your Password or User Name is Wrong";

                    }
                    $('#error_message_display').html(result);
                }
            });
            return false;
     });

});


</script>

    </body>
</html>

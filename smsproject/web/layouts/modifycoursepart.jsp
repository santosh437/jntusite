
<%@page import="java.sql.*"%>
<%@page import="classes.JdbcConnection" %>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li>
					<i class="ace-icon fa fa-home home-icon"></i>
					<a href="#">Home</a>
				</li>
				<li class="active">View Course</li>
			</ul><!-- /.breadcrumb -->

			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon">
						<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
						<i class="ace-icon fa fa-search nav-search-icon"></i>
					</span>
				</form>
			</div><!-- /.nav-search -->
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					Course Dashboard
					<small>
						<i class="ace-icon fa fa-angle-double-right"></i>
						View Course
					</small>
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->	
					<div class="row">
						<div><p> Course Details </p> </div>
						<div class="hr hr8 hr-dotted"></div>
						<form class="form-horizontal" id="addcourse_Form" name="addcourse_Form" role="form" >
                                                    <%
                                                        String id = request.getParameter("id");
                                                        
                                                        String cname="" , university = "", program = "" , level = "";
                                                        int duration=0,cid=0;
                                                            
                                                        if(id!=null)
                                                        {
                                                            JdbcConnection jc = new JdbcConnection();
                                                            
                                                            String retreive = "select *from dbo.course_master where coursename='"+id+"';";
                                                            
                                                            ResultSet ret = jc.retreiveData(retreive);
                                                            
                                                            
                                                            while(ret.next())
                                                            {
                                                                cid = ret.getInt("courseid");
                                                                cname = ret.getString("coursename");
                                                                duration = ret.getInt("duration");
                                                                university = ret.getString("university");
                                                                program = ret.getString("program");
                                                                level = ret.getString("level");
                                                            }
                                                        }
                                                    %>
                                           
							<div style="color:red;margin-left:275px;" id="error_message_display" ></div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Name of the Course:</label>
								<div class="col-sm-9">
                                                                    <input type="text" id="coursename" name="coursename" placeholder="Coursename" value="<%if(id!=null){out.println(cname);}%>" class="col-xs-10 col-sm-5" title="3 to 10 letter Course code" style = "width:255px;" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Duration:</label>
								<div class="col-sm-9">
									<input type="text" id="duration" name="duration"  value="<%if(id!=null){ out.println(duration);}%>" placeholder="No of Years" class="col-xs-10 col-sm-5" title="2 to 6 year Duration" style = "width:255px;"/>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Name of University:</label>
								<div class="col-sm-9">
									<select class="form-control" id="universityname"  name="universityname" style = "width:255px;"  >
										<option value="">Select University </option>
										<option <% if(id!=null && university.equals("jntuk")){ out.println("selected");}%> value="jntuk">JNTUK</option>
										<option <% if(id!=null && university.equals("jntuh")){ out.println("selected");}%> value="jntuh">JNTUH</option>
										<option <% if(id!=null && university.equals("jntua")){ out.println("selected");}%> value="jntua">JNTUA</option>
										<option <% if(id!=null && university.equals("jntup")){ out.println("selected");}%> value="jntup">JNTUP</option>
									</select>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2">Program:</label>
								<div class="col-sm-9">
									<select class="form-control" id="program" name="program" style = "width:255px;" >
										<option value="">Select Program </option>
                                                                                <option <% if(id!=null && program.equals("et")){ out.println("selected");}%> value="et">Engineering & Technology</option>
										<option <% if(id!=null && program.equals("ca")){ out.println("selected");}%> value="ca">Computer & Applications</option>
										<option <% if(id!=null && program.equals("ba")){ out.println("selected");}%> value="ba">Business & Applications</option>
									</select>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2">Level:</label>
								<div class="col-sm-9">
									<select class="form-control" id="level" name="level" style = "width:255px;">
										<option value="">Select Level </option>
										<option <% if(id!=null && level.equals("ug")){ out.println("selected");}%> value="ug">Under Graduate</option>
										<option <% if(id!=null && level.equals("pg")){ out.println("selected");}%> value="pg">Post Graduate</option>
										<option <% if(id!=null && level.equals("phd")){ out.println("selected");}%> value="phd">PHD</option>
									</select>
								</div>
							</div>							 
						</form>	
						<div class="form-group">
                           	 	<button id="updatecourse_Form1" style="margin-left:20px;" class="btn btn-sm btn-success" style="position: relative;" >Update COURSE<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                            	</button>
                       	</div>
						
					</div><!-- /.row -->

					<div class="row">
						<div class="col-xs-12">
							<div class="col-xs-12 col-sm-6 widget-container-col">
		                    	<div class="widget-box widget-color-blue" style="width:200px;margin-left:650px;margin-top:-290px;" >
									<div class="widget-header" >
		                    	   		<h5 class="widget-title bigger lighter">
		                                    <i class="ace-icon fa fa-table"></i>
		                                    Existing Courses
		                            	</h5>		
		                        	</div>
		                        	<div class="widget-body" style="overflow-y: scroll; height: 200px;" >
										<div class="widget-main no-padding" >
		                                	<table class="table table-striped table-bordered table-hover" >
		                                   	 	<thead class="thin-border-bottom">
		                                        	<tr>
		                                           	 	<th>
		                                                	<i class="ace-icon fa fa-user"></i>Courses
		                                                </th>
													</tr>
		                                    	</thead>                                   
		                                	</table>                                                            
		                                	<table class="table table-striped table-bordered table-hover" id ="table_course">
		                                	</table>
		                            	</div>
		                        	</div>
		                    	</div>
		                    </div>
		                </div>
	                </div>
	                <!--Course Ends-->
               
					<div class="hr hr8 hr-dotted"></div>

					<!--branch Starts -->
					<div class="row">
						<div> <p> Branch Details </p> </div>
						<div class="hr hr4 hr-dotted"></div>
						<div class="col-xs-12" >
						      <div class="col-xs-12" >
                                                          <%
                                                                String bid=request.getParameter("bid");
                                                                if(id!=null)
                                                                {
                                                                    
                                                                }
                                                          %>
								<form class="form-inline" id="Branch_Form" name="Branch_Form" role="form" >
								 <div style="color:red;margin-left:275px;" id="error_message_display1" ></div>
									<div class="form-group">
								      <label for="branchcode">Branchcode:</label>
								      <input type="text" class="form-control" id="branchcode" name="branchcode" value="" placeholder="Branch Code" style="width:105px;"  title="Branch Code required" />
								    </div>
								    <div class="form-group">
								      <label for="branchname">Branch Name:</label>
								      <input type="text" class="form-control" id="branchname" name="branchname"  placeholder="Branch Name" value="" style="width:105px;"  title="Branch Name required" />
								    </div>
								    
								    <div class="form-group">
								      <label for="refer">Refer:</label>
								      <input type="text" class="form-control" id="refer" name="refer" placeholder="Reference Code" style="width:115px;" value="" title="Refer Code required" />
								    </div>

								    <div class="form-group">
								      <label for="refer">Seats:</label>								      
								      <input type="number" class="form-control" id="seats" name="seats" min="25" max = "100" placeholder="Seats" style="width:115px;" value="" title="Refer Code required" />
								    </div>
								    <div class="form-group">
								      <label for="default">Default:</label>
								      	<input type="text" class="form-control" id="aictename" name="aictename" placeholder="Aicte Name" style="width:95px;" value="" title="Aicte Name required" />
								    </div>								   
								</form>	
								 <div class="form-group" >
									    <button  class="btn btn-sm btn-success" id="updatebranch_Form1" style="margin-top:20px;">Update BRANCH<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
	                                 </button>
	                             </div>								
							</div>                                        
						</div>                                                                   
					</div><!-- /.row -->
					<!-- Branch Ends -->

					<div class="hr hr32 hr-dotted"></div>

					<div class="row">
						<div class="col-xs-12">
						<!-- Branch Content BEGINS -->					
							<table id="table_branch1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Branch Id</th>
										<th>BRANCH Name</th>
										<th>Ref Code</th>
										<th >NO.OF SEATS</th>
										<th>AICTE NAME</th>													
									</tr>
								</thead><tbody id ="table_branch"> 
                                                                <%
                                                                    if(id!=null)
                                                                    {
                                                                        JdbcConnection jc = new JdbcConnection();
                                                                        String getbranches = "select * from dbo.branch_master where courseid in(select courseid from dbo.course_master where coursename='"+id+"');";
                                                                        //System.out.println(getbranches);
                                                                        ResultSet branches = jc.retreiveData(getbranches);
                                                                        
                                                                        while(branches.next())
                                                                        {
                                                                        
                                                                %>
								
                                                                        <tr>
                                                                            <td><% out.println(branches.getString("branchcode")); %></th>
                                                                            <td><% out.println(branches.getString("branchname")); %></th>
                                                                            <td><% out.println(branches.getString("refer")); %></th>
                                                                            <td ><% out.println(branches.getString("no_of_seats")); %></th>
                                                                            <td><% out.println(branches.getString("aicte_name")); %></th>													
									</tr>
                                                                <%
                                                                            }
                                                                    }
                                                                %>        
								</tbody>
                                                                
							</table>						
						</div>						
					</div><!-- /.row -->
					<!-- Branch Content ENDS -->
					<div class="hr hr4 hr-dotted"></div>
					<!-- Semister Content -->
					<div class="row">
					<div> <p> Semister Details </p> </div>
						<div class="hr hr4 hr-dotted"></div>
						<div class="col-xs-12" >
						      <div class="col-xs-12" >
								<form class="form-inline" id="Branch_Form" name="Branch_Form" role="form" >
								<div style="color:red;margin-left:275px;" id="error_message_display2" ></div>
									<div class="form-group">
								      <label for="branchcode">Year:</label>
								      	<select class="form-control" id="year" name="year" style="width:125px;" title="Year required" />
			                               <option value="">SELECT YEAR</option>
			                               <option value="1">I YEAR</option>
			                               <option value="2">II YEAR</option>
			                               <option value="3">III YEAR </option>
			                               <option value="4">IV YEAR </option>			                              
			                       		</select>
								   </div>
								    <div class="form-group">
								      <label for="branchname">Semister:</label>
								      <input type="number" class="form-control" id="semestername" name="semestername" min ="1"  max="4" placeholder="Enter no of SEMESTER" title="Semister Name required"  />
								    </div>
								    
								    <div class="form-group">
								      <label for="refer">SEM PRINT NAME:</label>
								     <input type="text" class="form-control" id="semprintname" name="semprintname" value= "" placeholder="Enter SEM PRINT NAME" title="Semister Print Name required" />
								    </div>
								    <div class="form-group">
								      <label for="default">COURSE COMPLETED:</label>
								      <input type="checkbox" id="coursecompleted" name="coursecompleted" value="Yes" />		
								    </div>

								     <div class="form-group">
								      <label for="default">ANNUAL EXAM FOR SEM:</label>
								        <input type="checkbox" id="annualexam" name="annualexam" value="Yes" />
								    </div>
								</form>		
								<button class="btn btn-sm btn-success" id="updatesemester_Form1" style="margin-top:20px;">
	                  				  Update Semester
	                    			<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
	               				</button>							
							</div>                                        
						</div>             
					</div>
					<!-- Semister Content Ends -->


					<div class="hr hr32 hr-dotted"></div>

					<div class="row">
						<div class="col-xs-12">
						<!-- Semister Content BEGINS -->					
							<table id="table_semister1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Year</th>
										<th>Semister</th>
										<th>Semister Name</th>
										<th>Course Completed</th>
										<th>Annual Exam</th>													
									</tr>
								</thead>
								<tbody id ="table_semister"> 
								
								</tbody>
							</table>						
						</div>						
					</div><!-- /.row -->
					<!-- Branch Content ENDS -->
					<div class="hr hr4 hr-dotted"></div>
					<div class="row">
						<button class="btn btn-sm btn-success" id="finalform" name="finalform">
								<i class="ace-icon fa fa-check bigger-110"></i>
								Submit
						</button>

						<button class="btn btn-sm btn-info" id="cancel_form" name="cancel_form">
							<i class="ace-icon fa fa-times bigger-125"></i>
							Cancel
						</button>	

					</div>


				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div>
</div><!-- /.main-content -->

<script src="./js/jquery.min.js"></script>
<script>

/*function addcourse()
{

	var coursename = document.getElementById("coursename").value;
    var duration = document.getElementById("duration").value;
    var university = document.getElementById("universityname").value;
    var program = document.getElementById("program").value;
    var level = document.getElementById("level").value;
     
    if(Fullname == "")
    {
		document.getElementById("NameError").innerHTML = "Please Enter a valided Name";
	}

        
	jQuery(document).ready(function()
	{
	  //  alert("Hello Submit");
	  $("#addcourse_Form").click(function(response) 
	    {   
		    alert("Hello");	    
		    var str = $(this).serialize();
		    alert(str);
		   $.ajax(
			{
	            type: "POST",

	            url: "./actions/addcourse/insertcoursedata.jsp",

	            data: str,
				success: function(msg)
				{
					msg = msg.trim();
					alert(msg+"hello");

					if(msg == "success")
			        {
			                msg = "<div style='color:green; font-weight:bold;'>Data Saved successfully.</div>";
			        }
			        else if(msg == "existed")
					{
			    	   msg = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
			        }
			        else if(msg == "failed")
					{
			    	   msg = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
			        }
			        $('#error_message_display').html(msg);			
				}
	    	});
	    });
	});
}
*/


$(document).ready(function()
{
	$("#updatecourse_Form1").click(function()
	{
		var coursename = $("#coursename").val();
		var duration = $("#duration").val();
		var universityname = $("#universityname").val();
		var program = $("#program").val();
		var level = $("#level").val();
		//alert(program+" program is");
                var number = /^[0-9]/;

		if (coursename == '' || duration == '' || universityname == '' || program == '' || level == '' || number.test(coursename) || !(number.test(duration))) 
		{
			alert("Insertion Failed Some Fields are Blank or Invalid Data....!!");
		}
		else 
		{

		
				//return true;
				// Returns successful data submission message when the entered information is stored in database.
				$.post("./actions/updatecourse/updatecoursedata.jsp", 
				{
					coursename: coursename,
					duration: duration,
					universityname: universityname,
					program: program,
					level: level
				}, 
				function(data) 
				{
					//alert(data);
					data = data.trim();
					if(data == "success")
					{
						data = "<div style='color:green; font-weight:bold;'>Data Saved successfully.</div>";
					}
					else if(data == "existed")
					{
			    	   data = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
			        }
			        else if(data == "failed")
					{
			    	   data = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
			        }
			        $('#error_message_display').html(data);	
				//$('#form')[0].reset(); // To reset form fields
				});
			
		}
	});
	//return false;
});

/* COURSE AJAX ENDS */


/* Branch AJAX STARTS */

$(document).ready(function()
{
	$("#updatebranch_Form1").click(function()
	{
		var branchcode = $("#branchcode").val();
		var branchname = $("#branchname").val();
		var refer = $("#refer").val();
		var seats = $("#seats").val();
		var aictename = $("#aictename").val();
                
                var number = /^[0-9]/;
		if (branchcode == '' || branchname == '' || refer == '' || seats == '' || aictename == '' || !(number.test(seats))) 
		{
			alert("Insertion Failed Some Fields are Blank or Invalid Data....!!");
		}
		else 
		{
			// Returns successful data submission message when the entered information is stored in database.
			$.post("./actions/updatecourse/updatebranchdata.jsp", 
			{
				branchcode: branchcode,
				branchname: branchname,
				refer: refer,
				seats: seats,
				aictename: aictename
			}, 
			function(data) 
			{
				//alert(data);
				data = data.trim();
				if(data == "success")
				{
					data = "<div style='color:green; font-weight:bold;'>Data Saved successfully.</div>";
				}
				else if(data == "existed")
				{
		    	   data = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
		        }
		        else if(data == "failed")
				{
		    	   data = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
		        }
		        $('#error_message_display1').html(data);	
			});	
			setTimeout(wait,5000);
			/*function wait()
			{
				//alert("waitbranch");
				var $select = $('#table_branch');	       
		 		$.getJSON("./actions/updatecourse/getbranch.jsp",{id: $select.val(), ajax: 'true'}, function(j)
				{
		     	 var options = '';
		      	for (var i = 0; i < j.length; i++) 
		      	{
		        options += '<tr>' +'<td><a href="modifycoursemaster.jsp?id='+j[i].co+'\bid='+j[i].bc+'"   >'+ j[i].bc + '</td>'+'<td>'+ j[i].bn + '</td>'+'<td>'+ j[i].re + '</td>'+'<td>'+ j[i].se + '</td>'+'<td>'+ j[i].ai + '</td>'+'</tr>';
		      	}
		        $("#table_branch").html(options); 		
		      });	
		   }	*/	 
		}

	});
	
	//return false;
});



/* BRANCH AJAX ENDS */




/* Semister AJAX STARTS */

$(document).ready(function()
{
	$("#updatesemester_Form1").click(function()
	{
		var year = $("#year").val();
		var semestername = $("#semestername").val();
		var semprintname = $("#semprintname").val();
		var coursecompleted = document.getElementById("coursecompleted").checked;
		var annualexam = document.getElementById("annualexam").checked;
               // alert(annualexam);
               var number = /^[0-9]/;
		if (year == '' || semestername == '' || semprintname == '' || !(number.test(year)) || !(number.test(semestername))) 
		{
			alert("Insertion Failed Some Fields are Blank or Invalid Data....!!");
		}
		else 
		{
			
			// Returns successful data submission message when the entered information is stored in database.
			$.post("./actions/addcourse/insertsemesterdata.jsp", 
			{
				year: year,
				semestername: semestername,
				semprintname: semprintname,
				coursecompleted: coursecompleted,
				annualexam: annualexam
			}, 
			function(data) 
			{
				//alert(data);
				data = data.trim();
				if(data == "success")
				{
					data = "<div style='color:green; font-weight:bold;'>Data Saved successfully.</div>";
				}
				else if(data == "existed")
				{
		    	   data = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
		        }
		        else if(data == "failed")
				{
		    	   data = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
		        }
		        $('#error_message_display2').html(data);	
			});

			setTimeout(wait1,5000);
			function wait1()
			{
				//alert("waitsem");
				var $select = $('#table_semister');	       
		 		$.getJSON("./actions/addcourse/getsemister.jsp",{id: $select.val(), ajax: 'true'}, function(j)
				{
                   var options = '';
                   for (var i = 0; i < j.length; i++) 
                   {
                        options += '<tr>' +'<td>'+ j[i].ye + '</td>'+'<td>'+ j[i].se + '</td>'+'<td>'+ j[i].sm + '</td>'+'<td>'+ j[i].co + '</td>'+'<td>'+ j[i].an + '</td>'+'</tr>';
                   }
                   $("#table_semister").html(options); 		
               });	
            } 		
		}
	});
	//return false;
});


/* Semister AJAX ENDS */


/* Final Form */


$(document).ready(function()
{
	$("#finalform").click(function()
	{
		
		// Returns successful data submission message when the entered information is stored in database.
		$.post("./actions/addcourse/insertmasterdata.jsp", 
		{
			
		}, 
		function(data) 
		{
			//alert(data);
			data = data.trim();
			if(data == "success")
			{
				data = "<div style='color:green; font-weight:bold;'>Data Saved In Master Table successfully.</div>";
			}
			else if(data == "existed")
			{
	    	   data = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
	        }
	        else if(data == "failed")
			{
	    	   data = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
	        }
	        $('#error_message_display3').html(data);	
		});
                
            setTimeout(wait2,5000);
			function wait2()
			{
				//alert("waitcourse");
				var $select = $('#table_course');	       
		 		$.getJSON("./actions/addcourse/getcourse.jsp",{id: $select.val(), ajax: 'true'}, function(j)
				{
	                   var options = '';
	                   for (var i = 0; i < j.length; i++) 
	                   {
	                        options += '<tr>' +'<td><a href="#"  >'+ j[i].co +'</a>'+'</td>'+'</tr>';
	                   }
	                   $("#table_course").html(options); 		
                });	

            setTimeout(wait3,7000);
			function wait3()
			{

                location.reload();
            }
           } 	
	});
	//return false;
});


$(document).ready(function()
{
	$("#cancel_form").click(function()
	{
		 var dialog = $('<p>Are you sure?</p>').dialog(
		 {
            buttons: 
            {
                "Yes": function()
                 {
                 	alert('you chose yes');
                 },
                "No":  function() 
                {
                	alert('you chose no');
                },
                "Cancel":  function()
                 {
                    alert('you chose cancel');
                    dialog.dialog('close');
                }
            }
        });
            

		// Returns successful data submission message when the entered information is stored in database.
		$.post("./actions/addcourse/deletetempdata.jsp", 
		{
			
		}, 
		function(data) 
		{
                    data = data.trim();
                    if(data == "success")
                    {
                        document.location = "./addcoursemaster.jsp";
                    }
                    else
                    {
                        
                    }
                        
		});		
	});
	//return false;
});



/* Final Form Ends */

/*
 jQuery(document).ready(function()
{
  //  alert("Hello Submit");
  $("#Branch_Form").submit(function(response) 
    {
    alert("Hello");
    var str = $(this).serialize();
    alert(str);
   $.ajax(
	{

            type: "POST",

            url: "./actions/addcourse/insertbranchdata.jsp",

            data: str,

	success: function(msg)
	{
		msg = msg.trim();
		alert(msg+"hello");

		if(msg == "success")
                {
                        msg = "<div style='color:green; font-weight:bold;'>Data Saved successfully.</div>";
                }
                else if(msg == "existed")
        	{
            	   msg = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
                }
                else if(msg == "failed")
        	{
            	   msg = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
                }
                $('#error_message_display').html(msg);			
	}
    });
    });
});
*/
/*jQuery(document).ready(function()
{
  //  alert("Hello Submit");
  $("#addsemister_Form1").click(function(response) 
    {
   
    
    //var str = 'branchcode='+branchcode+'&branchname='+branchname+'&refer='+refer+'&seats='+seats+'&aicte='+aicte;
    var str = $(this).serialize();
   $.ajax(
	{
            
           
                	

            type: "POST",

            url: "./actions/addcourse/insertsemesterdata.jsp",

            data: str,

	success: function(msg)
	{
            
            $("#show1").after(msg);
            $("#flash").hide();
            
	}
    });
    });
});

jQuery(document).ready(function()
{
  //  alert("Hello Submit");
  $("#finalform").submit(function(response) 
    {
   
   
   alert("final");
    
    
    var str = $(this).serialize();
   $.ajax(
	{

            type: "POST",

            url: "./actions/addcourse/insertmasterdata.jsp",

            data: str,

	success: function(msg)
	{
		msg = msg.trim();
		alert(msg+"hello");

		if(msg == "success")
                {
                        msg = "<div style='color:green; font-weight:bold;'>Data Saved successfully.</div>";
                }
                else if(msg == "existed")
        	{
            	   msg = "<div style='color:red; font-weight:bold;' >Data Existed.</div";
                }
                else if(msg == "failed")
        	{
            	   msg = "<div style='color:red; font-weight:bold;' >Data Saving failed due to some error. Please conatct your System Administrator.</div";
                }
                $('#error_message_display').html(msg);			
	}
    });
    });
});
*/


/*function getdata()
{
	alert("success");
      var $select = $('#branch_code');;
      $.getJSON("./actions/addcourse/getbranch.jsp",{id: $(this).val(), ajax: 'true'}, function(j)
      {
     	 var options = '';
      	for (var i = 0; i < j.length; i++) 
      	{
        options += '<option value="' + j[i].bc + '">' + j[i].bc + '</option>';
      	}
        $("#branch_code").html(options); 
      });


    
};*/

</script>

<script>
/*	function loaddata()
	{
		var $select = $('#table_branch');;
     		 $.getJSON("./actions/addcourse/getbranch.jsp",{id: $select.val(), ajax: 'true'}, function(j)
      		{
     	 		var options = '';
      	for (var i = 0; i < j.length; i++) 
      	{
        options += '<tr>' +'<td>'+ j[i].bc + '</td>'+'<td>'+ j[i].bn + '</td>'+'<td>'+ j[i].re + '</td>'+'<td>'+ j[i].se + '</td>'+'<td>'+ j[i].ai + '</td>'+'</tr>';
      	}
        $("#table_branch").html(options); 
      });
			 
	}*/

	</script>
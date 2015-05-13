<%-- 
    Document   : deletecoursepart
    Created on : 13 May, 2015, 11:22:59 AM
    Author     : SantoshKumar
--%>

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
				<li class="active">Delete Course</li>
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
						Delete Course
					</small>
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->	
					<div class="row">
						
						<form class="form-horizontal" id="view_Form" name="view_Form" role="form" >
											

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Name of Course:</label>
								<div class="col-sm-9">
									<select class="form-control" id="coursename" name="coursename" style = "width:255px;" onchange ="getData()" >
										
							
									</select>
								</div>
							</div>		
						</form>							
					</div><!-- /.row -->

                                        
                    <div class="hr hr32 hr-dotted"></div>

					<div class="row">
						<div class="col-xs-12">
                            <div><p> Course Details </p> </div>
						<div class="hr hr8 hr-dotted"></div>
						<!-- Semister Content BEGINS -->					
							<table id="table_course1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
                                                                                <th>Courseid</th>
										<th>Coursename</th>
										<th>Duration</th>
										<th>University Name</th>
										<th>Program</th>
										<th>Level</th>													
									</tr>
								</thead>
								<tbody id ="table_course"> 
								
								</tbody>
							</table>						
						</div>						
					</div><!-- /.row -->
					<!-- Branch Content ENDS -->
					
			

					<div class="row">
						<div class="col-xs-12">
						 	<div> <p> Branch Details </p> </div>
                        	<div class="hr hr4 hr-dotted"></div>
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
								</thead>
								<tbody id ="table_branch"> 
								
								</tbody>
							</table>						
						</div>						
					</div><!-- /.row -->
					<!-- Branch Content ENDS -->

					<!-- Semister Dat -->					
					<div class="row">
						<div class="col-xs-12">
							<div> <p> Semister Details </p> </div>
							<div class="hr hr4 hr-dotted"></div>
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
                                        <div class="form-group">
                           	 	<button id="deletecourse" style="margin-left:20px;" class="btn btn-sm btn-success" style="position:relative;" data-confirm="Are you sure you want to click the button?">Delete COURSE<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                            	</button>
                       	</div>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div>
</div><!-- /.main-content -->

<script src="./js/jquery.min.js"></script>

<script>
    
function getData()
{
    var cname = $("#coursename").val();
    //alert("cname :"+cname);
    
    var $select = $('#table_course');
    $.getJSON("./actions/viewcourse/gettablecourse.jsp",{id: cname, ajax: 'true'}, function(j)
    {
        var options = '';
        for (var i = 0; i < j.length; i++) 
        {
            options += '<tr>' +'<td>'+ j[i].ci + '</td>'+'<td>'+ j[i].co + '</td>'+'<td>'+ j[i].du + '</td>'+'<td>'+ j[i].un + '</td>'+'<td>'+ j[i].pr + '</td>'+'<td>'+ j[i].le+'</tr>';
        }
        $("#table_course").html(options); 		
    });	
    setTimeout(wait,1000);
    function wait()
    {
        loadbranch();
    }
    
    function loadbranch()
    {
        //alert("hello");
        var $select = $('#table_branch');;
         $.getJSON("./actions/viewcourse/gettablebranch.jsp",{id: cname, ajax: 'true'}, function(j)
         {
             var options = '';
            for (var i = 0; i < j.length; i++) 
            {
                options += '<tr>' +'<td>'+ j[i].bc + '</td>'+'<td>'+ j[i].bn + '</td>'+'<td>'+ j[i].re + '</td>'+'<td>'+ j[i].se + '</td>'+'<td>'+ j[i].ai + '</td>'+'</tr>';
            }
            $("#table_branch").html(options); 
        });
        setTimeout(wait1,2000);
        function wait1()
        {
            loadsem();
        }
    }  
    
    
    function loadsem()
    {
            var $select = $('#table_semister');	       
            $.getJSON("./actions/deletecourse/gettablesemister.jsp",{id: cname, ajax: 'true'}, function(j)
            {
               var options = '';
               for (var i = 0; i < j.length; i++) 
               {
                    options += '<tr>' +'<td>'+ j[i].ye + '</td>'+'<td>'+ j[i].se + '</td>'+'<td>'+ j[i].smp + '</td>'+'<td>'+ j[i].com + '</td>'+'<td>'+ j[i].ann + '</td>'+'</tr>';
               }
               $("#table_semister").html(options); 		
           });
    }
}
</script>    

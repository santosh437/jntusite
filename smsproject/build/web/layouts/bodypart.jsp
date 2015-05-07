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
							<div style="color:red;margin-left:275px;" id="error_message_display" ></div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Name of the Course:</label>
								<div class="col-sm-9">
									<input type="text" id="coursename" name="coursename" placeholder="Coursename" class="col-xs-10 col-sm-5" title="3 to 10 letter Course code" style = "width:255px;" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Duration:</label>
								<div class="col-sm-9">
									<input type="number" id="duration" name="duration" min="2" max="6"  placeholder="No of years" class="col-xs-10 col-sm-5" title="2 to 6 year Duration" style = "width:255px;"/>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Name of University:</label>
								<div class="col-sm-9">
									<select class="form-control" id="universityname" name="universityname" style = "width:255px;"  >
										<option value="">Select University </option>
										<option value="jntuk">JNTUK</option>
										<option value="jntuh">JNTUH</option>
										<option value="jntua">JNTUA</option>
										<option value="jntup">JNTUP</option>
									</select>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2">Program:</label>
								<div class="col-sm-9">
									<select class="form-control" id="program" name="program" style = "width:255px;" >
										<option value="">Select Program </option>
										<option value="et">Engineering & Technology</option>
										<option value="ca">Computer & Applications</option>
										<option value="ba">Business & applications</option>											
									</select>
								</div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2">Level:</label>
								<div class="col-sm-9">
									<select class="form-control" id="level" name="level" style = "width:255px;">
										<option value="">Select Level </option>
										<option value="ug">Under Graduate</option>
										<option value="pg">Post Graduate</option>
										<option value="phd">PHD</option>												
									</select>
								</div>
							</div>
							<div 
							 >
                           	 	<button id="addcourse_Form1" class="btn btn-sm btn-success" style="position:relative;" >ADD COURSE<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                            	</button>
                        	</div> 
						</form>	
						
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
								<form class="form-inline" id="Branch_Form" name="Branch_Form" role="form" >
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
								      <label for="default">Default:</label>
								      	<input type="text" class="form-control" id="aictename" name="aictename" placeholder="Aicte Name" style="width:95px;" value="" title="Aicte Name required" />
								    </div>

								    <button class="btn btn-sm btn-success" id="addbranch_Form1">ADD BRANCH<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                 </button>
								</form>									
							</div>                                        
						</div>                                                                   
					</div><!-- /.row -->
					<!-- Branch Ends -->

					<div class="hr hr32 hr-dotted"></div>

					<div class="row">
						
					</div><!-- /.row -->

					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div>
</div><!-- /.main-content -->

<script src="./js/jquery.min.js"></script>



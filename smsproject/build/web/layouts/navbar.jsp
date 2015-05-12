<%-- 
    Document   : headerpart
    Created on : 27 Apr, 2015, 7:06:51 PM
    Author     : SantoshKumar
--%>
<%@page import="classes.JdbcConnection" %>
<%@page import="java.sql.*" %>
<%
    
    
    ResultSet rs;
    try
    {
       
    JdbcConnection jc  =  new JdbcConnection();

    
    String name = (String)session.getAttribute("uname");
    if(name == null )
    {
        String sql_del = "delete from dbo.temp_course_master;";
                
        String sql_del1 = "delete from dbo.temp_branch_master;";

        String sql_del2 = "delete from dbo.temp_semister_master;";

        
        jc.DeleteData(sql_del);
        jc.DeleteData(sql_del1);
        jc.DeleteData(sql_del2);
        response.sendRedirect("./login.jsp");
        
    }
    else
    {
        
         
    
    
    %>



<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							MSITJNTUK
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="./assets/dist/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									<% out.println(name); %>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="#">
										<i class="ace-icon fa fa-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="logout.jsp">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>
<% 
    }
}
catch(Exception e)
{
System.out.println("error"+e);
}
%>
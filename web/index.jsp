<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-image: url(images/login1.png);">

<%@include file="head.html" %>

<div class="container-fluid border p-5" >
	 
	 
<form action="index_servlet">
	 	<div class="container-fluid bg-secondary row p-2 m-0">
	 		<div class="col-2">
                        <select class="form-control" name="type_s">
                            <option value="-">Any</option>
                            <option value="Full-time">Full-time</option>
                            <option value="Part-time">Part-time</option>
	 		</select>
	 		</div>
	 		<div class="col-4">
	 			<input type="text" name="company_s" placeholder="Search by company" class="form-control">
	 		</div>
	 		<div class="col-4">
	 			<input type="text" name="title_s" placeholder="Search by job title" class="form-control">
	 		</div>
	 		<div class="col-2">
	 			<input type="submit" value="Search..." class="btn btn-warning pl-5 pr-5 w-100">
	 		</div>
	 	</div>
</form>

	 	<br>

	 	<h6>Results for #Any type | #Any company | #Any job title</h6>

	 	<hr>

	 	<div class="container-fluid p-0 m-0 row">
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobpot","root","" );
    Statement st=con.createStatement();
    String qry1="SELECT * FROM jobs ";
    ResultSet rs = st.executeQuery(qry1);                  
    while(rs.next()) 
        {
%>
	 		<div class="col-4 m-0 p-2 ">
	 			<div class="m-0 p-2 btn-light border">
		 			<button disabled class="btn btn-info btn-sm"><%=rs.getString("type")%></button>
		 			<center>
		 			<h5 class="m-0"><%=rs.getString("title")%></h5>
		 			<h6><%=rs.getString("company")%></h6>
		 			<p class="m-0">Salary LKR <%=rs.getString("salary")%>/-</p>
		 			<p>Closing date <%=rs.getString("closedate")%></p>
		 			<a href="job_profile.jsp?id=<%=rs.getString("id")%>" class="btn btn-secondary btn-sm pl-5 pr-5">View</a>
		 			</center>
	 			</div>
	 		</div>
<% } %>
	 	</div>	 


</div>

<%@include file="footer.html" %>


</body>

</html>
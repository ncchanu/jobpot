<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobpot","root","" );
    Statement st=con.createStatement();
%>
<!DOCTYPE html>
<html>
<head>
	<title>Member</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-image: url(images/login.png);">
<%@include file="head.html" %>
<div class="container p-5" >
    <% String name="xx"; String uname="xx";  %>
    
    <%
        String qry1="SELECT * FROM user WHERE id='"+session.getAttribute("user")+"' ";
            ResultSet rs1 = st.executeQuery(qry1);
            while(rs1.next()) 
            {
                name=rs1.getString("name");
                uname=rs1.getString("uname");
                
            }
    %>
	<div class="container border p-2 text-light" style="opacity: 0.8; width: 90%; background-color:#1c662f;">
		<div class="container" style="padding-right: 20%; padding-left: 20%;">
		<center><h2>User Profile </h2></center>
                <center><h6 class="m-0"> <%= name %> | <%= uname %> </h6></center>
                <center><a href='edit_profile.jsp?id=<%= session.getAttribute("user") %>'>Edit</a></center><br>
                <center><a href="application.jsp" class="btn btn-light">New Add</a></center>
		</div>
	</div>

	<br><br>
 
        <%
            String qry="SELECT * FROM jobs WHERE user='"+session.getAttribute("user")+"' ";
            ResultSet rs = st.executeQuery(qry);
            while(rs.next()) { 
        %>
	<div class="container border p-2 text-light mb-3" style="opacity: 0.9; width: 90%; background-color:#1f9c3f;">
		<div class="row m-0">
			<div class="col-8">
				<h6>Advert 1 (Status : <font class="text-warning">Active</font>)</h6>
                                <h5><%= rs.getString("title") %> | <%= rs.getString("company") %></h5>
				<p>Published on <%= rs.getString("date") %></p>	
			</div>
			<div class="col">
				<a href="job_profile.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-primary m-1 mt-3" style="width:200px;">View Advert</a><br>
				<a href="applicationUpdate.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-warning m-1" style="width:96px;">Edit</a>
				<a href="add_delete?id=<%=rs.getString("id")%> " class="btn btn-sm btn-danger m-0" style="width: 96px;">Delete</a>
			</div>
		</div>
	</div>
        <% } %>
                                
	



</div>

</body>

</html>
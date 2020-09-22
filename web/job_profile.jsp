<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
    String id=request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobpot","root","" );
    Statement st=con.createStatement();
    String qry1="SELECT * FROM jobs WHERE id='"+id+"' ";
    ResultSet rs1 = st.executeQuery(qry1);
    while(rs1.next()) 
        {
%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-image: url(images/wall2.png); background-repeat: no-repeat; background-size: 100%;">

<%@include file="head.html" %>

<br><br>
<div class="border" style="width: 70%; margin-left: 15%; background-color: white; color: grey;">
	<center>
		<hr>
		<h3 style="color: brown;">Job Profile</h3>
		<hr>
		<h1 style="color: purple;"><%=rs1.getString("title")%></h1>
		<h5 style="color: purple;"><%=rs1.getString("company")%></h5>
		<p style="color: purple;"><%=rs1.getString("address")%></p>
	</center>

	<br>
	<ul>
		<li><p>Job Type : <%=rs1.getString("type")%></p></li>
		<li><p>Salary : LKR <%=rs1.getString("salary")%>/-</p></li>
		<li><p>Job Description : <%=rs1.getString("description")%></p></li>
		<li><p>Send CV : <%=rs1.getString("email")%></p></li>
		<li><p>Closing Date : <%=rs1.getString("closedate")%></p></li>
		<br><br>
		<p>Published on <%=rs1.getString("date")%></p>
	</ul>

</div>

        <br><br>

<%@include file="footer.html" %>
</body>

</html>

<% } %>
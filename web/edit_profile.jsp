<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<html>
<head>
	<title>Edit Profile</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-image: url(images/login.png);">
<%@include file="head.html" %>
<div class="container p-5" >

<%
    //String id=(String)session.getAttribute("user");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobpot","root","" );
    Statement st=con.createStatement();
    String qry="SELECT * FROM user WHERE id='"+session.getAttribute("user")+"' ";
    ResultSet rs = st.executeQuery(qry);
    while(rs.next()) 
        {
%>
	<div class="container border p-5 bg-secondary text-light" style="opacity: 0.8; width: 70%;">
		<div class="container" style="padding-right: 20%; padding-left: 20%;">
		<center><h2>Edit Profile</h2></center>
		<center><p>You can edit details and save</p></center>
        <form action="user_edit_servlet" method="get">
        	<table width="100%">
        		<tr>
        			<td style="width: auto;"><label>Name</label></td>
        			<td><input type="text" name="name" class="form-control m-2" value="<%=rs.getString("name")%>"></td>
        		</tr>
        		<tr>
        			<td style="width: auto;"><label>NIC</label></td>
        			<td><input type="text" name="nic" class="form-control m-2" value="<%=rs.getString("nic")%>"></td>
        		</tr>
        		<tr>
        			<td style="width: auto;"><label>Email</label></td>
        			<td><input type="text" name="email" class="form-control m-2" value="<%=rs.getString("email")%>"></td>
        		</tr>
        		<tr>
        			<td style="width: auto;"><label>Telephone</label></td>
        			<td><input type="text" name="tel" class="form-control m-2" value="<%=rs.getString("telephone")%>"></td>
        		</tr>
        		<tr>
        			<td style="width: auto;"><label>Username</label></td>
        			<td><input type="text" name="uname" class="form-control m-2" value="<%=rs.getString("uname")%>"></td>
        		</tr>
        		<tr>
        			<td style="width: auto;"><label>Password</label></td>
        			<td><input type="password" name="pw" class="form-control m-2" value="<%=rs.getString("pw")%>"></td>
        		</tr>
        	</table>
                        <input type="hidden" name="user" value="<%=rs.getString("id")%>"
			<center><input type="submit" value="Save" class="btn btn-primary m-2">
			<input type="Reset" value="Clear" class="btn btn-danger btn-sm m-2"></center>
	</form>
		<br>
		</div>
	</div>
<% } %>
</div>
<%@include file="footer.html" %>
</body>

</html>
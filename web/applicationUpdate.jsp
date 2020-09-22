<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
	<title>Post new add</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-image: url(images/wall1.png);">

<%@include file="head.html" %>
<style type="text/css">
	.input1
	{
		width: 100%;
		border-radius: 2%;
	}

	.button1
	{
		width: 30%;
		color: white;
	}
	td{ padding: 10px; }
</style>
<br><br>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobpot","root","" );
    Statement st=con.createStatement();
    String id=request.getParameter("id");
%>
<%        String qry1="SELECT * FROM jobs WHERE id='"+id+"' ";
          ResultSet rs1 = st.executeQuery(qry1);
          while(rs1.next()) 
          { %>    
            
<div style="width: 90%; margin-left: 10%; margin-right: 10%; width: 80%; background-color: white; box-shadow: 10px 10px 10px 10px; padding: 50px;">
	<center><h3>Edit Job Advertisement</h3></center>
	<center>You can edit your advertisement details</center>
	<hr>
        <form action="add_edit" method="post">
		<center>
		<table style="width: 80%;" class="border">
                    <input type="hidden" name="id" value="<%=rs1.getString("id")%>">
			<tr>
				<td>Job Title : </td>
                                <td><input type="text" name="title" class="input1" value="<%=rs1.getString("title")%>"></td>
			</tr>
			<tr>
				<td>Company Name : </td>
				<td><input type="text" name="company" class="input1" value="<%=rs1.getString("company")%>"></td>
			</tr>
			<tr>
				<td>Company Address : </td>
				<td><input type="text" name="address" class="input1" value="<%=rs1.getString("address")%>"></td>
			</tr>
			<tr>
				<td>Job Type : </td>
				<td><input type="radio" name="type" value="Part-time"> Part-time &nbsp&nbsp
					<input type="radio" name="type" value="Full-time"> Full-time</td>
			</tr>
			<tr>
				<td>Monthly Salary : </td>
				<td><input type="text" name="salary" class="input1" value="<%=rs1.getString("salary")%>"></td>
			</tr>
			<tr>
				<td>Job Description : </td>
				<td><textarea name="description" class="input1"><%=rs1.getString("description")%></textarea></td>
			</tr>
                        <tr>
				<td>Email : </td>
				<td><input type="text" name="email" class="input1" value="<%=rs1.getString("email")%>"></td>
			</tr>
			<tr>
				<td>Closing Date : </td>
				<td><input type="date" name="closedate" class="input1" value="<%=rs1.getString("closedate")%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Post" class="button1" style="background-color: blue;">
				<input type="reset" value="Clear all" class="button1" style="background-color: red;"></td>
			</tr>
		</table>
	</center>
	</form>
</div>
<% } %>
<br><br>

<%@include file="footer.html" %>
</body>

</html>
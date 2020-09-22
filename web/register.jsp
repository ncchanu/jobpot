<!DOCTYPE html>
<html>
<head>
	<title>Registration</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-image: url(images/login.png);">
<%@include file="head.html" %>
<div class="container p-5" >
	
	<div class="container border p-5 bg-secondary text-light" style="opacity: 0.8; width: 70%;">
		<div class="container" style="padding-right: 20%; padding-left: 20%;">
		<center><h2>User Registration</h2><p>Please enter your details to sign up</p></center>
                <form action="user_servlet" method="get">
			<input type="text" name="name" class="form-control m-2" placeholder="Enter Full Name">
			<input type="text" name="nic" class="form-control m-2" placeholder="Enter NIC">
			<input type="text" name="email" class="form-control m-2" placeholder="Enter Email">
			<input type="text" name="tel" class="form-control m-2" placeholder="Enter Telephone Number (optional)">
			<input type="text" name="uname" class="form-control m-2" placeholder="Enter Username">
			<input type="text" name="pw" class="form-control m-2" placeholder="Enter Password">
			<input type="text" class="form-control m-2" placeholder="Enter Re-password">
			<center><input type="submit" value="Sign up" class="btn btn-primary m-2">
			<input type="Reset" value="Clear" class="btn btn-danger btn-sm m-2"></center>
		</form>
		<br>
		<center><a href="login.jsp" class="text-warning">Already registered? Click here to login</a></center>
		</div>
	</div>

</div>
<%@include file="footer.html" %>
</body>

</html>
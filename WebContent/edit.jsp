<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>
			Edit your details	
		</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
		<script type="text/javascript" src="js/validation.js"></script>
	</head>
	<body>
		<center>
			<div style="width:500px;">
				<form id="lform" action="Edit" method="post">
					<fieldset>
						<h2 class="title" style="background-color:teal;
				     							 padding-top:10px;
												 padding-bottom:10px;
												 border-radius:3px;" >
							Fill Your Details
						</h2><br>
						<input type="text" name="name" placeholder="Name" id="l1"  />&nbsp;<LABEL style="color:red;" id="ulabel"></LABEL><BR/>
						<input type="email" name="email_id" placeholder="Email_id" id="l3"  />&nbsp;<LABEL style="color:red;" id="elabel"></LABEL><BR/>
						<input type="text" name="add" placeholder="Address" id="l6"  />&nbsp;<LABEL style="color:red;" id="alabel"></LABEL><BR/>
						<input type="text" name="ph_no" placeholder="Phone Number" id="l7"  />&nbsp;<LABEL style="color:red;" id="plabel"></LABEL><BR/>
						<input type="submit" value="Edit" class="su button"  onclick="return func3()"/><br>
						<input type="reset" value="RESET" class="rs button" />
					</fieldset>
				</form>
			</div>
		</center>
	</body>
</html>
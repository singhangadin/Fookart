<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>
			Admin login
		</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
		<script type="text/javascript" src="js/validation.js"></script>
		<script type="text/javascript" src="js/boxOver.js"></script>
   	</head>
	<body>
		<center>
		<div style="width:30%;
						background:url(/images/gs.png) center top;">
				<form id="sform" action="validate.jsp" method="get">
					<fieldset>
						<h2 class="title">
							Admin Login
						</h2><br>
						<input type="text" name="rname" placeholder="Username" id="s1"/>&nbsp;
							<LABEL style="color:red;" id="rlabel">
							</LABEL><BR/>
						<input type="password" name="rpass" placeholder="Password" id="s2"/>&nbsp;
						<LABEL style="color:red;" id="xlabel">
						</LABEL><BR/>
						<input type="submit" value="Sign In" class="si button" onclick="return func2()"/>&nbsp;&nbsp;&nbsp;
					</fieldset>
				</form>
			</div>
		</center>
	</body>
</html>
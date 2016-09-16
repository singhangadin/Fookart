<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%!	private static final long serialVersionUID = 1L;
	%>
	<head>
		<title>
			Fookart - Login
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		  			   charset=windows-1252" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
		<script type="text/javascript" src="js/validation.js"></script>
		<script type="text/javascript" src="js/boxOver.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
	</head>
	<body>
		<div id="main_container">
	  		<%@ include file="web-modules/top_content.html" %>
	  		<%@ include file="web-modules/header_content.jsp" %>
	    	<div id="main_content">
	    		<%@ include file="web-modules/main_tab.jsp" 
	    		%>
	    		<%@ include file="web-modules/left_content.jsp" 
	    		%>
	    		<div class="center_content"> 
					<div style= "float:left;
								 width:50%;">
						<form id="lform" action="validate.jsp" method="post">
							<fieldset>
								<h2 class="title">
									CREATE YOUR ACCOUNT
								</h2><br>
								<input type="text" name="name" placeholder="Name" id="l1"  />&nbsp;<LABEL style="color:red;" id="ulabel"></LABEL><BR/>
								<input type="text" name="uname" placeholder="Username" id="l2" />&nbsp;<LABEL style="color:red;" id="flabel"></LABEL><BR/>
								<input type="email" name="email_id" placeholder="Email_id" id="l3"  />&nbsp;<LABEL style="color:red;" id="elabel"></LABEL><BR/>
								<input type="password" name="pass" placeholder="Password" id="l4"  />&nbsp;<LABEL style="color:red;" id="llabel"></LABEL><BR/>
								<input type="password" name="cpass" placeholder="Confirm Password" id="l5"  />&nbsp;<LABEL style="color:red;" id="clabel"></LABEL><BR/>
								<input type="text" name="add" placeholder="Address" id="l6"  />&nbsp;<LABEL style="color:red;" id="alabel"></LABEL><BR/>
								<input type="text" name="ph_no" placeholder="Phone Number" id="l7"  />&nbsp;<LABEL style="color:red;" id="plabel"></LABEL><BR/>
								<input type="submit" value="Sign Up" class="su button"  onclick="return func1()"/><br>
								<input type="reset" value="RESET" class="rs button" />
							</fieldset>
						</form>
					</div>
					<div style="float:left;
								width:50%;">
						<form id="sform" action="validate.jsp" method="get">
							<fieldset>
								<h2 class="title">
									SIGN IN TO YOUR ACCOUNT
								</h2><br>
								<input type="text" name="rname" placeholder="Username" id="s1"/>&nbsp;<LABEL style="color:red;" id="rlabel"></LABEL><BR/>
								<input type="password" name="rpass" placeholder="Password" id="s2"/>&nbsp;<LABEL style="color:red;" id="xlabel"></LABEL><BR/>
								<input type="submit" value="Sign In" class="si button" onclick="return func2()"/><br>
								<input type="reset" value="RESET" class="rs button" />
							</fieldset>
						</form>
					</div>
				</div>
   				<%@ include file="web-modules/right_content.jsp" 
	    		%>
	      	</div>
	  		<%@ include file="web-modules/mod_footer.html" 
	    	%>
		</div>
	</body>
</html>	
    
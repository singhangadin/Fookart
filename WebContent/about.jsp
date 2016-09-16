<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%!	private static final long serialVersionUID = 1L;
	%>
	<head>
		<title>
			Fookart - About Us
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		  			   charset=windows-1252" />
		  			   
		<style type="text/css">
		body
		{	padding:0;
			font-family:Arial, Helvetica, sans-serif;
			font-size:11px;
			margin:0px auto auto auto;
			color:#000;
		}
		
		</style>  			   
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
			     	<div class="abt">     	
				     	<img src="images/about us/f.png" style="width:555px ; margin-top:10px;"/>
				     	<img src="images/about us/c.png" style="width:555px ; margin-top:30px;"/>
				     	<img src="images/about us/e.png" style="width:555px ; margin-top:10px;"/>
				     	<img src="images/about us/a.png" style="width:555px ; margin-top:10px;"/>
				     	<img src="images/about us/b.png" style="width:555px ; margin-top:10px;"/>
				     	<img src="images/about us/d.png" style="width:555px ; margin-top:10px;"/>
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
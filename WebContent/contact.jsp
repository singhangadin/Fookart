<%@	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" 
			  content="text/html; charset=ISO-8859-1">
		<title>
			Fookart - Contact
		</title>
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
		      		<div class="center_title_bar">
		      			Contact Us
		      		</div>
		      		<div class="prod_box_big">
		        		<div class="top_prod_box_big">
		        		</div>
		        		<div class="center_prod_box_big">
		          			<div class="contact_form">
		            			<form action="feedback.html" method="post">
		              				<div class="form_row">
		                				<label class="contact" id="nlabel">
		                					<strong>
		                						Name:
			                				</strong>
		    	            			</label>
		        	        			<input type="text" class="contact_input" id="name" name="nname"/>
		            	  			</div>
		 	            	 		<div class="form_row">
		                				<label class="contact" id="elabel">
		                					<strong>
		                						Email:
			                				</strong>
		    	            			</label>
		        	        			<input type="text" class="contact_input" id="email" name="nemail"/>
		            	  			</div>
		              				<div class="form_row">
		       		         			<label class="contact" id="plabel">
		            	    				<strong>
			            	    				Phone:
				            	    		</strong>
		    		            		</label>
		        		        		<input type="text" class="contact_input" id="phone" name="nphone"/>
		            		  		</div>
		              				<div class="form_row">
					                	<label class="contact" id="clabel">
		    			            		<strong>
		        			        			Company:
		            			    		</strong>
		            	    			</label>
		                				<input type="text" class="contact_input" id="company" name="ncomp"/>
		     	         			</div>
		        	      			<div class="form_row">
		            	    			<label class="contact" id="mlabel">
				                			<strong>
		    		            				Message:
		        		        			</strong>
		   		    		         	</label>
		        	    		    	<textarea class="contact_textarea" id="mess" name="nmess"></textarea>
		              				</div>
		              				<div class="form_row"> 
		        	      				<input type="submit" onclick="return performcheck()" value="Send"/> 
		  		          	  		</div>
		            			</form>
		           			</div>
		      			</div>
		        		<div class="bottom_prod_box_big">
		        		</div>
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
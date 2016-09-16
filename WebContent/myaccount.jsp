<%@page import="com.project.model.Info"%>
<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%!	private static final long serialVersionUID = 1L;
	%>
	<head>
		<title>
			Fookart - My Account
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		  			   charset=windows-1252" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
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
				    	My Account
				    </div>
				    <div style='margin-left:20px;margin-top:40px;'>
					<%	if(user==null)
						{	out.print("<div style='margin-left:20px;margin-top:40px;'>");
			    	 		out.print("Sign in/up to use this page");	
							out.print("</div>");
						}
						else if(user.equals("admin"))
						{
					%>
							<h3>
								Welcome
							</h3>
					<%
						}
						else
						{	Connection conm=null;
							Statement stm=null;
							ResultSet rsm=null;
							try
							{	Class.forName(TableData.DB_DRIVER);	 					
			 					conm=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			 					stm=conm.createStatement();
			 					rsm=stm.executeQuery("SELECT * FROM "+TableData.TABLE_INFO+" WHERE USERNAME='"+user+"'");
			 					while(rsm.next())
			 					{	Info info=new Info();
			 						info.setUser(user);
			 						info.setName(rsm.getString(2));
			 						info.setAdd(rsm.getString(3));
			 						info.setPhno(rsm.getString(4));
			 						info.setEmail(rsm.getString(5));
			 		%>
					 			<h1>
					 				Welcome&nbsp;<%out.print(info.getUser()); %>
					 			</h1>
					 			<br/>
					 			<h2>
					 				Details:
					 				<br/>
					 			</h2>
					 			<h3>
						 			Name:&nbsp;<%out.print(info.getName()); %><br/>
						 			Address:&nbsp;<%out.print(info.getAdd()); %><br/>
						 			Phone no.:&nbsp;<%out.print(info.getPhno()); %><br/>
						 			Email ID:&nbsp;<%out.print(info.getEmail()); %>
					 			</h3>
					 			<a class="compare" href="edit.jsp">
					 				Edit
					 			</a>
			 		<%
			 					}
							}
							catch(Exception e)
							{	rsm.close();
								stm.close();
								conm.close();
							}
						}
					%>
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
    
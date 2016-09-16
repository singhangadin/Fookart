<%@page import="com.project.model.Transactn"%>
<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%!	private static final long serialVersionUID = 1L;
	%>
	<head>
		<title>
			Fookart - Shipping
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		  			   charset=windows-1252" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
		<script type="text/javascript" src="js/boxOver.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<style type="text/css">
		th
		{	padding-top:5px;
			padding-bottom:5px;
			padding-left:22px;
			padding-right:22px;
			font-size:15px;
		}
		td
		{	padding-top:2px;
			padding-bottom:2px;
			font-size:12px;
		}
		</style>
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
				    	Shipping
				   	</div>
				     <%	if(user==null)
						{	out.print("<div style='margin-left:20px;margin-top:40px;'>");
				    	 	out.print("Sign in/up to see your Shipments");
							out.print("</div>");
						}
						else
						{	
					%>
					<table border="1" class="shipping_table">
						<tr>
							<th>
								Product ID
							</th>
							<th>
								Quantity
							</th>
							<th>
								Delivery Status
							</th>
							<th>
								Shipping Address					
							</th>
							<th>
								Order Date					
							</th>
						</tr>
						<%		
							Connection con;
							Statement st;
							ResultSet rs;
							Transactn trans;
							try
							{	Class.forName(TableData.DB_DRIVER);
								con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
								st=con.createStatement();
								rs=st.executeQuery("SELECT * FROM "+TableData.TABLE_TRANS+" WHERE TRANS_ID='"+user+"' order by orderdate asc");
								while(rs.next())
								{	trans=new Transactn();
									trans.setTid(rs.getString(1));
									trans.setPid(Integer.parseInt(rs.getString(2)));
									trans.setQuant(Integer.parseInt(rs.getString(3)));
									trans.setStatus(Integer.parseInt(rs.getString(4)));
									trans.setAdd(rs.getString(5));
									trans.setDate(rs.getString(6));
									%>
									<tr>
										<td>
											<%out.print(trans.getPid());%>
										</td>
										<td>
											<%out.print(trans.getQuant());%>
										</td>
										<td>
											<%	switch(trans.getStatus())
												{	case 1:out.print("Processing");
														   break;
														   
													case 2:out.print("Accepted");
														   break;
													   
													case 3:out.print("Dispatched");
													   	   break;
													   	   
													case 4:out.print("Delivered");
														   break;
												   
													default:out.print("");
											
												}
											%>
										</td>
										<td>
											<%out.print(trans.getAdd());%>
										</td>
										<td>
											<%out.print(trans.getDate());%>
										</td>
									</tr>	
								<%
								}
								st.close();
								con.close();
							}
							catch(Exception e)
							{	e.printStackTrace();
						%>
								<tr>
									<td colspan="4">
										Nothing to show
									</td>
								</tr>
						<%
							}
						%>
					</table>
					<%
						}
					%>
				</div>
   				<%@ include file="web-modules/right_content.jsp" 
	    		%>
	      	</div>
	  		<%@ include file="web-modules/mod_footer.html" 
	    	%>
		</div>
	</body>
</html>	
<%@page import="java.sql.DriverManager"%>
<%@page import="com.project.model.TableData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	if(session.getAttribute("username")==null||!session.getAttribute("username").equals("admin")) 
	{	response.sendRedirect("admin.jsp");
	}
	Connection con=null;
	Statement st=null;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			Orders
		</title>
		<script type="text/javascript">
			function enableWid(id)
			{	var check=document.getElementById("ch"+id).checked;
				if(check)
				{	document.getElementById("op"+id).disabled=false;
				}
				else
				{	document.getElementById("op"+id).disabled=true;
				}
			}
		</script>
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
		<div style="height:5em;
					width:101.8%;
					background-color:#000000;
					margin:-1em;
					float:left;">
					<h1 style="color:#DDDDDD;
							   margin-left:40px;
							   margin-top: 20px;
							   margin-bottom: 20px;
							   font-size: 40px;
							   font-family:sans-serif;
							   float: left;">
						Fookart
					</h1>
					<h4 style="color:#DDDDDD;
							  font-size:20px;
							  margin-left:50em;
							  font-family:sans-serif;
							  float: left;">
							  
						<a href="signout.jsp">
							Sign out
						</a>
					</h4>
		</div>
		<div style="height:33.8em;
					width:20%;
					background-color:#111111;
					margin-left:-1em;
					margin-top:1em;
					float:left;">
					<br/><br/>
					<label style="color: white;
								  margin-left: 40px;
								  margin-top: 40px;
								  font-size: xx-large;">
						<a href="manage.jsp">
							Home Page
						</a>				
					</label>
					<br/><br/>
					<label style="color: white;
								  margin-left: 60px;
								  font-size: xx-large;">
						<a href="orders.jsp">
							Orders
						</a>				
					</label>
		</div>
		<div style="height:33.8em;
					width:81.272%;
					margin-top:1em;
					margin-left:-1px;
					float:left;">
					
			<div style="width:100%;
						height:33.8em;
						background-color:#FFFFFF;
						float:left;">
					<form method="post" action="OrdersEdit">
				<%	try
					{	Class.forName(TableData.DB_DRIVER);
						con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
						st=con.createStatement();
						ResultSet rs=st.executeQuery("select * from "+TableData.TABLE_TRANS);
				%>
						<table border="1">
							<tr>
								<th>
								</th>
								<th>
									Transaction ID
								</th>
								<th>
									Product ID
								</th>
								<th>
									Quantity
								</th>
								<th>
									Current Status
								</th>
								<th>
									Shipping Address
								</th>
								<th>
									Order Date
								</th>
								<th>
									Selection
								</th>
							</tr>
					<% 	int i=0;
						while(rs.next())
						{
					%>
							<tr>
								<td>
									<center>
										<input type="checkbox" name="ch<%=i%>" id="ch<%=i%>" onchange="enableWid('<%=i%>')"/>
									</center>
								</td>
								<td>
									<center>	
										<%=rs.getString(1) %>
									</center>
								</td>
								<td>
									<center>
										<%=rs.getString(2) %>
									</center>
								</td>
								<td>
									<center>
										<%=rs.getString(3) %>
									</center>
								</td>
								<td>
									<center>
										<%	switch(Integer.parseInt(rs.getString(4)))
											{	case 1:out.print("Processing");
													   break;
													   
												case 2:out.print("Accepted");
													   break;
												   
												case 3:out.print("Dispatched");
												   	   break;
												   	   
												case 4:out.print("Delivered");
													   break;
											   
												default:break;
											}
										%>
									</center>
								</td>
								<td>
									<center>
										<%=rs.getString(5) %>
									</center>
								</td>
								<td>
									<center>	
										<%=rs.getString(6) %>
										<input type="hidden" value="<%=rs.getString(1) %>" name="tid<%=i%>"/>
										<input type="hidden" value="<%=rs.getString(2) %>" name="pid<%=i%>"/>
										<input type="hidden" value="<%=rs.getString(6) %>" name="date<%=i%>"/>
									</center>
								</td>
								<td>
									<center>
										<select name="op<%=i%>" id="op<%=i%>" disabled="disabled">
											<option value="1">
												Processing
											</option>
											<option value="2">
												Accepted
											</option>
											<option value="3">
												Dispatched
											</option>
											<option value="4">
												Delivered
											</option>
										</select>
									</center>
								</td>
							</tr>
				<%			i++;
						}
						con.close();
					}
					catch(NullPointerException e)
					{	e.printStackTrace();
				%>
							<tr>
								<td colspan="8">
									Nothing to show
								</td>
							</tr>
				<%	
					}	
					catch(Exception e)
					{	e.printStackTrace();
					}
				%>
					
						</table>
						<br/>
						<input type="submit" value="Apply" style="margin-left: 90%;"/>
					</form>
			</div>
		</div>
	</body>
</html>
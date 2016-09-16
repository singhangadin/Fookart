<%@page import="com.project.model.Cart"%>
<%@page import="com.project.model.Product"%>
<%@page import="java.util.Queue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%!	private static final long serialVersionUID = 1L;
		private Product prod;
	%>
	<head>
		<title>
			Fookart - Search
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		 			   charset=windows-1252" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
		<script type="text/javascript" src="js/boxOver.js"></script>
		<script type="text/javascript" src="js/windowopen.js"></script>
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
	    		<div class="center_content" id="content_div">
	      			<%	String key=request.getParameter("q");
	   		 			Connection con1=null;
		 				Statement st1=null;
		 				ResultSet rs1=null,rs2=null;
		 				prod=new Product();
		 				try
		 				{	Class.forName(TableData.DB_DRIVER);	 					
		 					ArrayList<Integer> ARR=new ArrayList<Integer>();
		 					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		 					st1=con1.createStatement();
		 					rs1=st1.executeQuery("SELECT prod_id FROM "+TableData.TABLE_SRCH+" WHERE PROD_KEY='"+key.toLowerCase()+"'");
		 					while(rs1.next())
		 					{	prod.setId(Integer.parseInt(rs1.getString(1)));
		 						ARR.add(prod.getId());
		 					}
		 					for(int i=0;i<ARR.size();i++)
		 					{	rs2=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+ARR.get(i));
		 						while(rs2.next())
								{	prod.setId(ARR.get(i));
		 							prod.setName(rs2.getString(2));
									prod.setPrice(Integer.parseInt(rs2.getString(3)));
									prod.setImagepath(rs2.getString(5));
		 			%>
				      				<div class="prod_box">
										<div class="top_prod_box"> 
										</div> 
										<div class="center_prod_box"> 
						  					<div class="product_title"> 
												<a href="details.jsp?pid=<% out.print(prod.getId());%>"> 
													<% out.print(prod.getName());%>
												</a> 
											</div> 
						  					<div class="product_img"> 
												<a href="details.jsp?pid=<%out.print(prod.getId());%>"> 
													<img src="<%out.print(prod.getImagepath());%>" alt="" border="0" max-width="100px" height="90px"/> 
												</a> 
											</div> 
							     			<div class="prod_price"> 
												<span class="reduce">
													Rs.&nbsp;<% out.print((prod.getPrice()-prod.getPrice()*0.2));%>
													&nbsp;
												</span> 
													<span class="price"> 
														Rs.&nbsp;<%out.print(prod.getPrice());%>
													</span> 
												</div> 
											</div> 
											<div class="bottom_prod_box"> 
											</div> 
											<div class="prod_details_tab"> 
												<a href="details.jsp?pid=<% out.print(prod.getId());%>" class="prod_details"> 
													details 
												</a> 
											</div> 
						  				</div>
						  				
	    			<%			}
	    					}
	 					}
		 				catch(ClassNotFoundException e)
		 				{	e.printStackTrace();
		 				}
		 				catch(SQLException e) 
		 				{	e.printStackTrace();
		 				}
		 				finally
		 				{	try
		 					{	rs1.close();
		 						rs2.close();
								st1.close();
								con1.close();
							}
							catch(SQLException e)
							{	e.printStackTrace();
							}
		 					catch(NullPointerException e)
		 					{	e.printStackTrace();	
		 						out.print("Nothing was Found");
		 						
		 					}
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
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
			Fookart - Details
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
	      			<%	String pid=request.getParameter("pid");
	   		 			Connection con1=null;
		 				Statement st1=null;
		 				ResultSet rs1=null;
		 				prod=new Product();
		 				try
		 				{	Class.forName(TableData.DB_DRIVER);	 					
		 					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		 					st1=con1.createStatement();
		 					st1.executeUpdate("UPDATE "+TableData.TABLE_PROD+" set clicks=clicks+1 where prod_id='"+pid+"'");
		 					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid);
		 					while(rs1.next())
		 					{	prod.setId(Integer.parseInt(pid));
		 						prod.setName(rs1.getString(2));
		 						prod.setPrice(Integer.parseInt(rs1.getString(3)));
		 						prod.setDesc(rs1.getString(4));
		 						prod.setImagepath(rs1.getString(5));
		 						prod.setClicks(Integer.parseInt(rs1.getString(6)));
		 						prod.setQuant(Integer.parseInt(rs1.getString(7)));
		 			%>
			      			<div class="center_title_bar">
			      				<%out.print(prod.getName()); %>
			      			</div>
			      			<div class="prod_box_big">
			        			<div class="top_prod_box_big">
			        			</div>
			        			<div class="center_prod_box_big">
			          				<div class="product_img_big"> 
			          					<a href="javascript:popImage('<% out.print(prod.getImagepath());%>','<%out.print(prod.getImagepath()); %>')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
			          						<img src="<% out.print(prod.getImagepath().substring(0,prod.getImagepath().indexOf("."))+"-large"+prod.getImagepath().substring(prod.getImagepath().indexOf("."),prod.getImagepath().length()));%>" alt="" border="0" width="150px"/>
			          					</a>
			            				<div class="thumbs"> 
			            					<a href="#" title="header=[Thumb1] body=[&nbsp;] fade=[on]">
			            						<img src="<% out.print(prod.getImagepath());%>" alt="" border="0" width="40px"/>
			            					</a> 
			            					<a href="#" title="header=[Thumb2] body=[&nbsp;] fade=[on]">
			            						<img src="<% out.print(prod.getImagepath());%>" alt="" border="0" width="40px"/>
			            					</a> 
			            					<a href="#" title="header=[Thumb3] body=[&nbsp;] fade=[on]">
			            						<img src="<% out.print(prod.getImagepath());%>" alt="" border="0" width="40px"/>
			            					</a> 
			            				</div>
			 			         	</div>
			          				<div class="details_big_box">
			            				<div class="product_title_big">
			            					<% out.print(prod.getName());%>
			            				</div>
			            				<div class="specifications"> 
			            					Availability
			            					<span class="blue">
			            						In stock &nbsp;(<%out.print(prod.getQuant()); %>)
			            					</span><br />
			              					Warranty:
			              					<span class="blue">
			              						1 Year Onsite
			              					</span><br/>
			              					Views:
			              					<span class="blue">
			              						<%out.print(prod.getClicks()); %>
			              					</span><br/><br/>
			              					<%	ArrayList<Integer> brack=new ArrayList<Integer>();
			              						for(int i=0;i<prod.getDesc().length();i++)
			              						{	char ch=prod.getDesc().charAt(i);
			              							switch(ch)
			              							{	case '(':
			              								case ')':
			              								case '/':brack.add(i);
			              										 break;
			              										 
			              								default:break;
			              							}
			              						}
			              						int br=brack.get(0)+1;
												for(int i=1;i<brack.size();i++)
												{	if(prod.getDesc().charAt(brack.get(i))=='/')
													{	out.print("<span>"+prod.getDesc().substring(br,brack.get(i))+"</span>");
														br=brack.get(i)+1;
													}
													else if(prod.getDesc().charAt(brack.get(i))==')' && prod.getDesc().charAt(brack.get(i-1))=='(')
													{	//Print Blue
														out.print("<span class='blue'><B>"+prod.getDesc().substring(br,brack.get(i))+"</B></span>");
														br=brack.get(i)+2;
													}
													else if(prod.getDesc().charAt(brack.get(i))==')' && prod.getDesc().charAt(brack.get(i-1))=='/')
													{	//Print Black
														out.print("<span>"+prod.getDesc().substring(br,brack.get(i))+"</span>");
														br++;
													}
													else
													{	br=brack.get(i)+1;
													}
													out.print("<br/>");
												}
			              					%>
			            				</div>
			            				<div class="prod_price_big">
			            					<span class="reduce">
			            						<% out.print("Rs. "+(prod.getPrice()+prod.getPrice()*0.20));%>
			            					</span> &nbsp;&nbsp;
			            					<span class="price">
			            						<% out.print("Rs. "+prod.getPrice());%>
			            					</span>
			            				</div>
			            				
			            				<%	if(session.getAttribute("username")!=null)
			            					{	
			            				%>		<form action="CartServlet" method="POST">
						            				<b style="font-size:12px;">Quantity:</b> 
						            				<br/>
						            				<input type="hidden" value="<%out.print(prod.getId());%>" name="pid"/>
						            				<select style="margin-top:10px;" name="quantity">
						            					<option>
						            						1
						            					</option>
						            					<option>
						            						2
						            					</option>
						            					<option>
						            						3
						            					</option>
						            					<option>
						            						4
						            					</option>
						            					<option>
						            						5
						            					</option>
						            				</select>
						            				<br/>
						            				<input type="submit" value="add to cart" style="margin-top:10px;
						            															    margin-bottom:10px;"/> 
					            				</form>
			            				<%	}
			            				%>
			            				</div>
			        			</div>
			        			<div class="bottom_prod_box_big">
			        			</div>
			      			</div>
	    			<%		}
	 					}
		 				catch(Exception e)
		 				{	e.printStackTrace();
		 				}
		 				finally
		 				{	try
		 					{	rs1.close();
								st1.close();
								con1.close();
							}
							catch(Exception e)
							{	e.printStackTrace();
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
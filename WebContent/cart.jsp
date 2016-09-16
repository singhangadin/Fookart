<%@page import="java.net.URLEncoder"%>
<%@page import="com.project.model.TableData"%>
<%@page import="com.project.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%!	private static final long serialVersionUID = 1L;
		Product prod;
		private int total;	
	%>
	<head>
		<title>
			Fookart - Cart
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		  			   charset=windows-1252" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />	
		<script type="text/javascript" src="js/boxOver.js"></script>
		<script type="text/javascript" src="js/validation.js"></script>
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
	    		<div class="center_content">
					<div class="center_title_bar">
						<%out.print("Cart"); %>
					</div>
					<%	String pid;
						boolean empty=false;
						if(user!=null)
						{	Connection cartcon=null;
							Statement cst1=null,cst2=null;
							ResultSet rsout=null;
							ResultSet rsin=null;
							try
							{	Class.forName(TableData.DB_DRIVER);	 					
								cartcon=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
								cst1=cartcon.createStatement();
								rsout=cst1.executeQuery("SELECT PROD_ID,QUANT FROM "+TableData.TABLE_CART+" WHERE USERNAME='"+user+"'");
								prod=new Product();
								while(rsout.next())
								{	prod.setId(Integer.parseInt(rsout.getString(1)));
									prod.setQuant(Integer.parseInt(rsout.getString(2)));
									try
									{	cst2=cartcon.createStatement();
										rsin=cst2.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID='"+prod.getId()+"'");	
										while(rsin.next())
										{	prod.setName(rsin.getString(2));
											prod.setPrice(Integer.parseInt(rsin.getString(3)));
											prod.setDesc(rsin.getString(4));
											prod.setImagepath(rsin.getString(5));
											prod.setClicks(Integer.parseInt(rsin.getString(6)));	
						%>
											<div class="prod_box_big">
											 	<div class="top_prod_box_big">
									        	</div>
									        	<div class="center_prod_box_big">
									        		<div class="product_img_big"> 
									        			<a href="javascript:popImage('<% out.print(prod.getImagepath());%>','<%out.print(prod.getName()); %>')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
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
									           				<a href="details.jsp?pid=<% out.print(prod.getId());%>">
									           					<% out.print(prod.getName());%>
									           				</a>
									           			</div>
									           			<div class="specifications"> 
									           				Availability:
									           				<span class="blue">
									           					Quantity:<%out.print(prod.getQuant()); %>
									           				</span><br />
									           				Warranty:
									           				<span class="blue">
									           					1 Year Onsite
									           				</span><br/>
									           				Views:
									           				<span class="blue">
									           					<%out.print(prod.getClicks()); %>
									           				</span>
									           				<br/>
									           				<br/>
						<%									ArrayList<Integer> brack=new ArrayList<Integer>();
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
																{	out.print("<span class='blue'><B>"+prod.getDesc().substring(br,brack.get(i))+"</B></span>");
																	br=brack.get(i)+2;
																}
																else if(prod.getDesc().charAt(brack.get(i))==')' && prod.getDesc().charAt(brack.get(i-1))=='/')
																{	out.print("<span>"+prod.getDesc().substring(br,brack.get(i))+"</span>");
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
									            				<% out.print("Rs. "+(prod.getPrice()-prod.getPrice()*0.2));%>
									            			</span> &nbsp;&nbsp;
									            			<span class="price">
									            				<% out.print("Rs. "+prod.getPrice());
									            				   total+=prod.getPrice();%>
									            			</span>
									            		</div>
									            		<form action="CartServlet" method="GET">
								            				<b style="font-size:12px;">Quantity:</b> 
								            				<br/>
								            				<input type="hidden" value="<%out.print(prod.getId());%>" name="pid"/>
								            				<select style="margin-top:10px;" name="quantity">
								            					<%	int quant=prod.getQuant(); 
								            						while(quant>0)
								            						{	out.print("<option>");
								            							out.print(quant);
								            							out.print("</option>");
							            								quant--;
								            						}
								            					%>
								            				</select>
								            				<br/>
								            				<input type="submit" value="remove from cart" style="margin-top:10px;
								            															   		 margin-bottom:10px;"/> 
							            				</form>
									            	</div>
									        	</div>
									        	<div class="bottom_prod_box_big">
									        	</div>
								      		</div>
					<%					}
									}
									catch(NullPointerException e)
									{	e.printStackTrace();
									}
								}
							}
							catch(ClassNotFoundException e)
							{	e.printStackTrace();
							}
							catch(SQLException e) 
							{	e.printStackTrace();	
							}
							catch(NullPointerException e)
							{	e.printStackTrace();
							}
							finally
							{	try
								{	rsout.close();
									rsin.close();
									cst2.close();
									cst1.close();
									cartcon.close();
								}
								catch(SQLException e)
								{	e.printStackTrace();	
								}
								catch(NullPointerException e)
								{	e.printStackTrace();
									empty=true;
									out.print("Cart is Empty");	
								}
							} 
						}
						else
						{	out.print("<div style='margin-left:20px;margin-top:40px;'>");
			    	 		out.print("Sign in to see your cart");	
			    	 		out.print("</div>");
							empty=true;
						}
						if(!empty)
						{
					%>
							<form action="Transaction" method="post" style="margin-left:15px;">
								<div class="top_prod_box_big">
								</div>
								<div class="center_prod_box_big">
									<input type="submit" name="button" value="Checkout"/>
									<input type="submit" name="button" value="Discard"/>
								</div>
								<div class="bottom_prod_box_big">
								</div>
							</form>
					<%	} 
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
    
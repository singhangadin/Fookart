<%@page import="java.util.ArrayList"%>
<%@page import="com.project.model.TableData"%>
<%@page import="com.project.model.Product"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<div id="header">
    <div id="logo"> 
    	<!--
    	<a href="about.jsp">
    		<img src="images/Fookart.png" alt="" border="0" max-width="237" height="140" />
    	</a>
    	--> 
    </div>
    <div class="oferte_content">
    	<div class="top_divider">
    		<img src="images/header_divider.png" alt="" width="1" height="164" />
    	</div>
    	<div class="oferta">
    		<div class="oferta_content" id="head_div"> 
    			<% 	Connection conh=null;
					Statement sth=null;
					ResultSet rsh=null;
					Product prodh;
					try 
					{	Class.forName(TableData.DB_DRIVER);
						conh=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
						sth=conh.createStatement();
						rsh=sth.executeQuery("SELECT prod_id, prod_name, descript, img_path FROM "+TableData.TABLE_PROD+" WHERE CLICKS=(SELECT MAX(CLICKS) as max_click FROM "+TableData.TABLE_PROD+")AND PROD_ID=(SELECT MIN(PROD_ID) FROM(SELECT * FROM "+TableData.TABLE_PROD+" WHERE CLICKS=(SELECT MAX(CLICKS)FROM "+TableData.TABLE_PROD+" as max_clicks))as min_prod)");
						while(rsh.next())
						{	prodh=new Product();
							prodh.setId(Integer.parseInt(rsh.getString(1)));
							prodh.setName(rsh.getString(2));
							prodh.setDesc(rsh.getString(3));
							prodh.setImagepath(rsh.getString(4));
    			%>
			    			<img src="<% out.print(prodh.getImagepath());%>" max-width="94" height="92" alt="" border="0" class="oferta_img" />
			       			<div class="oferta_details">
			          			<div class="oferta_title">
			          				<% out.print(prodh.getName());%>
			         			</div>
			        			<div class="oferta_text"> 
			       					<%  ArrayList<Integer> brack=new ArrayList<Integer>();
									    for(int i=0;i<prodh.getDesc().length();i++)
									    {	char ch=prodh.getDesc().charAt(i);
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
									    {	if(prodh.getDesc().charAt(brack.get(i))=='/')
											{	out.print("<span>"+prodh.getDesc().substring(br,brack.get(i))+"</span>");
												br=brack.get(i)+1;
											}
											else if(prodh.getDesc().charAt(brack.get(i))==')' && prodh.getDesc().charAt(brack.get(i-1))=='(')
											{	out.print("<span><B>"+prodh.getDesc().substring(br,brack.get(i))+"</B></span>");
												br=brack.get(i)+2;
											}
											else if(prodh.getDesc().charAt(brack.get(i))==')' && prodh.getDesc().charAt(brack.get(i-1))=='/')
											{	out.print("<span>"+prodh.getDesc().substring(br,brack.get(i))+"</span>");
												br++;
											}
											else
											{	br=brack.get(i)+1;
											}
											out.print("<br/>");
										}
									%>
									</div>
			           			<a href="details.jsp?pid=<% out.print(prodh.getId());%>" class="details">
			           				details
			           			</a> 
			           		</div>
           		<% 		}
					}
					catch(ClassNotFoundException e) 
					{	e.printStackTrace();
					} 
					catch(SQLException e) 
					{	e.printStackTrace();
					} 
					finally
					{	try
						{	rsh.close();
							sth.close();
							conh.close();
						}
						catch(SQLException e)
						{	e.printStackTrace();
						}
						catch(NullPointerException e)
						{	e.printStackTrace();
						}
					}
    			%>
       		</div>
    	</div>
    	<div class="top_divider">
    		<img src="images/header_divider.png" alt="" width="1" height="164" />
    	</div>
    </div>	
</div>
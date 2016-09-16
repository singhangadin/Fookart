<%@page import="com.project.model.TableData"%>
<%@page import="com.project.model.Product"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Queue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">	
	<%!	private static final long serialVersionUID = 1L;
	%>
	<head>
		<title>
			Fookart - Products
		</title>
		<meta http-equiv="Content-Type" 
			  content="text/html; 
		  			   charset=windows-1252" />
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/boxOver.js"></script>
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
    		<div class="center_content" id="products_div">
				<%!	public void outData(JspWriter out,String a,String b) throws IOException
						{	Connection con=null;
							Statement st=null;
							ResultSet rs=null;
							Product prod;
							String query;
							if(!a.equals("all"))
							{	query="SELECT * FROM "+TableData.TABLE_PROD+" WHERE category='"+a+"' order by "+b;
							}
							else
							{	query="SELECT * FROM "+TableData.TABLE_PROD+" order by "+b;
							}
							try 
							{	Class.forName(TableData.DB_DRIVER);
								con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
								st=con.createStatement();
								rs=st.executeQuery(query);
					%>				
								<div class="center_title_bar">
									<label style="padding-right:10px;float:left;">
										Filter
									</label>
									<form action="products.jsp" style="margin:5px;">
										<input type="hidden" name="q" value="<%out.print(request.getParameter("q"));%>"/>
										<select name="o">
											<option value="id" <%if(request.getParameter("o").equals("id"))
																 {	out.print("selected='selected'");
																 }%>>
												Select an option
											</option>
											<option value="name" <%if(request.getParameter("o").equals("name"))
																   {   out.print("selected='selected'");
																   }%>>
												Name
											</option>
											<option value="phl" <%if(request.getParameter("o").equals("phl"))
																  {   out.print("selected='selected'");
																  }%>>
												Price (high to low)
											</option>
											<option value="plh" <%if(request.getParameter("o").equals("plh"))
																  {   out.print("selected='selected'");
																  }%>>
												Price (low to high)
											</option>
											<option value="pop" <%if(request.getParameter("o").equals("pop"))
																  {   out.print("selected='selected'");
																  }%>>
												Popularity
											</option>
											<option value="avail" <%if(request.getParameter("o").equals("avail"))
																    {   out.print("selected='selected'");
																    }%>>
												Availability
											</option>
										</select>
										<input value="Apply" type="submit" style="float:right;"/>
									</form>
								</div>
								<div class="center_title_bar">
									Latest Products
								</div>
								<div id="prod_list" style="float:left;">
					<%!			while(rs.next())
								{	prod=new Product();
									prod.setId(Integer.parseInt(rs.getString(1)));
									prod.setName(rs.getString(2));
									prod.setPrice(Integer.parseInt(rs.getString(3)));
									prod.setImagepath(rs.getString(5));
									out.println
									(	"<div class='prod_box'>"+
											"<div class='top_prod_box'>"+
											"</div>"+
											"<div class='center_prod_box'>"+
					  							"<div class='product_title'>"+
													"<a href='details.jsp?pid="+prod.getId()+"'>"+
														prod.getName()+
													"</a>"+
												"</div>"+
						  						"<div class='product_img'>"+
													"<a href='details.jsp?pid="+prod.getId()+"'>"+
														"<img src='"+prod.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
													"</a>"+
												"</div>"+
							     				"<div class='prod_price'>"+
													"<span class='reduce'>Rs."+
													(prod.getPrice()+prod.getPrice()*0.2)+
													"&nbsp;</span>"+
													"<span class='price'> Rs."+
															prod.getPrice()+
													"</span>"+
												"</div>"+
											"</div>"+
											"<div class='bottom_prod_box'>"+
											"</div>"+
											"<div class='prod_details_tab'>"+ 
												"<a href='details.jsp?pid="+prod.getId()+"' class='prod_details'>"+
													"details"+
												"</a>"+
											"</div>"+
						  				"</div>"
									);
								}
							}
							catch(Exception e) 
							{	e.printStackTrace();
							}
							finally
							{	try
								{	rs.close();
									st.close();
									con.close();
								}
								catch(Exception e)
								{	e.printStackTrace();
								}
							}
						}
					%>
					<%	String query=request.getParameter("q");
						String order=request.getParameter("o");
						String sort;
						if(order.equals("name"))
						{	sort="prod_name asc";
						}
						else if(order.equals("phl"))
						{	sort="price desc";
						}
						else if(order.equals("plh"))
						{	sort="price asc";
						}
						else if(order.equals("pop"))
						{	sort="clicks desc";
						}
						else if(order.equals("avail"))
						{	sort="quant desc";
						}
						else
						{	sort="prod_id asc";
						}
						outData(out,query,sort);	
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
					
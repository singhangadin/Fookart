<%@page import="java.util.Random"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%!	private static final long serialVersionUID = 1L;
		private Random ran;
	%>
	<head>
		<title>
			Fookart Store
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
      			<a href="products.jsp?q=all">
      				<span>
      					<img src="images/sale.gif" max-height="100px" width="585px"/>
      				</span>
      			</a>
      			<H1 style="color:white;
      					   padding:10px;
      					   background:#49C4D0;
      					   font-size:25px;">
      				Deals of the day
      			</H1>
      			<H2 class="home_heading">
      				Laptops
      			</H2>
      			<% 	ran=new Random();
      				int pid[]=ran.ints(3,1,7).toArray();
      				for(int i=0;i<3;i++)
	  				{	Connection con1=null;
		  				Statement st1=null;
		  				ResultSet rs1=null;
		  				Product prod1;
		  				try
	  					{	Class.forName(TableData.DB_DRIVER);
		  					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		  					st1=con1.createStatement();
		  					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid[i]);
		  					while(rs1.next())
		  					{	prod1=new Product();
		  						prod1.setId(Integer.parseInt(rs1.getString(1)));
		  						prod1.setName(rs1.getString(2));
		  						prod1.setPrice(Integer.parseInt(rs1.getString(3)));
		  						prod1.setImagepath(rs1.getString(5));
		  						out.println
		  						(	"<div class='prod_box'>"+
		  								"<div class='top_prod_box'>"+
		  								"</div>"+
		  								"<div class='center_prod_box'>"+
		  		  							"<div class='product_title'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											prod1.getName()+
		  										"</a>"+
		  									"</div>"+
		  			  						"<div class='product_img'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											"<img src='"+prod1.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
		  										"</a>"+
		  									"</div>"+
		  				     				"<div class='prod_price'>"+
		  										"<span class='reduce'>Rs."+
		  										(prod1.getPrice()-prod1.getPrice()*0.2)+
		  										"&nbsp;</span>"+
		  										"<span class='price'> Rs."+
		  												prod1.getPrice()+
		  										"</span>"+
		  									"</div>"+
		  								"</div>"+
		  								"<div class='bottom_prod_box'>"+
		  								"</div>"+
		  								"<div class='prod_details_tab'>"+ 
		  									"<a href='details.jsp?pid="+prod1.getId()+"' class='prod_details'>"+
		  										"details"+
		  									"</a>"+
		  								"</div>"+
		  			  				"</div>"
		  						);
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
		  						st1.close();
		  						con1.close();
		  					}
		  					catch(SQLException e)
		  					{	e.printStackTrace();	
		  					}
		  					catch(NullPointerException e)
		  					{	e.printStackTrace();
		  					}
		  				}
	  				} 
      			%>
      			<H2 class="home_heading">
      				Mobiles
      			</H2>
      			<% 	ran=new Random();
  					int pid1[]=ran.ints(3,11,17).toArray();
  					for(int i=0;i<3;i++)
	  				{	Connection con1=null;
		  				Statement st1=null;
		  				ResultSet rs1=null;
		  				Product prod1;
		  				try
	  					{	Class.forName(TableData.DB_DRIVER);
		  					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		  					st1=con1.createStatement();
		  					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid1[i]);
		  					while(rs1.next())
		  					{	prod1=new Product();
		  						prod1.setId(Integer.parseInt(rs1.getString(1)));
		  						prod1.setName(rs1.getString(2));
		  						prod1.setPrice(Integer.parseInt(rs1.getString(3)));
		  						prod1.setImagepath(rs1.getString(5));
		  						out.println
		  						(	"<div class='prod_box'>"+
		  								"<div class='top_prod_box'>"+
		  								"</div>"+
		  								"<div class='center_prod_box'>"+
		  		  							"<div class='product_title'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											prod1.getName()+
		  										"</a>"+
		  									"</div>"+
		  			  						"<div class='product_img'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											"<img src='"+prod1.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
		  										"</a>"+
		  									"</div>"+
		  				     				"<div class='prod_price'>"+
		  										"<span class='reduce'>Rs."+
		  										(prod1.getPrice()-prod1.getPrice()*0.2)+
		  										"&nbsp;</span>"+
		  										"<span class='price'> Rs."+
		  												prod1.getPrice()+
		  										"</span>"+
		  									"</div>"+
		  								"</div>"+
		  								"<div class='bottom_prod_box'>"+
		  								"</div>"+
		  								"<div class='prod_details_tab'>"+ 
		  									"<a onclick='#' href='details.jsp?pid="+prod1.getId()+"' class='prod_details'>"+
		  										"details"+
		  									"</a>"+
		  								"</div>"+
		  			  				"</div>"
		  						);
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
		  						st1.close();
		  						con1.close();
		  					}
		  					catch(SQLException e)
		  					{	e.printStackTrace();
		  					}
		  					catch(NullPointerException e)
		  					{	e.printStackTrace();
		  						
		  					}
		  				}
	  				} 
      			%>
      			<H2 class="home_heading">
      				Watches
      			</H2>
      			<% 	ran=new Random();
					int pid2[]=ran.ints(3,21,27).toArray();
  					for(int i=0;i<3;i++)
	  				{	Connection con1=null;
		  				Statement st1=null;
		  				ResultSet rs1=null;
		  				Product prod1;
		  				try
	  					{	Class.forName(TableData.DB_DRIVER);
		  					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		  					st1=con1.createStatement();
		  					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid2[i]);
		  					while(rs1.next())
		  					{	prod1=new Product();
		  						prod1.setId(Integer.parseInt(rs1.getString(1)));
		  						prod1.setName(rs1.getString(2));
		  						prod1.setPrice(Integer.parseInt(rs1.getString(3)));
		  						prod1.setImagepath(rs1.getString(5));
		  						out.println
		  						(	"<div class='prod_box'>"+
		  								"<div class='top_prod_box'>"+
		  								"</div>"+
		  								"<div class='center_prod_box'>"+
		  		  							"<div class='product_title'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											prod1.getName()+
		  										"</a>"+
		  									"</div>"+
		  			  						"<div class='product_img'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											"<img src='"+prod1.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
		  										"</a>"+
		  									"</div>"+
		  				     				"<div class='prod_price'>"+
		  										"<span class='reduce'>Rs."+
		  										(prod1.getPrice()-prod1.getPrice()*0.2)+
		  										"&nbsp;</span>"+
		  										"<span class='price'> Rs."+
		  												prod1.getPrice()+
		  										"</span>"+
		  									"</div>"+
		  								"</div>"+
		  								"<div class='bottom_prod_box'>"+
		  								"</div>"+
		  								"<div class='prod_details_tab'>"+ 
		  									"<a onclick='#' href='details.jsp?pid="+prod1.getId()+"' class='prod_details'>"+
		  										"details"+
		  									"</a>"+
		  								"</div>"+
		  			  				"</div>"
		  						);
		  					}
	  					}
	  					catch(ClassNotFoundException e)
		  				{	e.printStackTrace();	
		  				}
		  				catch(SQLException e) 
		  				{
		  				} 
		  				finally
		  				{	try
		  					{	rs1.close();
		  						st1.close();
		  						con1.close();
		  					}
		  					catch(SQLException e)
		  					{	e.printStackTrace();
		  					}
		  					catch(NullPointerException e)
		  					{	e.printStackTrace();
		  						
		  					}
		  				}
	  				} 
      			%>
      			<H2 class="home_heading">
      				Headphones
      			</H2>
      			<% 	ran=new Random();
					int pid3[]=ran.ints(3,31,37).toArray();
  					for(int i=0;i<3;i++)
	  				{	Connection con1=null;
		  				Statement st1=null;
		  				ResultSet rs1=null;
		  				Product prod1;
		  				try
	  					{	Class.forName(TableData.DB_DRIVER);
		  					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		  					st1=con1.createStatement();
		  					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid3[i]);
		  					while(rs1.next())
		  					{	prod1=new Product();
		  						prod1.setId(Integer.parseInt(rs1.getString(1)));
		  						prod1.setName(rs1.getString(2));
		  						prod1.setPrice(Integer.parseInt(rs1.getString(3)));
		  						prod1.setImagepath(rs1.getString(5));
		  						out.println
		  						(	"<div class='prod_box'>"+
		  								"<div class='top_prod_box'>"+
		  								"</div>"+
		  								"<div class='center_prod_box'>"+
		  		  							"<div class='product_title'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											prod1.getName()+
		  										"</a>"+
		  									"</div>"+
		  			  						"<div class='product_img'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											"<img src='"+prod1.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
		  										"</a>"+
		  									"</div>"+
		  				     				"<div class='prod_price'>"+
		  										"<span class='reduce'>Rs."+
		  										(prod1.getPrice()-prod1.getPrice()*0.2)+
		  										"&nbsp;</span>"+
		  										"<span class='price'> Rs."+
		  												prod1.getPrice()+
		  										"</span>"+
		  									"</div>"+
		  								"</div>"+
		  								"<div class='bottom_prod_box'>"+
		  								"</div>"+
		  								"<div class='prod_details_tab'>"+ 
		  									"<a onclick='#' href='details.jsp?pid="+prod1.getId()+"' class='prod_details'>"+
		  										"details"+
		  									"</a>"+
		  								"</div>"+
		  			  				"</div>"
		  						);
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
		  						st1.close();
		  						con1.close();
		  					}
		  					catch(SQLException e)
		  					{	e.printStackTrace();
		  					}
		  					catch(NullPointerException e)
		  					{	e.printStackTrace();
		  					}
		  				}
	  				} 
      			%>
      			<H2 class="home_heading">
      				Televisions
      			</H2>
      			<% 	ran=new Random();
					int pid4[]=ran.ints(3,41,47).toArray();
  					for(int i=0;i<3;i++)
	  				{	Connection con1=null;
		  				Statement st1=null;
		  				ResultSet rs1=null;
		  				Product prod1;
		  				try
	  					{	Class.forName(TableData.DB_DRIVER);
		  					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		  					st1=con1.createStatement();
		  					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid4[i]);
		  					while(rs1.next())
		  					{	prod1=new Product();
		  						prod1.setId(Integer.parseInt(rs1.getString(1)));
		  						prod1.setName(rs1.getString(2));
		  						prod1.setPrice(Integer.parseInt(rs1.getString(3)));
		  						prod1.setImagepath(rs1.getString(5));
		  						out.println
		  						(	"<div class='prod_box'>"+
		  								"<div class='top_prod_box'>"+
		  								"</div>"+
		  								"<div class='center_prod_box'>"+
		  		  							"<div class='product_title'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											prod1.getName()+
		  										"</a>"+
		  									"</div>"+
		  			  						"<div class='product_img'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											"<img src='"+prod1.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
		  										"</a>"+
		  									"</div>"+
		  				     				"<div class='prod_price'>"+
		  										"<span class='reduce'>Rs."+
		  										(prod1.getPrice()-prod1.getPrice()*0.2)+
		  										"&nbsp;</span>"+
		  										"<span class='price'> Rs."+
		  												prod1.getPrice()+
		  										"</span>"+
		  									"</div>"+
		  								"</div>"+
		  								"<div class='bottom_prod_box'>"+
		  								"</div>"+
		  								"<div class='prod_details_tab'>"+ 
		  									"<a onclick='#' href='details.jsp?pid="+prod1.getId()+"' class='prod_details'>"+
		  										"details"+
		  									"</a>"+
		  								"</div>"+
		  			  				"</div>"
		  						);
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
		  						st1.close();
		  						con1.close();
		  					}
		  					catch(SQLException e)
		  					{	e.printStackTrace();
		  					}
		  					catch(NullPointerException e)
		  					{	e.printStackTrace();
		  					}
		  				}
	  				} 
      			%>
      			<H2 class="home_heading">
      				Cameras
      			</H2>
      			<% 	ran=new Random();
					int pid5[]=ran.ints(3,51,57).toArray();
  					for(int i=0;i<3;i++)
	  				{	Connection con1=null;
		  				Statement st1=null;
		  				ResultSet rs1=null;
		  				Product prod1;
		  				try
	  					{	Class.forName(TableData.DB_DRIVER);
		  					con1=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
		  					st1=con1.createStatement();
		  					rs1=st1.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+pid5[i]);
		  					while(rs1.next())
		  					{	prod1=new Product();
		  						prod1.setId(Integer.parseInt(rs1.getString(1)));
		  						prod1.setName(rs1.getString(2));
		  						prod1.setPrice(Integer.parseInt(rs1.getString(3)));
		  						prod1.setImagepath(rs1.getString(5));
		  						out.println
		  						(	"<div class='prod_box'>"+
		  								"<div class='top_prod_box'>"+
		  								"</div>"+
		  								"<div class='center_prod_box'>"+
		  		  							"<div class='product_title'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											prod1.getName()+
		  										"</a>"+
		  									"</div>"+
		  			  						"<div class='product_img'>"+
		  										"<a href='details.jsp?pid="+prod1.getId()+"'>"+
		  											"<img src='"+prod1.getImagepath()+"' alt='' border='0' max-width='100px' height='90px'/>"+
		  										"</a>"+
		  									"</div>"+
		  				     				"<div class='prod_price'>"+
		  										"<span class='reduce'>Rs."+
		  										(prod1.getPrice()-prod1.getPrice()*0.2)+
		  										"&nbsp;</span>"+
		  										"<span class='price'> Rs."+
		  												prod1.getPrice()+
		  										"</span>"+
		  									"</div>"+
		  								"</div>"+
		  								"<div class='bottom_prod_box'>"+
		  								"</div>"+
		  								"<div class='prod_details_tab'>"+ 
		  									"<a onclick='#' href='details.jsp?pid="+prod1.getId()+"' class='prod_details'>"+
		  										"details"+
		  									"</a>"+
		  								"</div>"+
		  			  				"</div>"
		  						);
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
		  						st1.close();
		  						con1.close();
		  					}
		  					catch(SQLException e)
		  					{	e.printStackTrace();
		  					}
		  					catch(NullPointerException e)
		  					{	e.printStackTrace();
		  					}
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

<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.project.model.TableData"%>
<%@page import="com.project.model.Product"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<div class="left_content">
    <div class="title_box">
    	Categories
    </div>
    <ul class="left_menu">
    	<%  Connection conl=null;
    	    Statement stl=null;
    	    ResultSet rsl=null;
    	    try
    	    {	Class.forName(TableData.DB_DRIVER);
    	    	conl=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
    	    	stl=conl.createStatement();
    	    	rsl=stl.executeQuery("select distinct(category) as categories from product;");
    	    	int i=0;
    	    	while(rsl.next())
    	    	{	String cat=rsl.getString(1);
    	    		i++;
    	    %>
			    	<li class="<%out.print((i%2==0?"even":"odd"));%>">
			    		<a href="products.jsp?q=<%out.print(cat); %>&o=id">
			    			<%	out.print(Character.toUpperCase(cat.charAt(0))+cat.substring(1,cat.length()));
			    			%>
						</a>
			    	</li>
    	    <%
    	    	}
    	    }
    	    catch(Exception e)
    	    {	e.printStackTrace();
    	    }
    	    finally
    	    {	try
	    	    {	rsl.close();
	    	    	stl.close();
	    	    	conl.close();
	    	    }
    	    	catch(Exception e)
	    	    {	e.printStackTrace();
	    	    }
    	    }
    	 %>
    </ul>
    <div class="title_box">
    	Special Products
    </div>
    <% 	conl=null;
		stl=null;
		rsl=null;
		Product prod;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			conl=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			stl=conl.createStatement();
			rsl=stl.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE CLICKS=(SELECT MAX(CLICKS) as max_click FROM "+TableData.TABLE_PROD+") AND PROD_ID=(SELECT MIN(PROD_ID) FROM(SELECT * FROM "+TableData.TABLE_PROD+" WHERE CLICKS=(SELECT MAX(CLICKS)FROM "+TableData.TABLE_PROD+" as max_clicks)) as min_prod)");
			while(rsl.next())
			{	prod=new Product();
				prod.setId(Integer.parseInt(rsl.getString(1)));
				prod.setName(rsl.getString(2));
				prod.setPrice(Integer.parseInt(rsl.getString(3)));
				prod.setImagepath(rsl.getString(5));
    %>
			    <div class="border_box">
			        <div class="product_title">
			        	<a href="details.jsp?pid=<%out.print(prod.getId());%>">
			        		<%out.print(prod.getName());%>
			       		</a>
			        </div>
			        <div class="product_img">
			        	<a href="details.jsp?pid=<%out.print(prod.getId());%>">
			        		<img src="<%out.print(prod.getImagepath());%>" alt="" border="0" height="50px" style="max-width:100px;"/>
			        	</a>
			        </div>
			        <div class="prod_price">
			 			<span class="reduce">
			        		Rs.&nbsp;<%out.print((prod.getPrice()+prod.getPrice()*0.2)); %>
			        	</span> 
			        	&nbsp;
			        	<span class="price">
			        		Rs.&nbsp;<%out.print(prod.getPrice()); %>
			        	</span>
			        </div>
			    </div>
	<% 		}
		}
		catch(ClassNotFoundException e) 
		{
		} 
		catch(SQLException e) 
		{
		} 
		finally
		{	try
			{	rsl.close();
				stl.close();
				conl.close();
			}
			catch(SQLException e)
			{	
			}
			catch(NullPointerException e)
			{
				
			}
		}
    %>
    <div class="banner_adds"> 
    	<a href="#">
    		<img src="images/bann2.jpg" alt="" border="0" />
    	</a> 
    </div>
</div>    		
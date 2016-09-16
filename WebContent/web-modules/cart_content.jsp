<%@page import="com.project.model.TableData"%>
<%	String usr=(String)session.getAttribute("username"); 
%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<div class="cart_title">
	Shopping cart
</div>
<%	if(usr!=null)
	{	Connection concart=null;
		Statement stcart=null;
		ResultSet rscart1=null,rscart2=null;
		int items=0,total=0,temp;
		try
		{	Class.forName(TableData.DB_DRIVER);	 					
			concart=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			stcart=concart.createStatement();
			rscart1=stcart.executeQuery("SELECT QUANT FROM "+TableData.TABLE_CART+" WHERE USERNAME='"+usr+"'");
			while(rscart1.next())
			{	temp=Integer.parseInt(rscart1.getString(1));
				items+=temp;
			}
			rscart2=stcart.executeQuery("select A.quant, B.price from "+TableData.TABLE_CART+" A,"+TableData.TABLE_PROD+" B where A.username='"+usr+"' AND A.prod_id=B.Prod_id");
			while(rscart2.next())
			{	int quant=Integer.parseInt(rscart2.getString(1));
				int price=Integer.parseInt(rscart2.getString(2));
				total+=(quant*price);
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
			{	rscart2.close();
				rscart1.close();
				stcart.close();
				concart.close();
			}
			catch(SQLException e)
			{	e.printStackTrace();	
			}
			catch(NullPointerException e)
			{	e.printStackTrace();
				out.print("Cart is Empty");	
			}
		} 
%>
		<div class="cart_details"> 
			<% out.print(items); %> items 
		    <br />
			<span class="border_cart">
			</span> 
			Total: 
			<span class="price">
			   	Rs.&nbsp;<% out.print(total); %>
			</span> 
		</div>
<% 	}
	else
	{	out.print("Sign in to see cart");
	}
%>
<div class="cart_icon">
	<a href="cart.jsp" title="header=[Checkout] body=[&nbsp;] fade=[on]">
		<img src="images/shoppingcart.png" alt="" width="48" height="48" border="0" />
	</a>
</div>
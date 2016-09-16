package com.servlet.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.TableData;

/**
 * Servlet implementation class ProductList
 */
@WebServlet({"/ProductList","/devices.html"})
public class ProductList extends HttpServlet 
{	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public ProductList() 
    {    super();
    }
    
    void outData(HttpServletResponse response,String category) throws IOException
    {	PrintWriter out=response.getWriter();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			rs=st.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE CATEGORY='"+category+"'");
			String name,image;
			int price,pid;
			out.print
			(	"<div class='center_title_bar'>"+
					"Latest Products"+
				"</div>"
			);
			while(rs.next())
			{	pid=Integer.parseInt(rs.getString(1));
				name=rs.getString(2);
				price=Integer.parseInt(rs.getString(3));
				image=rs.getString(5);
				out.println
				(	"<div class='prod_box'>"+
						"<div class='top_prod_box'>"+
						"</div>"+
						"<div class='center_prod_box'>"+
  							"<div class='product_title'>"+
								"<a href='details.jsp?pid="+pid+"'>"+
									name+
								"</a>"+
							"</div>"+
	  						"<div class='product_img'>"+
								"<a href='details.jsp?pid="+pid+"'>"+
									"<img src='"+image+"' alt='' border='0' max-width='100px' height='90px'/>"+
								"</a>"+
							"</div>"+
		     				"<div class='prod_price'>"+
								"<span class='reduce'>Rs."+
								(price-price*0.2)+
								"&nbsp;</span>"+
								"<span class='price'> Rs."+
									price+
								"</span>"+
							"</div>"+
						"</div>"+
						"<div class='bottom_prod_box'>"+
						"</div>"+
						"<div class='prod_details_tab'>"+ 
							"<a href='#' title='header=[Add to cart] body=[&nbsp;] fade=[on]'>"+
								"<img src='images/cart.gif' alt='' border='0' class='left_bt' />"+
							"</a>"+ 
							"<a href='#' title='header=[Specials] body=[&nbsp;] fade=[on]'>"+
								"<img src='images/favs.gif' alt='' border='0' class='left_bt' />"+
							"</a>"+
							"<a href='#' title='header=[Gifts] body=[&nbsp;] fade=[on]'>"+
								"<img src='images/favorites.gif' alt='' border='0' class='left_bt' />"+
							"</a>"+
							"<a href='details.jsp?pid="+pid+"' class='prod_details'>"+
								"details"+
							"</a>"+
						"</div>"+
	  				"</div>"
				);
			}
		}
		catch(ClassNotFoundException e) 
		{
		} 
		catch(SQLException e) 
		{
		} 
		finally
		{	try
			{	rs.close();
				st.close();
				con.close();
			}
			catch(SQLException e)
			{	
			}
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	String query=request.getParameter("q");
		PrintWriter out=response.getWriter();
		out.println("<link rel='stylesheet' type='text/css' href='style.css' />");
		if(query.equals("all"))
		{	outData(response,query);
		}
		else
		{	outData(response,"%");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
	}
}

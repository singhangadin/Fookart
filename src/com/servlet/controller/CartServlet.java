package com.servlet.controller;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import com.project.model.Cart;
import com.project.model.Product;
import com.project.model.TableData;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet 
{	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() 
    {	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	HttpSession session=request.getSession();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		boolean cleanup=false;
		Cart cart=new Cart();
		Product prod=new Product();
		prod.setId(Integer.parseInt(request.getParameter("pid")));
		cart.setPid(prod.getId());
		cart.setUser((String)session.getAttribute("username"));
		cart.setQuant(Integer.parseInt(request.getParameter("quantity")));
		try
		{	Class.forName(TableData.DB_DRIVER);	 					
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			try
			{	rs=st.executeQuery("SELECT QUANT from "+TableData.TABLE_CART+" WHERE PROD_ID="+prod.getId());
				while(rs.next())
				{	if(Integer.parseInt(rs.getString(1))==cart.getQuant())
					{	cleanup=true;
					}
				}
			}
			catch(NullPointerException e)
			{	e.printStackTrace();
			}
			if(cleanup)
			{	int i=st.executeUpdate("Delete from "+TableData.TABLE_CART+" where prod_id="+prod.getId()+" AND USERNAME='"+cart.getUser()+"'");
				if(i>0)
				{	response.sendRedirect("cart.jsp");
				}
				else
				{	response.sendRedirect("index.jsp");
				}
			}
			else
			{	int i=st.executeUpdate("Update "+TableData.TABLE_CART+" set quant=quant-"+cart.getQuant()+" where prod_id="+prod.getId()+" AND USERNAME='"+cart.getUser()+"'");
				if(i>0)
				{	response.sendRedirect("cart.jsp");
				}
				else
				{	response.sendRedirect("index.jsp");
				}
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
			{	rs.close();
				st.close();
				con.close();
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	HttpSession session=request.getSession();
		int currquant=0;
		Connection con2=null;
		Statement st2=null,st3=null;
		ResultSet rs2=null;
		boolean found=false;
		Cart cart=new Cart();
		Product prod=new Product();
		prod.setId(Integer.parseInt(request.getParameter("pid")));
		cart.setPid(prod.getId());
		cart.setUser((String)session.getAttribute("username"));
		cart.setQuant(Integer.parseInt(request.getParameter("quantity")));
		try
		{	Class.forName(TableData.DB_DRIVER);	 					
			con2=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st2=con2.createStatement();
			st3=con2.createStatement();
			try
			{	rs2=st2.executeQuery("select * from "+TableData.TABLE_CART+" where USERNAME='"+cart.getUser()+"' AND prod_id='"+prod.getId()+"'");
				while(rs2.next())
				{	found=true;
					currquant=Integer.parseInt(rs2.getString(3));
				}
			}
			catch(NullPointerException e)
			{	e.printStackTrace();
				
			}
			if(!found)
			{	int quantity=0;
				ResultSet rs1=st3.executeQuery("SELECT QUANT from "+TableData.TABLE_PROD+" WHERE PROD_ID="+prod.getId());
				while(rs1.next())
				{	quantity=Integer.parseInt(rs1.getString(1));
				}
				if(quantity<cart.getQuant())
				{	response.sendRedirect("details.jsp?pid="+prod.getId());
				}
				else
				{	int i=st2.executeUpdate("INSERT INTO "+TableData.TABLE_CART+" VALUES('"+cart.getUser()+"','"+cart.getPid()+"','"+cart.getQuant()+"')");
					if(i>0)
					{	response.sendRedirect("details.jsp?pid="+prod.getId());
					}
					else
					{	response.sendRedirect("index.jsp");
					}
				}
			}
			else
			{	int quant=0;
				Statement st1=con2.createStatement();
				ResultSet rs1=st1.executeQuery("select QUANT from "+TableData.TABLE_PROD+" where PROD_ID='"+prod.getId()+"'");
				while(rs1.next())
				{	quant=Integer.parseInt(rs1.getString(1));
				}
				if(quant>=currquant+cart.getQuant())
				{	st2.executeUpdate("Update "+TableData.TABLE_CART+" set quant=quant+"+cart.getQuant()+" where prod_id="+prod.getId()+" AND USERNAME='"+cart.getUser()+"'");
				}
				response.sendRedirect("details.jsp?pid="+prod.getId());
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
			{	rs2.close();
				st2.close();
				st3.close();
				con2.close();
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
		}
	}

}

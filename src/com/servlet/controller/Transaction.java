package com.servlet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.Cart;
import com.project.model.TableData;
import com.project.model.Transactn;
import com.project.model.Users;

/**
 * Servlet implementation class Transaction
 */
@WebServlet("/Transaction")
public class Transaction extends HttpServlet 
{	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transaction() 
    {    super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	String action=request.getParameter("button");
		Date today=new Date();
		SimpleDateFormat DF=new SimpleDateFormat("yyyy-MM-dd");
		String todayStr=DF.format(today);
		if(action.equals("Checkout"))
		{	HttpSession session=request.getSession();
			Users user=new Users();
			user.setUser((String)session.getAttribute("username"));
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Transactn trans;
			boolean found=false;
			String add="";
			try
			{	Class.forName(TableData.DB_DRIVER);	 					
				con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
				st=con.createStatement();
				rs=st.executeQuery("SELECT ADDR from "+TableData.TABLE_INFO+" WHERE USERNAME='"+user.getUser()+"'");
				while(rs.next())
				{	add=rs.getString(1);
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
			try
			{	Class.forName(TableData.DB_DRIVER);	 					
				con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
				st=con.createStatement();
				rs=st.executeQuery("SELECT prod_id,quant from "+TableData.TABLE_CART+" WHERE USERNAME='"+user.getUser()+"'");
				ResultSet rs1=null;
				Cart cart;
				int i=0;
				while(rs.next())
				{	cart=new Cart();
					cart.setPid(Integer.parseInt(rs.getString(1)));
					cart.setQuant(Integer.parseInt(rs.getString(2)));
					trans=new Transactn();
					trans.setTid(user.getUser());
					trans.setAdd(add);
					trans.setQuant(cart.getQuant());
					trans.setStatus(1);
					trans.setPid(cart.getPid());
					trans.setDate(todayStr);
					try
					{	st=con.createStatement();
						try
						{	int quant=0;
							st=con.createStatement();
							rs1=st.executeQuery("SELECT QUANT from "+TableData.TABLE_TRANS+" where trans_id='"+trans.getTid()+"' AND prod_id='"+trans.getPid()+"' AND orderdate='"+todayStr+"' AND status=1");
							Statement st1=con.createStatement();
							ResultSet rs2=st1.executeQuery("select QUANT from "+TableData.TABLE_PROD+" where PROD_ID='"+cart.getPid()+"'");
							while(rs2.next())
							{	quant=Integer.parseInt(rs2.getString(1));
							}
							while(rs1.next())
							{	found=true;
							}
							if(quant>=cart.getQuant())
							{	if(found)
								{	i=st.executeUpdate("UPDATE "+TableData.TABLE_TRANS+" SET QUANT=QUANT+"+trans.getQuant()+" WHERE orderdate='"+todayStr+"' AND status=1");
									i=st.executeUpdate("UPDATE "+TableData.TABLE_PROD+" SET QUANT=QUANT-"+trans.getQuant());
								}
								else
								{	i=st.executeUpdate("INSERT INTO "+TableData.TABLE_TRANS+" values('"+trans.getTid()+"','"+trans.getPid()+"','"+trans.getQuant()+"','"+trans.getStatus()+"','"+trans.getAdd()+"','"+trans.getDate()+"')");							
									i=st.executeUpdate("UPDATE "+TableData.TABLE_PROD+" SET QUANT=QUANT-"+trans.getQuant()+" WHERE PROD_ID="+trans.getPid());
								}
							}
						}
						catch(Exception e)
						{	e.printStackTrace();
						}
					}
					catch(Exception e)
					{	e.printStackTrace();
					}
					finally
					{	if(i>0)
						{	try
							{	st=con.createStatement();
								st.executeUpdate("DELETE FROM "+TableData.TABLE_CART+" WHERE PROD_ID='"+cart.getPid()+"' AND USERNAME='"+user.getUser()+"'");
							}
							catch(Exception e)
							{	e.printStackTrace();
							}
						}
						rs1.close();
					}
				}
				response.sendRedirect("shipping.jsp");
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
		else if(action.equals("Discard"))
		{	HttpSession session=request.getSession();
			Users user=new Users();
			user.setUser((String)session.getAttribute("username"));
			Connection con=null;
			Statement st=null;
			try
			{	Class.forName(TableData.DB_DRIVER);	 					
				con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
				st=con.createStatement();
				int i=st.executeUpdate("DELETE FROM "+TableData.TABLE_CART+" WHERE USERNAME='"+user.getUser()+"'");
				{	if(i>0)
					{	response.sendRedirect("index.jsp");
					}
					else
					{	response.sendRedirect("cart.jsp");
					}
				}
			}
			catch(Exception e) 
			{	e.printStackTrace();
			}
			finally
			{	try
				{	st.close();
					con.close();
				}
				catch(Exception e)
				{	e.printStackTrace();
				}
			}
		}
	}
}

package com.servlet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.TableData;

/**
 * Servlet implementation class Orders
 */
@WebServlet("/OrdersEdit")
public class OrdersEdit extends HttpServlet 
{	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersEdit() 
    {   super();
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
	{	Enumeration<String> E=request.getParameterNames();
		ArrayList<Integer> I=new ArrayList<Integer>();
		while(E.hasMoreElements())
		{	String key=E.nextElement();
			{	if(key.charAt(0)=='c'&&key.charAt(1)=='h')
				{	I.add(Integer.parseInt(String.valueOf(key.charAt(2))));	
				}
			}
		}
		Connection con=null;
		Statement st=null;
		try
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			for(int i=0;i<I.size();i++)
			{	String opt=request.getParameter("op"+I.get(i));
				String date=request.getParameter("date"+I.get(i));
				String pid=request.getParameter("pid"+I.get(i));
				String tid=request.getParameter("tid"+I.get(i));
				st.executeUpdate("update "+TableData.TABLE_TRANS+" set status="+opt+" where orderdate='"+date+"' and prod_id="+pid+" and trans_id='"+tid+"'");
			}
			st.close();
			con.close();
		}
		catch(Exception e)
		{	e.printStackTrace();
		}
		response.sendRedirect("orders.jsp");
	}

}

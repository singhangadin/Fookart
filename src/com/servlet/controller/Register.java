package com.servlet.controller;

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
import javax.servlet.http.HttpSession;

import com.project.model.Info;
import com.project.model.TableData;
import com.project.model.Users;

/**
 * Servlet implementation class LoginVal
 */
@WebServlet({ "/LoginVal", "/validate.jsp" })
public class Register extends HttpServlet 
{	private static final long serialVersionUID = 1L; 
	private Users usr;
	private Info inf;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() 
    {    super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		Connection lcon=null;
		Statement lst=null;
		ResultSet lrs=null;
		boolean found=false;
		usr=new Users();
		usr.setUser(request.getParameter("rname"));
		usr.setPass(request.getParameter("rpass"));
		String user=null;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			lcon=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			lst=lcon.createStatement();
			lrs=lst.executeQuery("SELECT * FROM "+TableData.TABLE_USR);
			while(lrs.next())
			{	if(lrs.getString(1).equals(usr.getUser()))
				{	if(lrs.getString(2).equals(usr.getPass()))
					{	found=true;
						user=usr.getUser();
						break;
					}
				}
			}
			if(found)
			{	out.println("Login Successful, Loading...");
				session.setAttribute("username",(String)user);
				if(usr.getUser().equals("admin"))
				{	response.sendRedirect("manage.jsp");
				}
				session.setAttribute("linstate","loggedin");
			}
			else
			{	out.println("Login Failed");
				if(usr.getUser().equals("admin"))
				{	response.sendRedirect("admin.jsp");
				}
				session.setAttribute("linstate","unsigned");
			}	
			try
			{	Thread.sleep(1);
			}
			catch(InterruptedException e)
			{	e.printStackTrace();
			}
			if(!usr.getUser().equals("admin"))
			{	response.sendRedirect("index.jsp");
			}
		} 
		catch(ClassNotFoundException e) 
		{	out.println("Class not Found");
		} 
		catch(SQLException e) 
		{	out.println("SQL Exception");
		} 
		finally
		{	try
			{	lrs.close();
				lst.close();
				lcon.close();
			}
			catch(SQLException e)
			{	out.println("SQL Exception");
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		inf=new Info();
		usr=new Users();
		inf.setName(request.getParameter("name"));
		inf.setUser(request.getParameter("uname"));
		usr.setUser(inf.getUser());
		inf.setEmail(request.getParameter("email_id"));
		usr.setPass(request.getParameter("pass"));
		inf.setAdd(request.getParameter("add"));
		inf.setPhno((request.getParameter("ph_no")));
		Connection lcon=null;
		Statement lst=null;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			lcon=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			out.println(usr.getUser());
			lst=lcon.createStatement();
			lst.executeUpdate("INSERT INTO "+TableData.TABLE_USR+" values('"+usr.getUser()+"','"+usr.getPass()+"')");
			lst.executeUpdate("INSERT INTO "+TableData.TABLE_INFO+" values('"+inf.getUser()+"','"+inf.getName()+"','"+inf.getAdd()+"',"+inf.getPhno()+",'"+inf.getEmail()+"')");
			session.setAttribute("linstate","loggedin");
			session.setAttribute("username",inf.getUser());
			response.sendRedirect("index.jsp");
		} 
		catch(Exception e) 
		{	session.setAttribute("linstate","unregistered");
			e.printStackTrace();
		} 
		finally
		{	try
			{	lst.close();
				lcon.close();
			}
			catch(Exception e)
			{	out.println("SQL Exception");
			}
		}
	}

}

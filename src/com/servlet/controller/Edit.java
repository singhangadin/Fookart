package com.servlet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.Info;
import com.project.model.TableData;

/**
 * Servlet implementation class Edit
 */
@WebServlet("/Edit")
public class Edit extends HttpServlet 
{	private static final long serialVersionUID = 1L;
	private Info inf;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() 
    {    super();
        // TODO Auto-generated constructor stub
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
	{	HttpSession session=request.getSession();
		String user=(String)session.getAttribute("username");
		inf=new Info();
		inf.setName(request.getParameter("name"));
		inf.setEmail(request.getParameter("email_id"));
		inf.setAdd(request.getParameter("add"));
		inf.setPhno((request.getParameter("ph_no")));
		Connection lcon=null;
		Statement lst=null;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			lcon=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			lst=lcon.createStatement();
			lst.executeUpdate("UPDATE "+TableData.TABLE_INFO+" SET NAME='"+inf.getName()+"' WHERE USERNAME='"+user+"'");
			lst.executeUpdate("UPDATE "+TableData.TABLE_INFO+" SET ADDR='"+inf.getAdd()+"' WHERE USERNAME='"+user+"'");
			lst.executeUpdate("UPDATE "+TableData.TABLE_INFO+" SET PH_NUMBER='"+inf.getPhno()+"' WHERE USERNAME='"+user+"'");
			lst.executeUpdate("UPDATE "+TableData.TABLE_INFO+" SET EMAIL_ID='"+inf.getEmail()+"' WHERE USERNAME='"+user+"'");
			response.sendRedirect("index.jsp");
		} 
		catch(Exception e)
		{	e.printStackTrace();
		}
	}

}

package com.servlet.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.TableData;

/**
 * Servlet implementation class ContactHandler
 */
@WebServlet({"/ContactHandler","/feedback.html"})
public class ContactHandler extends HttpServlet 
{	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactHandler() 
    {   super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	String name,email,company,message,phone;
		name=request.getParameter("nname");
		phone=request.getParameter("nphone");
		email=request.getParameter("nemail");
		company=request.getParameter("ncomp");
		message=request.getParameter("nmess");
		PrintWriter out=response.getWriter();
		Connection con=null;
		Statement st=null;
		int res;
		try
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			res=st.executeUpdate("INSERT INTO "+TableData.TABLE_FEED+" VALUES('"+name+"','"+company+"','"+email+"','"+phone+"','"+message+"')");
			if(res>0)
			{	out.print("Feedback Send, Redirecting...");
				try
				{	Thread.sleep(5000);
				}
				catch(InterruptedException E)
				{	E.printStackTrace();
				}
				finally
				{	response.sendRedirect("index.jsp");
				}
			}
			else
			{	out.print("Feedback Sending Failed, Redirecting...");
				try
				{	Thread.sleep(5000);
				}
				catch(InterruptedException E)
				{	E.printStackTrace();
				}
				finally
				{	response.sendRedirect("index.jsp");
				}
			}
		}
		catch(ClassNotFoundException C)
		{	C.printStackTrace();
		}
		catch(SQLException S)
		{	S.printStackTrace();
		}
		finally
		{	try
			{	st.close();
				con.close();
			}
			catch(SQLException S)
			{	S.printStackTrace();
			}
			catch(NullPointerException E)
			{	E.printStackTrace();
				out.print("Exception");
			}
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	String name,email,company,message,phone;
		name=request.getParameter("name");
		phone=request.getParameter("phone");
		email=request.getParameter("email");
		company=request.getParameter("comp");
		message=request.getParameter("mess");
		PrintWriter out=response.getWriter();
		Connection con=null;
		Statement st=null;
		int res;
		try
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			res=st.executeUpdate("INSERT INTO "+TableData.TABLE_FEED+" VALUES('"+name+"','"+company+"','"+email+"','"+phone+"','"+message+"')");
			if(res>0)
			{	out.print("Success");
			}
			else
			{	out.print("Failed");
			}
		}
		catch(ClassNotFoundException C)
		{	C.printStackTrace();
		}
		catch(SQLException S)
		{	S.printStackTrace();
		}
		finally
		{	try
			{	st.close();
				con.close();
			}
			catch(SQLException S)
			{	S.printStackTrace();
			}
			catch(NullPointerException E)
			{	E.printStackTrace();
			}
		}
	}
}

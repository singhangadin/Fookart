package com.servlet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.TableData;
import com.project.utils.Search;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet({ "/AddProduct", "/productreg.jsp" })
public class AddProduct extends HttpServlet 
{	private static final long serialVersionUID = 1L;
    
	/**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() 
    {   super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	String pid=request.getParameter("ipid");
		Enumeration<String> E=request.getParameterNames();
		try
		{	Class.forName(TableData.DB_DRIVER);
			Connection con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			while(E.hasMoreElements())
			{	Statement st=con.createStatement();
				Statement st1=con.createStatement();
				String name=E.nextElement();
				switch (name) 
				{	case "idesc":	st.executeUpdate("update "+TableData.TABLE_PROD+" set descript='"+request.getParameter("idesc")+"' where prod_id="+pid);	
									break;
					
					case "iprice":	st.executeUpdate("update "+TableData.TABLE_PROD+" set price="+request.getParameter("iprice")+" where prod_id="+pid);
									break;
					
					case "iquant":	st.executeUpdate("update "+TableData.TABLE_PROD+" set quant='"+request.getParameter("iquant")+"' where prod_id="+pid);
									break;
									
					case "iimg":	ResultSet rs=st.executeQuery("select category from "+TableData.TABLE_PROD+" where prod_id="+pid);
									while(rs.next())
									{	String cat=rs.getString(1);
										st1.executeUpdate("update "+TableData.TABLE_PROD+" set img_path='images/products/"+cat+"s/"+request.getParameter("iimg")+"' where prod_id="+pid);
									}
									break;
		
					default:
							break;
					
				}
				try
				{	st.close();
					st1.close();
				}
				catch(Exception e)
				{	e.printStackTrace();
				}
			}
			con.close();
		}
		catch(Exception e)
		{	e.printStackTrace();
		}
		finally
		{	response.sendRedirect("manage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	String pid=request.getParameter("pid");
		String pname=request.getParameter("pname");
		String price=request.getParameter("price");
		String desc=request.getParameter("desc");
		String img=request.getParameter("img");
		String quant=request.getParameter("quant");
		String cat=request.getParameter("cat");
		Connection con=null;
		Statement st=null;
		try
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			st.executeUpdate("insert into product values("+pid+",'"+pname+"',"+price+",'"+desc+"','images/products/"+cat+"s/"+img+"',0,"+quant+",'"+cat+"')");
			Search S=new Search();
			S.cleanCartDB();
			S.createCartDB();
			st.close();
			con.close();
		}
		catch(Exception e)
		{	e.printStackTrace();
		}
		finally
		{	response.sendRedirect("manage.jsp");
		}
	}
}

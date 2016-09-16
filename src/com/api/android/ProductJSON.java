package com.api.android;

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

import org.json.JSONArray;
import org.json.JSONObject;

import com.project.model.TableData;

/**
 * Servlet implementation class ProductJSON
 */
@WebServlet("/ProductJSON")
public class ProductJSON extends HttpServlet 
{	private static final long serialVersionUID=1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductJSON() 
    {   super();
    }

    void outJSON(HttpServletResponse response,String a,String b) throws IOException
    {	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		JSONArray JA=new JSONArray();
		try 
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			rs=st.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID BETWEEN "+a+" AND "+b);
			while(rs.next())
			{	JSONObject JO=new JSONObject();
				JO.put("pid",rs.getString(1));
				JO.put("name",rs.getString(2));
				JO.put("price",rs.getString(3));
				JO.put("imgpath",rs.getString(5));
				JA.put(JO);
			}
			out.println(JA.toString());
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
    
	void outJSON(HttpServletResponse response,String a) throws IOException
    {	response.setContentType("text/html");
	    PrintWriter out=response.getWriter();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		JSONArray JA=new JSONArray();
		try 
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			rs=st.executeQuery("SELECT * FROM "+TableData.TABLE_PROD+" WHERE PROD_ID="+a);
			while(rs.next())
			{	JSONObject JO=new JSONObject();
				JO.put("name",rs.getString(2));
				JO.put("price",rs.getString(3));
				JO.put("desc",rs.getString(4));
				JO.put("imgpath",rs.getString(5));
				JO.put("clicks",rs.getString(6));
				JO.put("quant",rs.getString(7));
				JA.put(JO);
			}
			out.println(JA.toString());
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
	{	// TODO Auto-generated method stub
		response.setContentType("text/html");
		String query=request.getParameter("q");
		switch(query)
		{	case "laptop":outJSON(response,"1","9");
						  break;
		
			case "mobile":outJSON(response,"11","19");
						  break;
		
			case "watch":outJSON(response,"21","29");
						 break;
			
			case "television":outJSON(response,"31","39");
						  	  break;

			case "headphone":outJSON(response,"41","49");
					  	  	 break;
			
			case "camera":outJSON(response,"51","59");
						  break;

			case "all":outJSON(response,"1","59");
			  		   break;
			  		   
			default:if(!query.isEmpty())
					{	outJSON(response,query);
					}
					break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	// TODO Auto-generated method stub
	}
}

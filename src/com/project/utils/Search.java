package com.project.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.project.model.TableData;

public class Search 
{	
	public void createCartDB() 
	{	ArrayList<Integer> ARR;
		String value;
		Connection con=null;
		Statement st=null,st2=null;
		ResultSet rs=null;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			init(con);
			rs=st.executeQuery("SELECT prod_id,prod_name FROM "+TableData.TABLE_PROD);
			String name;
			int pid;
			while(rs.next())
			{	ARR=new ArrayList<Integer>();
				st2=con.createStatement();
				pid=Integer.parseInt(rs.getString(1));
				name=rs.getString(2);
				st2.executeUpdate("INSERT INTO "+TableData.TABLE_SRCH+" values('"+name.toLowerCase()+"',"+pid+")");
				for(int i=0;i<name.length();i++)
				{	String ch=String.valueOf(name.charAt(i));
					if(ch.equals(" "))
					{	ARR.add(i);
					}
				}
				int k=0;
				for(int i=0;i<ARR.size();i++)
				{	value=name.substring(k,ARR.get(i));
					st2.executeUpdate("INSERT INTO "+TableData.TABLE_SRCH+" values('"+value.toLowerCase()+"',"+pid+")");
					k=ARR.get(i)+1;
				}
				value=name.substring(k,name.length());
				st2.executeUpdate("INSERT INTO "+TableData.TABLE_SRCH+" values('"+value.toLowerCase()+"',"+pid+")");
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
				st2.close();
			}
			catch(SQLException e)
			{	e.printStackTrace();
			}
		}
	}
	
	public void init(Connection con)
	{	try
		{	Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select distinct(category) from product");
			while(rs.next())
			{	Statement st1=con.createStatement();
				ResultSet rs1=st1.executeQuery("select prod_id from product where category='"+rs.getString(1)+"'");
				while(rs1.next())
				{	Statement st2=con.createStatement();
					Statement st3=con.createStatement();
					st2.executeUpdate("INSERT INTO "+TableData.TABLE_SRCH+" values('"+rs.getString(1)+"',"+rs1.getString(1)+")");
					st3.executeUpdate("INSERT INTO "+TableData.TABLE_SRCH+" values('"+rs.getString(1)+"s',"+rs1.getString(1)+")");
					try
					{	st2.close();
						st3.close();
					}
					catch(Exception e)
					{	e.printStackTrace();
					}
				}
				try
				{	st1.close();
				}
				catch(Exception e)
				{	e.printStackTrace();
				}
			}
			st.close();
		}
		catch(Exception e)
		{	
			e.printStackTrace();
		}
	}
	
	public void cleanCartDB()
	{	Connection con=null;
		Statement st=null;
		try 
		{	Class.forName(TableData.DB_DRIVER);
			con=DriverManager.getConnection(TableData.CONNECTION_URL,TableData.USER_NAME,TableData.PASSWORD);
			st=con.createStatement();
			st.executeUpdate("delete from search");
		}
		catch(Exception e)
		{	e.printStackTrace();
		}
	}
	
	public static void main(String args[])
	{	Search S=new Search();
		S.cleanCartDB();
	}
}

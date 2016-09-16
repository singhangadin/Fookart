package com.project.utils;

import java.io.File;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.project.model.TableData;

public class ProductLoader 
{  	public static void main(String argv[]) 
	{	try 
		{	File fXmlFile = new File("raw/product.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);			
			doc.getDocumentElement().normalize();
			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
			NodeList nList = doc.getElementsByTagName("ROW");
			System.out.println("----------------------------");
			Class.forName(TableData.DB_DRIVER);
			try
			{	Connection con=DriverManager.getConnection(TableData.CONNECTION_URL, TableData.USER_NAME,TableData.PASSWORD);
				Statement st=con.createStatement();
				for (int temp = 0; temp < nList.getLength(); temp++) 
				{	Node nNode = nList.item(temp);			
					System.out.println("\nCurrent Element :" + nNode.getNodeName());
					if (nNode.getNodeType() == Node.ELEMENT_NODE) 
					{	Element eElement = (Element) nNode;
						String pid=eElement.getElementsByTagName("PROD_ID").item(0).getTextContent();
						String pname=eElement.getElementsByTagName("PROD_NAME").item(0).getTextContent();
						String price=eElement.getElementsByTagName("PRICE").item(0).getTextContent();
						String desc=eElement.getElementsByTagName("DESCRIPT").item(0).getTextContent();
						String img=eElement.getElementsByTagName("IMG_PATH").item(0).getTextContent();
						String click=eElement.getElementsByTagName("CLICKS").item(0).getTextContent();
						String quant=eElement.getElementsByTagName("QUANT").item(0).getTextContent();
						String category=eElement.getElementsByTagName("CATEGORY").item(0).getTextContent();
						st.executeUpdate("INSERT INTO "+TableData.TABLE_PROD+" values('"+pid+"','"+pname+"','"+price+"','"+desc+"','"+img+"','"+click+"','"+quant+"','"+category+"')");
					}
				}
			}
			catch(Exception e)
			{	e.printStackTrace();
			}
		} 
		catch (Exception e) 
		{	e.printStackTrace();
		}
	}
}
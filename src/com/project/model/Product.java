package com.project.model;

public class Product 
{	String name,desc,imagepath;
	int id,price,clicks,quant;
	
	public Product() 
	{	
	}
	
	public String getName() 
	{	return name;
	}

	public void setName(String name) 
	{	this.name = name;
	}

	public int getId() 
	{	return id;
	}

	public void setId(int id) 
	{	this.id = id;
	}

	public String getDesc() 
	{	return desc;
	}

	public void setDesc(String desc) 
	{	this.desc = desc;
	}

	public String getImagepath() 
	{	return imagepath;
	}

	public void setImagepath(String imagepath) 
	{	this.imagepath = imagepath;
	}

	public int getPrice() 
	{	return price;
	}

	public void setPrice(int price) 
	{	this.price = price;
	}

	public int getClicks() 
	{	return clicks;
	}

	public void setClicks(int clicks) 
	{	this.clicks = clicks;
	}

	public int getQuant() 
	{	return quant;
	}

	public void setQuant(int quant) 
	{	this.quant = quant;
	}
}

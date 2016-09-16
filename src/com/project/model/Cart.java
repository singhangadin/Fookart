package com.project.model;

public class Cart 
{	private String user;
	private int quant,pid;
	public Cart() 
	{
	}
	
	public String getUser() 
	{	return user;
	}
	
	public void setUser(String user) 
	{	this.user=user;
	}
	
	public int getQuant() 
	{	return quant;
	}
	
	public void setQuant(int quant) 
	{	this.quant=quant;
	}
	
	public int getPid() 
	{	return pid;
	}
	
	public void setPid(int pid) 
	{	this.pid=pid;
		
	}
}

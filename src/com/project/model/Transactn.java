package com.project.model;

public class Transactn 
{	private String tid,add,date;
	private int pid,quant,status;
	public Transactn() 
	{
	}
	
	public String getDate() 
	{	return date;
	}

	public void setDate(String date) 
	{	this.date=date;
	}

	public String getTid() 
	{	return tid;
	}
	
	public void setTid(String tid) 
	{	this.tid = tid;
	}
	
	public int getPid() 
	{	return pid;
	}
	
	public void setPid(int pid) 
	{	this.pid = pid;
	}
	
	public String getAdd() 
	{	return add;
	}
	
	public void setAdd(String add) 
	{	this.add = add;
	}
	
	public int getQuant() 
	{	return quant;
	}
	
	public void setQuant(int quant) 
	{	this.quant = quant;
	}
	
	public int getStatus() 
	{	return status;
	}
	
	public void setStatus(int status) 
	{	this.status = status;
	}
}

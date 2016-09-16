package com.project.utils;

import javax.servlet.http.HttpServletRequest;

public class IpLogger 
{	private String ipaddr;
	
	public IpLogger()
	{
	}
	
	public void putLog(HttpServletRequest request)
	{	ipaddr=request.getHeader("X-Forwarded-For");  
	    if(ipaddr==null||ipaddr.length()==0||"unknown".equalsIgnoreCase(ipaddr)) 
	    {   ipaddr=request.getHeader("Proxy-Client-ipaddr");  
	    }  
	    if(ipaddr==null||ipaddr.length()==0||"unknown".equalsIgnoreCase(ipaddr)) 
	    {   ipaddr=request.getHeader("WL-Proxy-Client-ipaddr");  
	    }  
	    if(ipaddr==null||ipaddr.length()==0||"unknown".equalsIgnoreCase(ipaddr)) 
	    {   ipaddr=request.getHeader("HTTP_CLIENT_IP");  
	    }  
	    if(ipaddr==null||ipaddr.length()==0||"unknown".equalsIgnoreCase(ipaddr)) 
	    {   ipaddr=request.getHeader("HTTP_X_FORWARDED_FOR");  
	    }  
	    if(ipaddr==null||ipaddr.length()==0||"unknown".equalsIgnoreCase(ipaddr)) 
	    {   ipaddr = request.getRemoteAddr();  
	    }
	}
	
	public void putCrack()
	{
	}
}

<%! int id;
	String user="";
%>
<%	user=(String)session.getAttribute("username"); 
	if(user==null)
	{	id=0;
	}
	else if(user.equals("admin"))
	{	id=2;
	}
	else
	{	id=1;
	}
%>
<div id="menu_tab">
	<div class="left_menu_corner">
	</div>
    <ul class="menu">
       	<li>
       		<a href="index.jsp" class="nav1">
       			Home
       		</a>
       	</li>
       	<li class="divider">
       	</li>
       	<li>
       		<a href="products.jsp?q=all&o=id" class="nav2">
       			Products
       		</a>
       	</li>
       	<li class="divider">
       	</li>
       	<li>
       		<a href="myaccount.jsp" class="nav4">
       			My account
       		</a>
       	</li>
       	<li class="divider">
       	</li>
       	<li>
       		<a href="shipping.jsp" class="nav5">
       			Shipping
       		</a>
       	</li>
       	<li class="divider">
       	</li>
       	<li>
       		<a href="contact.jsp" class="nav6">
       			Contact Us
       		</a>
       	</li>
       	<li class="divider">
       	</li>
       	<%	if(id==1)
       		{
       	%>
		       	<li>
		       		<a href="#" class="nav4">
		       			<%	out.print("Welcome "+user); 
		       			%>
		       		</a>
		       	</li>
		       	<li class="divider">
		       	</li>
       	<%	} 
       		else if(id==2)
       		{
       	%>
           		<li class='divider'>
			    </li>
			    <li>
				    <a href='manage.jsp' class='nav4'>
				       	Manage Website
				    </a>
			    </li>
		       	<li class="divider">
		       	</li>   		
       	<%		
       		}
       	%>
       	<li>
       		<a href="<%  if(id==0)
       					 {	out.print("login.jsp");
       					 }
       		             else
       		             {	out.print("signout.jsp");
       		             }
       				 %>" class="nav6">
       			<%  if(id==0)
       				{	out.print("Sign In/Sign Up");
       				}
       				else
       				{	out.print("Sign Out");
       				}
       			%>
       		</a>
       	</li>
    </ul>
  	<div class="right_menu_corner">
  	</div>
</div>
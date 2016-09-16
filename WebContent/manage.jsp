<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	if(session.getAttribute("username")==null||!session.getAttribute("username").equals("admin")) 
	{	response.sendRedirect("admin.jsp");
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			Admin panel
		</title>
		<script type="text/javascript">
			function val()
			{	var pid=document.getElementById("pid").value;
				var pname=document.getElementById("pname").value;
				var price=document.getElementById("price").value;
				var desc=document.getElementById("desc").value;
				var img=document.getElementById("img").value;
				var quant=document.getElementById("quant").value;
				var cat=document.getElementById("cat").value;
				var res=true;
				if(pid=="")
				{	document.getElementById("lpid").style.color="red";
					document.getElementById("lpid").innerHTML="*Product ID:";
					res=false;
				}
				else
				{	document.getElementById("lpid").style.color="black";
					document.getElementById("lpid").innerHTML="Product ID:";
				}
				if(pname=="")
				{	document.getElementById("lpname").style.color="red";
					document.getElementById("lpname").innerHTML="*Product Name:";
					res=false;
				}
				else
				{	document.getElementById("lpname").style.color="black";
					document.getElementById("lpname").innerHTML="Product Name:";
				}
				if(price=="")
				{	document.getElementById("lprice").style.color="red";
					document.getElementById("lprice").innerHTML="*Price:";
					res=false;
				}
				else
				{	document.getElementById("lprice").style.color="black";
					document.getElementById("lprice").innerHTML="Price:";
				}
				if(desc=="")
				{	document.getElementById("ldesc").style.color="red";
					document.getElementById("ldesc").innerHTML="*Description:";
					res=false;
				}
				else
				{	document.getElementById("ldesc").style.color="black";
					document.getElementById("ldesc").innerHTML="Description:";
				}
				if(quant=="")
				{	document.getElementById("lquant").style.color="red";
					document.getElementById("lquant").innerHTML="*Quantity:";
					res=false;
				}
				else
				{	document.getElementById("lquant").style.color="black";
					document.getElementById("lquant").innerHTML="Quantity:";
				}
				if(cat=="")
				{	document.getElementById("lcat").style.color="red";
					document.getElementById("lcat").innerHTML="*Category:";
					res=false;
				}
				else
				{	document.getElementById("lcat").style.color="black";
					document.getElementById("lcat").innerHTML="Category:";
				}
				if(img=="")
				{	document.getElementById("limg").style.color="red";
					document.getElementById("limg").innerHTML="*Image File Name:";
					res=false;
				}
				else
				{	document.getElementById("limg").style.color="black";
					document.getElementById("limg").innerHTML="Image File Name:";
				}
				return res;
			}
			function endis(check,id)
			{	var cbox=document.getElementById(check).checked;
				if(cbox)
				{	document.getElementById(id).disabled=false;
				}
				else
				{	document.getElementById(id).disabled=true;
					document.getElementById(id).value = '';
				}
			}
			function validate()
			{	var pid=document.getElementById("ipid").value;
				var cdesc=document.getElementById("descript").checked;
				var cimg=document.getElementById("imgname").checked;
				var cquant=document.getElementById("quantity").checked;
				var cprice=document.getElementById("price1").checked;
				if(pid=="")
				{	document.getElementById("mess").innerHTML="Product ID should have a value";
					document.getElementById("mess").style.color="red";
					return false;
				}
				else if(cdesc||cimg||cquant||cprice)
				{	var desc=document.getElementById("idesc").value;
					var img=document.getElementById("iimg").value;
					var quant=document.getElementById("iquant").value;
					var price=document.getElementById("iprice").value;
					var ret=true;
					if(cdesc&&desc=="")
					{	document.getElementById("lidesc").style.color="red";
						document.getElementById("lidesc").innerHTML="*Description:";
						ret=false;
					}
					else
					{	document.getElementById("lidesc").style.color="black";
						document.getElementById("lidesc").innerHTML="Description:";
					}
					if(cimg&&img=="")
					{	document.getElementById("liimg").style.color="red";
						document.getElementById("liimg").innerHTML="*Image Name:";
						ret=false;
					}
					else
					{	document.getElementById("liimg").style.color="black";
						document.getElementById("liimg").innerHTML="Image Name:";
					}
					if(cquant&&quant=="")
					{	document.getElementById("liquant").style.color="red";
						document.getElementById("liquant").innerHTML="*Quantity";
						ret=false;
					}
					else
					{	document.getElementById("liquant").style.color="black";
						document.getElementById("liquant").innerHTML="Quantity:";
					}
					if(cprice&&price=="")
					{	document.getElementById("liprice").style.color="red";
						document.getElementById("liprice").innerHTML="*Price:";
						ret=false;	
					}
					else
					{	document.getElementById("liprice").style.color="black";
						document.getElementById("liprice").innerHTML="Price:";
					}
					return ret;
				}
				else
				{	document.getElementById("mess").innerHTML="Please check checkbox to make changes";
					document.getElementById("mess").style.color="red";
					return false;
				}
			}
		</script>
	</head>
	<body>
		<div style="height:5em;
					width:101.8%;
					background-color:#000000;
					margin:-1em;
					float:left;">
					<h1 style="color:#DDDDDD;
							   margin-left:40px;
							   margin-top: 20px;
							   margin-bottom: 20px;
							   font-size: 40px;
							   font-family:sans-serif;
							   float: left;">
						Fookart
					</h1>
					<h4 style="color:#DDDDDD;
							  font-size:20px;
							  margin-left:50em;
							  font-family:sans-serif;
							  float: left;">
							  
						<a href="signout.jsp">
							Sign out
						</a>
					</h4>
		</div>
		<div style="height:33.8em;
					width:20%;
					background-color:#111111;
					margin-left:-1em;
					margin-top:1em;
					float:left;">
					<br/><br/>
					<label style="color: white;
								  margin-left: 40px;
								  margin-top: 40px;
								  font-size: xx-large;">
						<a href="manage.jsp">
							Home Page
						</a>				
					</label>
					<br/><br/>
					<label style="color: white;
								  margin-left: 60px;
								  font-size: xx-large;">
						<a href="orders.jsp">
							Orders
						</a>				
					</label>
		</div>
		<div style="height:33.8em;
					width:81.272%;
					margin-top:1em;
					margin-left:-1px;
					float:left;">
					
			<div style="width:50%;
						height:33.8em;
						background-color:#FFFFFF;
						float:left;">
				<center>
					<form method="post" action="AddProduct">
						<h1>
							Edit Product
						</h1>
						<label id="mess">
							Please check checkbox to make changes
						</label>
						<br/><br/>
						<br/>
						<input type="checkbox" name="descript" id="descript" onchange="endis('descript','idesc')"/>
						&nbsp;Description&nbsp;&nbsp;
						<input type="checkbox" name="quantity" id="quantity" onchange="endis('quantity','iquant')"/>
						&nbsp;Quantity&nbsp;&nbsp;
						<input type="checkbox" name="price1" id="price1" onchange="endis('price1','iprice')"/>
						&nbsp;Price&nbsp;&nbsp;
						<input type="checkbox" name="imgname" id="imgname" onchange="endis('imgname','iimg')"/>
						&nbsp;Image Name&nbsp;&nbsp;
						<br/><br/>
						<table>
							<tr>
								<td>
									<label id="lipid">
										Product ID:&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
									<input type="text" id="ipid" name="ipid"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="lidesc">
										Description:&nbsp;&nbsp;
									</label>
									<input type="text" id="idesc" name="idesc" disabled="disabled"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="liquant">
										Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
									<input type="text" id="iquant" name="iquant" disabled="disabled"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="liprice">
										Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
									<input type="text" id="iprice" name="iprice" disabled="disabled"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="liimg">
										Image Name:&nbsp;
									</label>
									<input type="text" id="iimg" name="iimg" disabled="disabled"/>
								</td>
							</tr>
						</table>
						<input type="submit" value="Submit" onclick="return validate()"/>&nbsp;&nbsp;
						<input type="reset" value="Reset"/>
					</form>
				</center>
			</div>
			<div style="width:50%;
						height:33.8em;
						background-color:#FFFFFF;
						float:left;">
				<center>
					<h1>
						New Product
					</h1>
					<h4>
						Please add details of new product
					</h4>
					<form method="get" action="productreg.jsp" enctype="multipart/form-data">
						<table>
							<tr>
								<td>
									<label id="lpid" style="margin-right: 36px;">
										Product ID:
									</label>
									<input type="text" id="pid" name="pid"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="lpname">
										Product Name:
									</label>&nbsp;
									<input type="text" id="pname" name="pname"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="lprice" style="margin-right: 81px;">
										Price:
									</label>
									<input type="text" id="price" name="price"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="ldesc" style="margin-right: 25px;">
										Description:
									</label>
									<input type="text" id="desc" name="desc"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="limg" style="margin-right: 25px;">
										Image File Name:
									</label>
									<input type="text" id="img" name="img"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="lquant" style="margin-right: 47px;">
										Quantity:
									</label>
									<input type="text" id="quant" name="quant"/>
								</td>
							</tr>
							<tr>
								<td>
									<label id="lcat" style="margin-right: 42px;">
										Category:
									</label><input type="text" id="cat" name="cat"/>
								</td>
							</tr>
							<tr>
								<td>
									<center>
										<input type="submit" value="Submit" onclick="return val()"/>&nbsp;&nbsp;
										<input type="reset" value="Reset"/>
									</center>
								</td>
							</tr>
						</table>
					</form>
				</center>
			</div>
		</div>
	</body>
</html>
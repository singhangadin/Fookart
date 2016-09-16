function performcheck()
{	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var phone=document.getElementById("phone").value;
	var company=document.getElementById("company").value;
	var mess=document.getElementById("mess").value;
	var res=true;
	if(name=="")
	{	document.getElementById("nlabel").style.color="red";
		document.getElementById("nlabel").innerHTML="*Name:";
		res=false;
	}
	else
	{	document.getElementById("nlabel").style.color="black";
		document.getElementById("nlabel").innerHTML="Name:";
	}
	if(email=="")
	{	document.getElementById("elabel").style.color="red";
		document.getElementById("elabel").innerHTML="*Email:";
		res=false;
	}
	else
	{	document.getElementById("elabel").style.color="black";
		document.getElementById("elabel").innerHTML="Email:";
	}
	if(phone=="")
	{	document.getElementById("plabel").style.color="red";
		document.getElementById("plabel").innerHTML="*Phone:";
		res=false;
	}
	else
	{	document.getElementById("plabel").style.color="black";
		document.getElementById("plabel").innerHTML="Phone:";
	}
	if(company=="")
	{	document.getElementById("clabel").style.color="red";
		document.getElementById("clabel").innerHTML="*Company:";
		res=false;
	}
	else
	{	document.getElementById("clabel").style.color="black";
		document.getElementById("clabel").innerHTML="Company:";
	}
	if(mess=="")
	{	document.getElementById("mlabel").style.color="red";
		document.getElementById("mlabel").innerHTML="*Message:";
		res=false;
	}
	else
	{	document.getElementById("mlabel").style.color="black";
		document.getElementById("mlabel").innerHTML="Message:";
	}
	return res;
}

function func1()
{	var name=document.getElementById("l1").value;
	var uname=document.getElementById("l2").value;
	var e_id=document.getElementById("l3").value;
	var pass=document.getElementById("l4").value;
	var cpass=document.getElementById("l5").value;
	var add=document.getElementById("l6").value;
	var phn=document.getElementById("l7").value;
	var val=true;
	if(name=="")
	{	document.getElementById("ulabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("ulabel").innerHTML="";
	}
	if(uname=="")
	{	document.getElementById("flabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("flabel").innerHTML="";
	}
	if(e_id=="")
	{	document.getElementById("elabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("elabel").innerHTML="";
	}
	if(pass=="")
	{	document.getElementById("llabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("llabel").innerHTML="";
	}
	if(cpass=="")
	{	document.getElementById("clabel").innerHTML="Empty";
		val=false;
	}
	else if(cpass!=pass)
	{	document.getElementById("clabel").innerHTML="Password doesnt match";
		val=false;
	}
	else
	{	document.getElementById("clabel").innerHTML="";
	}
	if(add=="")
	{	document.getElementById("alabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("alabel").innerHTML="";
	}
	if(phn=="")
	{	document.getElementById("plabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("plabel").innerHTML="";
	}
	return val;
}

function func2()
{	var uname=document.getElementById("s1").value;
	var pass=document.getElementById("s2").value;
	var res=true;
	if(uname=="")
	{	document.getElementById("rlabel").innerHTML="Empty";
		res=false;
	}
	
	else
	{	document.getElementById("rlabel").innerHTML="";
	}
	if(pass=="")
	{	document.getElementById("xlabel").innerHTML="Empty";
		res=false;
	}
	else
	{	document.getElementById("xlabel").innerHTML="";
	}
	return res;
}
function func3()
{	var name=document.getElementById("l1").value;
	var e_id=document.getElementById("l3").value;
	var add=document.getElementById("l6").value;
	var phn=document.getElementById("l7").value;
	var val=true;
	if(name=="")
	{	document.getElementById("ulabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("ulabel").innerHTML="";
	}
	if(e_id=="")
	{	document.getElementById("elabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("elabel").innerHTML="";
	}
	if(add=="")
	{	document.getElementById("alabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("alabel").innerHTML="";
	}
	if(phn=="")
	{	document.getElementById("plabel").innerHTML="Empty";
		val=false;
	}
	else
	{	document.getElementById("plabel").innerHTML="";
	}
	return val;
}

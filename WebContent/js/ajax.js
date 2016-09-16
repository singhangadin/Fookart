function genajax(method,page,id)
{	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{	if (xmlhttp.readyState==4 && xmlhttp.status==200)
 		{	document.getElementById(id).innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open(method,page,false);
	xmlhttp.send();
}
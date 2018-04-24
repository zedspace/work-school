<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
	height: 100%; 
}
header{
    padding: 1em;
    color: white;
    background-color: white;
    clear: left;
    text-align: left;
    border-bottom : 3px solid #3973ac;
}
.wrap {
    width: 100%;
    height: 100%;
}
table {
    
    width: 40%;
    height : 60%;
    margin:2em auto;
}
th, td {
    border-bottom: 1px solid #ddd;
    padding: 15px;
    color : #2d5986;
    
}
p {
	color : #2d5986;
	text-align: center;
	font-size: 28px;
	font-weight: bold;
}
</style>
<script>
function validare(){
         var nume = document.getElementById("nume").value;
         var parola = document.getElementById("parola").value;
         var valid = true;
         if(nume=="" || parola=="" || nume==null ||parola==null)
             {
                 alert("Toate campurile sunt obligatorii");
                 valid = false;
             }
         return valid;
     }
</script>
<title>Catalogul virtual al studentului</title>
</head>
<body>    
<header>
   <h1><img src="C:\Users\gbs04610\Documents\Facultate\sigla-feaa-2016.png" height="100" width="450"/></h1>
</header>
<p>Catalogul virtual al studentului</p>
<p>Acceseaza platforma!</p>
  <%if(request.getAttribute("invalid")!=null){ %>
    <p style="font-size:20px;color:red;"><%=request.getAttribute("invalid")%></p>
    <%}%>
<div class="wrap">  
    <form name="from" method="post" action="ConnectionServlet" onsubmit="return validare();" >
    	<table border="5" align="center" bordercolor="#3973ac">
    	<tr>
		<th>Utilizator</th>
		<td><input type="text" name="nume" id="nume"/></td>
		</tr>
		<tr>
		<th>Parola</th>
		<td><input type="password" name="parola" id="parola"/></td>
		</tr>
		<tr>
		<td colspan="2" align="center"><input type="submit" value="Conectare"/></td>
		</tr>		
		</table>
	</form><   
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css\firstPageStyle.css">
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
   <h1><img src="C:\eclipse\Workspace\sigla-feaa-2016.png" height="100" width="450"/></h1>
</header>
<p>Catalogul virtual al studentului</p>
<p>Acceseaza platforma!</p>
<div class="wrap">  
    <form method="post" name="from" onsubmit="return validare();" action="ConnectionServlet">
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

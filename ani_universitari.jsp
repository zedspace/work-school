<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/adminStyle.css">
<title>Administrator</title>
</head>
<body>
<div class="wrap">
    <div class="meniu"> 
    <a href="departamente.jsp">Departamente</a> 
    <a href="specializari.jsp">Specializari</a> 
    <a class="active" href="ani_universitari.jsp">Ani Universitari</a> 
    <a href="grupe.jsp">Grupe</a>
    <a href="discipline.jsp">Discipline</a>
    <a href="studenti.jsp">Studenti</a>
    <a href="profesori.jsp">Profesori</a> 
    <a href="conturi.jsp">Conturi</a>
    <a href="PaginaPrincipala.jsp">Delogare</a>
    </div>
    <div class="continut" align="center">
    <h2>Ani universitari</h2>
<form name="form" method="post" action="UpdateServletAn">
    <table>
    	<tr>
<!--     		<td>Id An</td> -->
    		<td style="font-size:20px;text-align: center;">Anul de studiu</td>
    		<td style="font-size:20px;">Semestrul</td>
    	</tr>
    	<tr>
    	<%List<AnUniversitar> listaAni=PrelucrariDB.returnAni(); %>
    	<%for(AnUniversitar an: listaAni){ %>
<%--  			<td><input type="text" name="id_an" id="id_an" value="<%=an.getId_an_universitar() %>" disabled/></td> --%>
 			<td><input type="text" name="denumire_an" id="denumire_an" value="<%=an.getDenumire_an_universitar() %>" size=16 style="font-size:20px;text-align: center;" disabled/></td>   
 			<td><input type="text" name="semestrul" id="semestrul" value="<%=an.getSemestrul() %>"   size=5 style="font-size:20px;text-align: right;" disabled/></td> 
    	</tr>
    	<%}%> 	
</table>   
<input type="button" value="Inapoi"  onclick="location.href='admin.jsp';" style="font-size:16px;"/>
<input type="button" value="Adauga un an universitar"  onclick="showFunctionAdd()" style="font-size:16px;"/>
<br><br><br>
	<div id="adaugareAnUniv" style="display: none;">
		<form id="adaugaAn" method="post" action="UpdateServletAn">
		<table>
			<tr>
				<td colspan="2" style="font-size:20px;">Adauga un an universitar</td>
			</tr>
			<tr>
				<td style="font-size:20px;">Anul de studiu</td>
				<td><input type="text" name="denumire_an" id="denumire_an" style="font-size:20px;"/></td>
			</tr>
			<tr>
				<td style="font-size:20px;">Semestrul</td>
				<td><input type="text" name="semestrul" id="semestrul" style="font-size:20px;"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="adaugaSubmit" id="adaugaSubmit" value="Adauga anul" style="font-size:16px;"/></td>
			</tr>
		</table>
		</form>
	</div>
    </form>
</div>  
</div>

<script>
function showFunctionAdd() {
    var x = document.getElementById("adaugareAnUniv");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
</script>
</body>
</html>
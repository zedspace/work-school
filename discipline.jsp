<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html SYSTEM "about:legacy-compat">
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
    <a href="ani_universitari.jsp">Ani Universitari</a> 
    <a href="grupe.jsp">Grupe</a>
    <a class="active" href="discipline.jsp">Discipline</a>
    <a href="studenti.jsp">Studenti</a>
    <a href="profesori.jsp">Profesori</a> 
    <a href="conturi.jsp">Conturi</a>
    <a href="PaginaPrincipala.jsp">Delogare</a>
    </div>
    <div class="continut">
    <h2>Discipline</h2>
    <form action="DisciplinaServlet">
    <table>
    	<tr>
    		<td>Cauta disciplinele</td>
    	</tr>
    	<tr>
    		<td>Selecteaza tipul disciplinei</td>
    		<td><input type="radio" name="tipDisciplina" id="tipDisciplina" value="curs"/>Curs<br>
    			<input type="radio" name="tipDisciplina" id="tipDisciplina" value="seminar"/>Seminar<br>
    			<input type="radio" name="tipDisciplina" id="tipDisciplina" value="laborator"/>Laborator<br>
    		</td>  	
    		<td><button type="submit" name="cauta" id="cauta">Cauta disciplina</button></td>
    		<td><br><br><br></td>	
    	</tr>
    	</table>
    	</form>
    	<form action="DisciplinaServlet">
    	<table>
    	<tr>
    		<td>Id Disciplina</td>
    		<td>Cod Disciplina</td>
    		<td>Denumire Disciplina</td>
    		<td>Tip disciplina</td>
    	</tr>
    	<tr>
    	<%	List<Disciplina> listaDiscipline=new ArrayList<Disciplina>();
    		if(request.getAttribute("listaDiscipline")!=null)
    		{listaDiscipline=(ArrayList<Disciplina>)request.getAttribute("listaDiscipline"); }
    		else {
    			listaDiscipline=PrelucrariDB.returnDiscipline();
    		}%>
    	<%if(listaDiscipline!=null){ %>
    	<%for(Disciplina disciplina: listaDiscipline){ %>
 			<td><input type="text" name="id_disciplina" id="id_disciplina" value="<%=disciplina.getId_disciplina() %>" disabled size="10"/></td>
 			<td><input type="text" name="cod_disciplina" id="cod_disciplina" value="<%=disciplina.getCod_disciplina() %>" disabled size="10"/></td>   
 			<td><input type="text" name="denumire_disciplina" id="denumire_disciplina" value="<%=disciplina.getDenumire_disciplina() %>" disabled size="30"/></td>
 			<td><input type="text" name="tip_disciplina" id="tip_disciplina" value="<%=disciplina.getTip_disciplina() %>" disabled size="10"/></td>
    	</tr>
    	<%}};%>
    </table>
    </form>
    </div></div>
</body>
</html>
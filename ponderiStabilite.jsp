<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ponderi Stabilite</title>
</head>
<body>
<h3>Ponderi stabilite :</h3>
<table>
<tr>
			<td>Titulatura</td>
			<td>Nume</td>
			<td>Prenume</td>
			<td>Anul Universitar</td>
			<td>Specializarea</td>
			<td>Grupa</td>
			<td>Disciplina</td>
			<td>Tipul Disciplinei</td>
			<td>Pondere</td>
		</tr>
<%List<Pondere> listaPondere=PrelucrariDB.returnPondere(); %>
<%List<AfisarePondere> ponderiStabilite=PrelucrariDB.afisarePondere(listaPondere); %>
	<%for(AfisarePondere pondere: ponderiStabilite){ %>
		<tr>
			<td><%=pondere.getTitulatura()%></td>
			<td><%=pondere.getNumeProfesor()%></td>
			<td><%=pondere.getPrenumeProfesor()%></td>
			<td><%=pondere.getAn()%></td>
			<td><%=pondere.getSpecializare()%></td>
			<td><%=pondere.getGrupa()%></td>
			<td><%=pondere.getNumeDisciplina()%></td>
			<td><%=pondere.getTipDisciplina()%></td>
			<td><input type="text" name="pondere" id="pondere" value="<%=pondere.getPondere()%>"/></td>
		</tr>
	<%}%>
</table>	
</body>
</html>
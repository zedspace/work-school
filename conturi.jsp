<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css\adminStyle.css">
<title>Administrator</title>
</head>
<body>
<header>
   <h1><img src="C:\eclipse\Workspace\sigla-feaa-2016.png" height="100" width="450"/></h1>
</header>
<nav>
</nav>
<div class="wrap">
    <div class="meniu"> 
    <a href="departamente.jsp">Departamente</a> 
    <a href="specializari.jsp">Specializari</a> 
    <a href="ani_universitari.jsp">Ani Universitari</a> 
    <a href="grupe.jsp">Grupe</a>
    <a href="discipline.jsp">Discipline</a>
    <a href="studenti.jsp">Studenti</a>
    <a href="profesori.jsp">Profesori</a> 
    <a class="active" href="conturi.jsp">Conturi</a>
    <a href="PaginaPrincipala.jsp">Delogare</a>
    </div>
    <div class="continut">
    <h2>Conturi</h2>
<form  action="ContServlet" method="post">
    <table>
    	<tr>
    		<td>Utilizator</td>
    		<td>Parola</td>
    		<td>Alte informatii</td>
    		<td>Marca</td>
    		<td>Numar Matricol</td>

    	</tr>
    	<tr>
    	<%List<Cont> listaConturi=PrelucrariDB.returnConturi(); %>
    	<%for(Cont cont: listaConturi){ %>
 			<td><%=cont.getUtilizator() %></td>
 			<td><%=cont.getParola() %></td>   
 			<td><%=cont.getInformatii() %></td>
 			<td><%=cont.getMarca() %></td>
 			<td><%=cont.getNumar_matricol() %></td>
    	</tr>
    	<%}%>
    </table>
    <button type="button" name="adaugaCont" onclick="showFunctionAdd()">Creeaza cont</button>
    </form>
     <div id="adaugareCont" style="display: none;">
    <form name="adaugaForm" action="ContServlet" method="post">
    <table>
    	<tr>
    	<td>Creeaza un cont nou</td>
    	<td></td>
    	</tr>
    	<tr>
    	<td>Selecteaza tipul contului</td>
    	<td><input type="radio" name="tipCont" id="tipCont" value="profesor" onclick="document.getElementById('profesor').disabled = false;document.getElementById('student').disabled = true"/>Profesor<br>
    	<input type="radio" name="tipCont" id="tipCont" value="student" onclick="document.getElementById('student').disabled = false ; document.getElementById('profesor').disabled = true"/>Student</td>
    	</tr>
    	<tr>
    	<td>Nume utilizator</td>
    	<td><input type="text" id="utilizator" name="utilizator" size="50" /></td>
    	</tr>
    	<tr>
    	<td>Parola</td>
    	<td><input type="text" id="parola" name="parola" size="50"/></td>
    	</tr>
    	<tr>
    	<td>Alte informatii</td>
    	<td><textarea id="informatii" rows="4" cols="50"></textarea></td>
    	</tr>
    	<tr>
    	<td>Numele si prenumele studentului</td>
    	<td><select name="student" id="student" disabled>
		<%List<Student> listaStudenti= PrelucrariDB.returnStudenti(); %>
			<%for(Student student:listaStudenti){ %>
			<option value = "<%=student.getNumar_matricol()%>"> 
			<%=(student.getNume()+" "+student.getPrenume())%>
			</option>
			<%}%>
			</select></td>
    	</tr>
    	<tr>
    	<td>Numele si profesorului</td>
    	<td><select name="profesor" id="profesor" disabled>
		<%List<Profesor> listaProfesori= PrelucrariDB.returnProfesor(); %>
			<%for(Profesor profesor:listaProfesori){ %>
			<option value = "<%=profesor.getMarca()%>"> 
			<%=(profesor.getTitulatura()+" "+profesor.getNume()+" "+profesor.getPrenume())%>
			</option>
			<%}%>
			</select>
			</td>
    	</tr>
    	<tr>
    	<td><button type="Submit" id="adaugaCont" name="adaugaCont">Creeaza contul</button></td>
    	</tr>
    	<tr><td><%if(request.getAttribute("incomplet")!=null){%>
    <p><%=request.getAttribute("incomplet")%></p>
    <%}%></td></tr>
    </table>
    </form>
    	</div>
    
    <div></div>
 <script>
function showFunctionAdd() {
    var x = document.getElementById("adaugareCont");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
</script>
</body>
</html>
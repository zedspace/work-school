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
    <a class="active" href="studenti.jsp">Studenti</a>
    <a href="profesori.jsp">Profesori</a> 
    <a href="conturi.jsp">Conturi</a>
    <a href="PaginaPrincipala.jsp">Delogare</a>
    </div>
    <div class="continut">
    <h2>Studenti</h2>
    <form name="form" action="StudentServlet">
    <table>
    	<tr>
    		<td>Numar Matricol</td>
    		<td>CNP</td>
    		<td>Nume</td>
    		<td>Prenume</td>
    		<td>Forma de Finantare</td>
    	</tr>
    	<tr>
    	<%List<Student> listaStudenti=PrelucrariDB.returnStudenti(); %>
    	<%for(Student student: listaStudenti){ %>
 			<td><%=student.getNumar_matricol() %></td>
 			<td><%=student.getCnp() %></td>   
 			<td><%=student.getNume() %></td>
 			<td><%=student.getPrenume() %></td>
 			<td><%=student.getForma_finantare() %></td>
    	</tr>
    	<%}%>
    	<tr>
    	<td><button type="button" name="adaugaStudent" onclick="showFunctionAdd()">Adauga un student</button></td>
    	</tr>
    	<tr>
    	<td>Cauta un student</td>
    	<td><input type="text" name="nume" id="nume"/></td>
    	<td><button type="submit" name="cauta" value="cauta">Cauta</button></td>
    	</tr>
    </table>
    <div id="adaugareStudent" style="display: none;">
    <form name="adaugaForm" action="StudentServlet" method="post">
    <table>
    	<tr>
    	<td>Adauga un nou student</td>
    	<td></td>
    	</tr>
    	<tr>
    	<td>CNP</td>
    	<td><input type="text" id="cnp" name="cnp" size="50" maxlength="13"/></td>
    	</tr>
    	<tr>
    	<td>Nume</td>
    	<td><input type="text" id="nume_stud" name="nume_stud" size="50"/></td>
    	</tr>
    	<tr>
    	<td>Prenume</td>
    	<td><input type="text" id="prenume" name="prenume" size="50"/></td>
    	</tr>
    	<tr>
    	<td>Forma de finantare</td>
    	<td><input type="radio" name="formaFinantare" id="formaFinantare" value="Buget"/>Buget<br>
    	<input type="radio" name="formaFinantare" id="formaFinantare" value="Taxa"/>Taxa</td>
    	</tr>
    	<tr>
    	<td><button type="Submit" id="adaugaStud" name="adaugaStud">Adauga Studentul</button></td>
    	</tr>
    	<tr><td><%if(request.getAttribute("incomplet")!=null){%>
    <p><%=request.getAttribute("incomplet")%></p>
    <%}%></td></tr>
    </table>
    </form>
    	</div>
    </form>
    <%List<Student> listaRezultat=(ArrayList<Student>)request.getAttribute("listaRezultat");%>
    <%if(listaRezultat!=null) {
    	
    %>
    <form>
    <table>
    	<tr>
    		<td>Numar Matricol</td>
    		<td>CNP</td>
    		<td>Nume</td>
    		<td>Prenume</td>
    		<td>Forma de Finantare</td>
    	</tr>
    	<tr>
    	<%for(Student student: listaRezultat){ %>
			<td><%=student.getNumar_matricol() %></td>
			<td><%=student.getCnp() %></td>   
			<td><%=student.getNume() %></td>
			<td><%=student.getPrenume() %></td>
			<td><%=student.getForma_finantare() %></td>
	</tr>
	<%}%>
	</table>
    </form>
    <%}%>
    <%if(request.getAttribute("notFound")!=null){%>
    <p><%=request.getAttribute("notFound")%></p>
    <%}%>
    
</div>  
</div>
<script>
function showFunctionAdd() {
    var x = document.getElementById("adaugareStudent");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
</script>
</body>
</html>
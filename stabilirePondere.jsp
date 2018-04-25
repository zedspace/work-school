<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
    font-size: 28px;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
    position: -webkit-sticky; /* Safari */
    position: sticky;
    top: 0;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 28px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: #333;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color: #111;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
<title>Stabilire Pondere</title>
</head>
<body>
<div class="header">
	<p><%
		int idUser=Integer.parseInt(request.getSession().getValue("idUser").toString());
		Profesor profesor=PrelucrariDB.returnProfesorInfo(idUser);
		%>
		<%=profesor.getTitulatura()+" "+profesor.getNume()+" "+profesor.getPrenume() %>
	</p>
</div>

<ul>
  <li><a href="#home">Home</a></li>
  <li><a class="active" href="stabilirePondere.jsp" class="dropbtn">Stabilire ponderi</a></li>
  <div class="dropdown">
    <button class="dropbtn">Stabilire ponderi <i class="fa fa-caret-down"></i></button>
    <div class="dropdown-content">
	    <%List<Preda> listaPredare=PrelucrariDB.returnPreda(idUser); %>
		<%List<Specializare> predareSpecializare=PrelucrariDB.predareSpecializare(listaPredare); %>
		<%for(Specializare predareSpec: predareSpecializare){ %>
			 <a href="#"><%=predareSpec.getDenumire_specializare()%></a>
		<%}%>
    </div>
  </div> 
  <li><a href="#contact">Notare Studenti</a></li>
</ul>

<h3>Text</h3>
<h3>Stabilirea ponderilor evaluarilor</h3>
<form action="PondereServlet" name="admin" id="admin" method="POST" enctype="multipart/form-data">
<h4>Stabileste ponderea disciplinelor</h4>
<h5>Specializari disponibile</h5>
<div id="profesoriAlocati" >
		<table>
		
			
		</table>	
    </div>
<table>
</table>
<table>
<tr>
<td><label>Selecteaza specializarea : </label></td>
<td>
<%List<Specializare> listaSpecializari= PrelucrariDB.returnSpecializari(); %>
	<select name="specializare" id="specializare">
	<%for(Specializare specializare: listaSpecializari){ %>
	<option value = "<%=specializare.getCod_specializare()%>"> 
	<%=(specializare.getDenumire_specializare())%>
	</option>
	<%}%>
	</select>
</td>
</tr>
<tr>
<td><label>Selecteaza anul de studiu</label></td>
<td>
<input type="radio" id="an_studiu" name="an_studiu" value="1">1
<input type="radio" id="an_studiu" name="an_studiu" value="2">2
<input type="radio" id="an_studiu" name="an_studiu" value="3">3
</td>
</tr>
<tr>
<td>Selecteaza grupa</td>
<td>
<%	
	List<Grupa> listaGrupe= PrelucrariDB.returnGrupe(1,1); %>
	<select name="grupa">
	<%for(Grupa grupa: listaGrupe){ %>
	<option value = "<%=grupa.getId_grupa()%>"> 
	<%=(grupa.getNumar_grupa())%>
	</option>
	<%}%>
	</select>
</td>
</tr>

<tr>
<td><label>Selecteaza disciplina : </label></td>
<td>
<%List<Disciplina> listaDiscipline= PrelucrariDB.returnDiscipline(); %>
	<select name="disciplina" id="disciplina">
	<%for(Disciplina disc: listaDiscipline){ %>
	<option value = "<%=disc.getId_disciplina()%>"> 
	<%=(disc.getDenumire_disciplina()+" "+disc.getTip_disciplina())%>
	</option>
	<%}%>
	</select>
</td>
</tr>
<tr>
<td>Stabileste ponderea : </td>
<td><input type="text" name="pondere" id="pondere"/></td>
</tr>
</table>
<input type="submit" value="Confirma">
</form>

</body>
</html>
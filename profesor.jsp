<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator</title>
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

<form id="form" method="POST" action="PondereServlet">
<ul>
  <li><a href="#home">Home</a></li>
  <div class="dropdown">
    <button class="dropbtn">Stabilire ponderi <i class="fa fa-caret-down"></i></button>
    <div class="dropdown-content">
	    <%List<Preda> listaPredare=PrelucrariDB.returnPreda(idUser); %>
		<%List<Specializare> predareSpecializare=PrelucrariDB.predareSpecializare(listaPredare); %>
		<%for(Specializare predareSpec: predareSpecializare){ %>
			 <a href="PondereServlet?cod=<%=predareSpec.getCod_specializare()%>"><%=predareSpec.getDenumire_specializare()%></a>
<!-- 			 <input type="hidden" name="cod" id="cod" value="0"/> -->
			 <%request.getSession().putValue("spec",predareSpec.getCod_specializare());%>
		<%}%>
    </div>
  </div> 
  <li><a href="#contact">Notare Studenti</a></li>
</ul>
</form>
<h3>Text</h3>

</body>
<script>
$(document).ready(function(){
    $("link").click(function(){
        $("name").hide();
    });
});
</script>
</html>
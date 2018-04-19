<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="database.PrelucrariDB" %>
<%@ page import="claseResurse.*" %>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css\adminStyle.css">
<title>Administrator</title>
</head>
<body>
<div class="wrap">
    <div class="meniu"> 
    <a class="active" href="departamente.jsp">Departamente</a> 
    <a href="specializari.jsp">Specializari</a> 
    <a href="ani_universitari.jsp">Ani Universitari</a> 
    <a href="grupe.jsp">Grupe</a>
    <a href="discipline.jsp">Discipline</a>
    <a href="studenti.jsp">Studenti</a>
    <a href="profesori.jsp">Profesori</a> 
    <a href="conturi.jsp">Conturi</a>
    <a href="PaginaPrincipala.jsp">Delogare</a>
    </div>
    <div class="continut" align="center">
    <h2>Departamente</h2>
    <form name="form" method="post" action="UpdateServletDep" >
    <%if(request.getAttribute("exista")!=null){ %>
    <p style="font-size:20px;color:red;"><%=request.getAttribute("exista")%></p>
    <%}%>
    <%if(request.getAttribute("inexistent")!=null){ %>
    <p style="font-size:20px;color:red;"><%=request.getAttribute("inexistent")%></p>
    <%}%>
<table id="departamente">
<tr>
			<td style="font-size:20px;"><b>Denumire departament</b></td>
			<td style="font-size:20px;"><b>Modifica</b></td>
<!-- 			<td>Sterge</td> -->
			
		</tr>
<%int i=1;List<Departament> listaDepartamente=PrelucrariDB.returnDepartamente(); %>
	<%for(Departament departament: listaDepartamente){ %>
		<tr id="dep<%=i%>">
			<td><input type="text" name="denumire_departament" id="denumire_departament" value="<%=departament.getDenumire_departament()%>" size="30" style="font-size:20px;" disabled/></td>
			<input type="hidden" name="cod_dept" id="cod_dept"/>
			<td align="center"><button type="button" name="modifica" id="modifica" value="<%=departament.getCod_departament() %>" onclick="updateFunction(this,<%=i%>)">Modifica</button></td>
<%-- 			<td><button type="submit" name="sterge" id="sterge" value="<%=departament.getCod_departament() %>" onclick="return deleteFunction()"><img src="C:\eclipse\Workspace\remove-icon.png" alt="sterge" height="20" width="20"/></button></td> --%>
		</tr>
	<%i++;}%>
</table>
<button type="button" id="inapoi" onclick="location.href = 'admin.jsp';">Inapoi</button>
<button type="button" id="adauga" onclick="showFunctionAdd()">Adauga</button>
<button type="button" id="vizualizare" onclick="showFunctionShow()">Vizualizare profesori din departament</button>
<br><br><br>
	<div id="adaugareDepartament" style="display: none;">
		<form id="adaugaDep" method="post" action="UpdateServletDep">
		<table>
			<tr>
				<td colspan="2" style="font-size:20px;">Adauga un nou departament</td>
			</tr>
			<tr>
				<td style="font-size:20px;">Denumirea departamentului</td>
				<td><input type="text" name="denumire_dep" id="denumire_dep" style="font-size:20px;"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="adaugaSubmit" id="adaugaSubmit" value="Adauga departamentul" style="font-size:16px;" onclick="myFunction()"/></td>
			</tr>
		</table>
		</form>
		</div>
		<div id="vizualizareProfesori" style="display: none;">
				<form id="vizualizareProf" method="post" action="UpdateServletDep">
				<table>
					<tr>
						<td colspan="2" style="font-size:20px;">Profesorii din cadrul departamentului:</td>
						<td> <%List<Departament> listaDepFiltru= PrelucrariDB.returnDepartamente(); %>
							<select name="departament" id="departament" style="font-size:20px;">
								<option value=""></option>
								<%for(Departament departament: listaDepFiltru){ %>
									<option value = "<%=departament.getCod_departament()%>"> 
										<%=(departament.getDenumire_departament())%>
									</option>
								<%}%>
							</select> 
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" name="vezi" id="vezi" value="Vizualizeaza" style="font-size:16px;" onclick="myFunction()"/></td>
					</tr>
				</table>
				</form>
			</div>
			
		<div>
		<%List<Profesor> listaRezultatFiltrat=(ArrayList<Profesor>)request.getAttribute("listaProfesori");%>
		    <%if(listaRezultatFiltrat!=null) {%>  
		    <table>
		    	<tr >
		    		<td colspan="4" style="font-size:20px;"><b>Profesorii din cadrul departamentului <%=request.getAttribute("departament") %> sunt :</b></td>
		    		<td colspan="4"></td>
		    	</tr>
		    	<tr>
		<!--     		<td>Marca</td> -->
		    		<td style="font-size:20px;"><b>Grad didactic</b></td>
		    		<td style="font-size:20px;"><b>Nume</b></td>
		    		<td style="font-size:20px;"><b>Prenume</b></td>
		    		<td style="font-size:20px;"><b>Departament</b></td>
		    	</tr>
		    	<tr>
		    	<%for(Profesor profesor: listaRezultatFiltrat){ %>
		<%-- 			<td><%=profesor.getMarca() %></td> --%>
					<td><input type="text" name="titulatura" id="titulatura" value="<%=profesor.getTitulatura() %>" disabled size="10" style="font-size:20px;"/></td>
		 			<td><input type="text" name="nume" id="nume" value="<%=profesor.getNume() %>" disabled size="15" style="font-size:20px;"/></td>   
		 			<td><input type="text" name="prenume" id="prenume" value="<%=profesor.getPrenume() %>" disabled size="30" style="font-size:20px;"/></td>
		 			<td><input type="text" name="departament" id="departament" value="<%=PrelucrariDB.returnDepartamente(profesor.getCod_departament()).getDenumire_departament() %>" disabled size="30" style="font-size:20px;"/></td>
			</tr>
			<%}%>
			<tr></tr>
			</table>
		    <%}%>
		</div>
</form> 
</div>
</div>
<script>
function showFunctionAdd() {
    var x = document.getElementById("adaugareDepartament");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
function showFunctionShow() {
    var x = document.getElementById("vizualizareProfesori");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
// function deleteFunction() {
//     var r = confirm("Confirmi stergerea acestui departament?");
//     var cod= document.getElementById(cod_departament).value;
//     if (r == true) {
//         alert("S-a sters departamentul!");
//         document.getElementById(confirm_box).value="true";
//         return true;
//     } else {
//         alert("Nu se va sterge departamentul!");
//         document.getElementById(confirm_box).value="false";
//         return false;
//     }
// }
var countClicks = 0;
function updateFunction(btn,i) {
	var dep=document.getElementById("dep"+i);
	var den_dep=dep.querySelector("#denumire_departament");
	var cod_dep=dep.querySelector("#cod_departament");
	if(countClicks==0)
		{
			den_dep.disabled=!den_dep.disabled;
			cod_dep.disabled=cod_dep.disabled;
		}
	else
		{
			document.getElementById("denumire_departament").disabled = true;
			document.getElementById("cod_dept").value=cod_dep.value;
			document.form.submit();
		}
	btn.value=cod_dep.value;
	countClicks++;
}
</script>
</body>
</html>
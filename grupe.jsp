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
    <a href="ani_universitari.jsp">Ani Universitari</a> 
    <a class="active" href="grupe.jsp">Grupe</a>
    <a href="discipline.jsp">Discipline</a>
    <a href="studenti.jsp">Studenti</a>
    <a href="profesori.jsp">Profesori</a> 
    <a href="conturi.jsp">Conturi</a>
    <a href="PaginaPrincipala.jsp">Delogare</a>
    </div>
    <div class="continut" align="center">
    <h2>Grupe</h2>
    <form>
    <button type="button" id="vizualizare_total" name="vizualizare_total" onclick="showFunctionAll()" style="font-size:20px;">Vizualizeaza toate grupele</button>
    <button type="button" id="vizualizare_filtru" name="vizualizare_filtru" onclick="showFunctionFilter()" style="font-size:20px;">Vizualizeaza grupele - Filtru</button>
    <button type="button" id="adaugare_grupa" name="adaugare_grupa" onclick="showFunctionAdd()" style="font-size:20px;">Adauga o grupa</button>
    <br><br><br>
    <table id="toate_grupele" style="display: none;">
    	<tr>
    		<td style="font-size:20px;"><b>Numar Grupa</b></td>
    		<td style="font-size:20px;"><b>An studiu</b></td>
    		<td style="font-size:20px;"><b>Numar Studenti</b></td>
    		<td style="font-size:20px;"><b>Specializarea</b></td>
    		<td style="font-size:20px;"><b>Forma de invatamant</b></td>
    	</tr>
    	<tr>
    	<%List<Grupa> listaGrupe=PrelucrariDB.returnGrupe(); %>
    	<%for(Grupa grupa: listaGrupe){ %>
<%--  			<td><input type="text" name="id_grupa" id="id_grupa" value="<%=grupa.getId_grupa() %>" disabled size="10"/></td> --%>
 			<td><input type="text" name="nr_grupa" id="nr_grupa" value="<%=grupa.getNumar_grupa() %>" disabled size="5" style="font-size:20px;text-align:right;"/></td>   
 			<td><input type="text" name="an_studiu" id="an_studiu" value="<%=grupa.getAn_studiu() %>" disabled size="5" style="font-size:20px;text-align:right;"/></td> 
 			<td><input type="text" name="nr_studenti" id="nr_studenti" value="<%=grupa.getNumar_studenti() %>" disabled size="5" style="font-size:20px;text-align:right"/></td>
 			<td><input type="text" name="den_specializare" id="den_specializare" value="<%=PrelucrariDB.returnSpecializare(grupa.getSpecializare_cod_specializare()).getDenumire_specializare() %>" disabled size="45" style="font-size:20px;"/></td>
    		<td><input type="text" name="forma_invatamant" id="forma_invatamant" value="<%=PrelucrariDB.returnSpecializare(grupa.getSpecializare_cod_specializare()).getForma_invatamant() %>" disabled size="15" style="font-size:20px;"/></td> 		
    	</tr>
    	<%}%>
    </table>   	
    </form>
    
   <div id="adaugareGrupa" style="display: none;">
		<form id="adaugaGrupa" method="post" action="UpdateServletGrupa">
		<br><br><br>
		<table>
			<tr>
				<td colspan="2" style="font-size:20px;"><b>Adauga o grupa</b></td>
			</tr>
			<tr>
			<td><label style="font-size:20px;"><b>Selecteaza specializarea : <b></b></label></td>
			<td>
			<%List<Specializare> listaSpec= PrelucrariDB.returnSpecializari(); %>
				<select name="specializare_add" id="specializare_add" style="font-size:20px;">
				<%for(Specializare specializare: listaSpec){ %>
				<option value = "<%=specializare.getCod_specializare()%>"> 
				<%=(specializare.getDenumire_specializare())%> &rarr; <%=(specializare.getForma_invatamant()) %>
				</option>
				<%}%>
				</select>
			</td>
			</tr>
			<tr>
			<td><label style="font-size:20px;"><b>Selecteaza anul de studiu</b></label></td>
			<td>
			<input type="radio" id="an_studiu_add" name="an_studiu_add" value="1"><label style="font-size:20px;">1</label>
			<input type="radio" id="an_studiu_add" name="an_studiu_add" value="2"><label style="font-size:20px;">2</label>
			<input type="radio" id="an_studiu_add" name="an_studiu_add" value="3"><label style="font-size:20px;">3</label>
			</td>
			</tr>
			<tr>
			<td><label style="font-size:20px;"><b>Introdu numarul grupei</b></label></td>
			<td>
			<input type="text" id="numar_grupa_add" name="numar_grupa_add" style="font-size:20px;">
			</td>
			</tr>
			<tr>
			<td><label style="font-size:20px;"><b>Introdu numarul de studenti</b></label></td>
			<td>
			<input type="text" id="numar_studenti_add" name="numar_studenti_add" style="font-size:20px;">
			</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="submit" name="adaugaBtn" id="adaugaBtn" style="font-size:20px;">Adauga grupa</button></td>
			</tr>
		</table>
		</form>
	</div>
	
	<div id="afisareFiltru" style="display: none;">
		<form id="afiseazaFiltru" method="post" action="UpdateServletGrupa">
		<br><br>
		<table>
			<tr>
				<td colspan="2" style="font-size:20px;"><b>Vizualizare filtrata</b></td>
			</tr>
			<tr>
			<td><label style="font-size:20px;"><b>Selecteaza specializarea : </b></label></td>
			<td>
			<%List<Specializare> listaSpecializari= PrelucrariDB.returnSpecializari(); %>
				<select name="specializare" id="specializare" style="font-size:20px;">
				<%for(Specializare specializare: listaSpecializari){ %>
				<option value = "<%=specializare.getCod_specializare()%>"> 
				<%=(specializare.getDenumire_specializare())%> &rarr; <%=(specializare.getForma_invatamant()) %>
				</option>
				<%}%>
				</select>
			</td>
			</tr>
			<tr>
			<td><label style="font-size:20px;"><b>Selecteaza anul de studiu</b></label></td>
			<td>
			<input type="radio" id="an_studiu" name="an_studiu" value="1"><label style="font-size:20px;">1</label>
			<input type="radio" id="an_studiu" name="an_studiu" value="2"><label style="font-size:20px;">2</label>
			<input type="radio" id="an_studiu" name="an_studiu" value="3"><label style="font-size:20px;">3</label>
			</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="submit" name="vizualizareBtn" id="vizualizareBtn" style="font-size:20px;">Vizualizeaza grupele</button></td>
			</tr>
		</table>
		</form>
		</div>
		<%List<Grupa> listaRezultat=(ArrayList<Grupa>)request.getAttribute("listaRezultat");%>
   		 <%if(listaRezultat!=null) { %>
    <form name="form" method="post" action="UpdateServletGrupa">
    <br><br><br>
    <table id="grupe_filtrate">
    	<tr>
<!--     		<td>Id Grupa</td> -->
    		<td style="font-size:20px;"><b>Numar Grupa</b></td>
    		<td style="font-size:20px;"><b>An studiu</b></td>
    		<td style="font-size:20px;"><b>Numar Studenti</b></td>
    		<td style="font-size:20px;"><b>Specializarea</b></td>
    		<td style="font-size:20px;"><b>Forma de invatamant</b></td>
    	</tr>	
    	<%int i=1;for(Grupa grupa: listaRezultat){ %>
    	<tr id="grupa<%=i%>">
<%--  			<td><input type="text" name="id_grupa" id="id_grupa" value="<%=grupa.getId_grupa() %>" disabled size="10"/></td> --%>
 			<td><input type="text" name="nr_grupa" id="nr_grupa" value="<%=grupa.getNumar_grupa() %>" disabled size="5" style="font-size:20px;text-align:right;"/></td>   
 			<td><input type="text" name="an_studiu" id="an_studiu" value="<%=grupa.getAn_studiu() %>" disabled size="5" style="font-size:20px;text-align:right;"/></td> 
 			<td><input type="text" name="nr_studenti" id="nr_studenti" value="<%=grupa.getNumar_studenti() %>" disabled size="5" style="font-size:20px;text-align:right;"/></td>
 			<td><input type="text" name="den_specializare" id="den_specializare" value="<%=PrelucrariDB.returnSpecializare(grupa.getSpecializare_cod_specializare()).getDenumire_specializare() %>" disabled size="45" style="font-size:20px;"/></td>
 			<td><input type="text" name="forma_invatamant" id="forma_invatamant" value="<%=PrelucrariDB.returnSpecializare(grupa.getSpecializare_cod_specializare()).getForma_invatamant() %>" disabled size="15" style="font-size:20px;"/></td> 		
<%--  			<td><button type="button" name="modifica" id="modifica" value="<%=grupa.getId_grupa() %>" onclick="updateField(this,<%=i%>)" style="font-size:20px;">Modifica</button></td> --%>
    		<input type="hidden" name="cod_grupa" id="cod_grupa">
    	</tr>	
    	<%i++;}%>
    </table>
    </form>
    <%}%>

</div>  
</div>
<script>
function showFunctionAll() {
    var x = document.getElementById("toate_grupele");
    var y = document.getElementById("adaugareGrupa");
    var z = document.getElementById("afisareFiltru");
    z.style.display = "none";
	 y.style.display = "none";
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
function showFunctionAdd() {
    var x = document.getElementById("adaugareGrupa");
    var y = document.getElementById("toate_grupele");
    var z = document.getElementById("afisareFiltru");
    z.style.display = "none";
    y.style.display = "none";
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
function showFunctionFilter() {
    var x = document.getElementById("afisareFiltru");
    var y = document.getElementById("adaugareGrupa");
    var z = document.getElementById("toate_grupele");
    y.style.display = "none";
	z.style.display = "none";
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
function showFiltredGroup(){
	var x = document.getElementById("vizualizare");
    var y = document.getElementById("adaugareGrupa");
    var z = document.getElementById("toate_grupele");
    y.style.display = "none";
	z.style.display = "none";
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
var countClicks = 0;
function updateField(btn,i)
{
	var grupa=document.getElementById("grupa"+i);
	var nr_stud=grupa.querySelector("#nr_studenti");
	if(countClicks==0)
		{
			nr_stud.disabled=!nr_stud.disabled;
		}
	else
		{
			nr_stud.disabled=!nr_stud.disabled;
			document.getElementById("nr_studenti").value=nr_stud.value;
			document.getElementById("cod_grupa").value=btn.value;
			alert(document.getElementById("nr_studenti").value);
			alert("S-a actualiza departamentul "+btn.value);
			document.form.submit();
		}
	countClicks++;	
	}
</script>
</body>
</html>
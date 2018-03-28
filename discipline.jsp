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
    <div class="continut" align="center">
    <h2>Discipline</h2>
    <form action="DisciplinaServlet">
    <%if(request.getAttribute("notFound")!=null){%>
    <p style="font-size:20px;color:red;"><%=request.getAttribute("notFound")%></p>
    <%}%>
    <table>
    	<tr>
    		<td style="font-size:20px;"><b>Cauta disciplinele</b></td>
    	</tr>
    	<tr>
    		<td><button type="submit" name="vizualizare" id="vizualizare" style="font-size:20px;">Vezi toate disciplinele</button></td>
    	</tr>
    	</table>
    	<%	List<Disciplina> listaCompletaDisc=new ArrayList<Disciplina>();
    		if(request.getAttribute("listaCompletaDisc")!=null)
    			{
    			listaCompletaDisc=(ArrayList<Disciplina>)request.getAttribute("listaCompletaDisc"); 
    	%> 
    	<table>
    	<tr>
    		<td style="font-size:20px;"><b>Denumire Disciplina</b></td>
    		<td style="font-size:20px;"><b>Tip disciplina</b></td>
    	</tr>
    	<tr>
    	<%for(Disciplina disciplina: listaCompletaDisc){ %>
 			<td><input type="text" name="denumire_disciplina" id="denumire_disciplina" value="<%=disciplina.getDenumire_disciplina() %>" disabled size="30" style="font-size:20px;"/></td>
 			<td><input type="text" name="tip_disciplina" id="tip_disciplina" value="<%=disciplina.getTip_disciplina() %>" disabled size="10" style="font-size:20px;"/></td>
    	</tr>
    	<%}};%>
    	<table>
    	<tr>
    		<td style="font-size:20px;"><b>Selecteaza tipul disciplinei</b></td>
    		<td><input type="radio" name="tipDisciplina" id="tipDisciplina" value="curs" /><label style="font-size:20px;">Curs</label><br>
    			<input type="radio" name="tipDisciplina" id="tipDisciplina" value="seminar" /><label style="font-size:20px;">Seminar</label><br>
    			<input type="radio" name="tipDisciplina" id="tipDisciplina" value="laborator"/><label style="font-size:20px;">Laborator</label><br>
    			<input type="radio" name="tipDisciplina" id="tipDisciplina" value="proiect"/><label style="font-size:20px;">Proiect</label><br>
    		</td>  	
    		<td><button type="submit" name="cauta" id="cauta" style="font-size:20px;">Cauta disciplina</button></td>
    		<td><br><br><br></td>	
    	</tr>
    	</table>	
    	<%	List<Disciplina> listaDiscipline=new ArrayList<Disciplina>();
    		if(request.getAttribute("listaDiscipline")!=null)
    			{
    				listaDiscipline=(ArrayList<Disciplina>)request.getAttribute("listaDiscipline"); 
    	%> 
    	<table>
    	<tr>
<!--     		<td>Id Disciplina</td> -->
<!--     		<td>Cod Disciplina</td> -->
    		<td style="font-size:20px;"><b>Denumire Disciplina</b></td>
    		<td style="font-size:20px;"><b>Tip disciplina</b></td>
    	</tr>
    	<tr>
    	<%for(Disciplina disciplina: listaDiscipline){ %>
 			<input type="hidden" name="id_disciplina" id="id_disciplina" value="<%=disciplina.getId_disciplina() %>" />
 			<input type="hidden" name="cod_disciplina" id="cod_disciplina" value="<%=disciplina.getCod_disciplina() %>"/>   
 			<td><input type="text" name="denumire_disciplina" id="denumire_disciplina" value="<%=disciplina.getDenumire_disciplina() %>" disabled size="30" style="font-size:20px;"/></td>
 			<td><input type="text" name="tip_disciplina" id="tip_disciplina" value="<%=disciplina.getTip_disciplina() %>" disabled size="10" style="font-size:20px;"/></td>
    	</tr>
    	<%}};%>
    </table>
    <table id="adaugareDisc" style="border:1px gray solid;" width="100%" align="center">
    	<tr>
    		<td style="font-size:20px;"><b>Adauga o disciplina pentru anul in curs</b></td>
    		<td><input type="text" name="an_univ" id="an_univ" value="2017-2018" disabled size="30" style="font-size:20px;"/></td>
    	</tr>
    	<tr>
    		<td style="font-size:20px;">Introdu denumirea disciplinei</td>
    		<td><input type="text" name="den_disc" id="den_disc" size="30" style="font-size:20px;"/></td>
    	</tr>
    	<tr>
    		<td style="font-size:20px;">Selecteaza specializarea</td>
    		<td> <%List<Specializare> listaSpecializari= PrelucrariDB.returnSpecializari(); %>
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
    		<td style="font-size:20px;">Selecteaza anul de studiu</td>
    		<td>
				<input type="radio" id="an_studiu" name="an_studiu" value="1"><label style="font-size:20px;">1</label>
				<input type="radio" id="an_studiu" name="an_studiu" value="2"><label style="font-size:20px;">2</label>
				<input type="radio" id="an_studiu" name="an_studiu" value="3"><label style="font-size:20px;">3</label>
			</td>
    	</tr>
    	<tr>
    		<td style="font-size:20px;">Selecteaza semestrul</td>
    		<td>
				<input type="radio" id="semestrul" name="semestrul" value="1"><label style="font-size:20px;">I</label>
				<input type="radio" id="semestrul" name="semestrul" value="2"><label style="font-size:20px;">II</label>
			</td>
    	</tr>
    	<tr>
    		<td style="font-size:20px;">Selecteaza tipul disciplinei</td>
    		<td><input type="radio" name="tip_disc" id="curs" value="curs" /><label style="font-size:20px;">Curs</label><br>
    			<input type="radio" name="tip_disc" id="seminar" value="seminar" /><label style="font-size:20px;">Seminar</label><br>
    			<input type="radio" name="tip_disc" id="laborator" value="laborator"/><label style="font-size:20px;">Laborator</label><br>
    			<input type="radio" name="tip_disc" id="proiect" value="proiect"/><label style="font-size:20px;">Proiect</label><br>
    		</td> 
    	</tr>
    	<tr>
    		<td colspan="2" align="center"><button type="button" name="adauga" id="adauga" style="font-size:20px;" onclick="showFunctionAdd()">Adauga disciplina</button></td>
    	</tr>
    	</table >
    	<div id="adaugareDisciplina" style="display: none;">
    	<table align="center" style="border:1px gray solid;" width="100%">
    		<tr>
    			<td colspan="2" style="font-size:20px;" align="center"><b>Finalizeaza adaugarea disciplinei</b></td></tr>
			<tr>
				<td style="font-size:20px;">Introdu numarul de credite</td>
				<td style="font-size:20px;"><input type="text" name="credite" id="credite" size=23 style="font-size:20px;" placeholder="Doar pentru CURS" disabled/></td>
			</tr>
				<tr>
    			<td style="font-size:20px;">Selecteaza titularul disciplinei</td>
    			<td> <%List<Profesor> listaprofesori= PrelucrariDB.returnProfesor(); %>
					<select name="profesor" id="profesor" style="font-size:20px;">
						<%for(Profesor profesor: listaprofesori){ %>
						<option value = "<%=profesor.getMarca()%>"> 
						<%=(profesor.getTitulatura()+" "+profesor.getNume()+" "+profesor.getPrenume())%>
						</option>
						<%}%>
					</select>
				</td>
			</tr>
			<tr><td colspan="2"><input type="hidden" name="tip" id="tip"/></td></tr>
			<tr><td colspan="2" align="center"><button type="submit" name="adaugaFinal" id="adaugaFinal" style="font-size:20px;">Finalizeaza adaugarea disciplinei</button></td></tr>
			</table>
    	</div>
    </form>
    </div></div>
    
 <script>
 function showFunctionAdd() {
	    var x = document.getElementById("adaugareDisciplina");
// 	    document.getElementById("adaugareDisc").disabled = true;
	    if (x.style.display === "none") {
	        x.style.display = "block";
	    }
	    if (document.getElementById("curs").checked) {
	    	  disc = document.getElementById("curs").value;
	    	  document.getElementById("tip").value=disc;
	    	  document.getElementById("credite").disabled = false;
	    }
	    
	    
	}
 </script>
</body>
</html>
package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import claseResurse.Departament;
import claseResurse.Profesor;
import database.PrelucrariDB;

/**
 * Servlet implementation class UpdateServletDep
 */
@WebServlet("/UpdateServletDep")
public class UpdateServletDep extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServletDep() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Departament depExistent=null;
		List<Profesor> listaProfesori=new ArrayList<Profesor>();
		String denumire_departament=null;
		String cod_departament;
		//prelucrari admin departamente
		if(request.getParameter("denumire_dep") != null && request.getParameter("denumire_dep")!="")
		{
			depExistent=PrelucrariDB.returnDepartamente(request.getParameter("denumire_dep"));
			if(depExistent!=null)
				request.setAttribute("exista","Departamenul exista deja" );
			else
			{
				PrelucrariDB.insertDepartament(request.getParameter("denumire_dep"));
				System.out.println("S-a inserat departamentul "+request.getParameter("denumire_dep"));
				request.getRequestDispatcher("departamente.jsp").forward(request,response);
			}
			
		}
		if(request.getParameter("sterge")!=null)
		{	
			PrelucrariDB.stergereDepartament(request.getParameter("sterge"));
			System.out.println("S-a sters departamentul "+request.getParameter("sterge"));
			request.getRequestDispatcher("departamente.jsp").forward(request,response);
		}
		if(request.getParameter("cod_dept")!=null)
		{	
			PrelucrariDB.actualizeazaDepartament(request.getParameter("cod_dept"), request.getParameter("denumire_departament"));
			System.out.println("S-a actualizat departamentul "+request.getParameter("cod_dept"));
			request.getRequestDispatcher("departamente.jsp").forward(request,response);
		}
		if(request.getParameter("vezi")!=null)
		{	
			if(request.getParameter("departament")!=null&&request.getParameter("departament")!="")
			{	 
				cod_departament=request.getParameter("departament");
				System.out.println("S-au afisat profesorii din departamentul cu codul: "+cod_departament);
				listaProfesori=PrelucrariDB.returnProfesor(Integer.parseInt(cod_departament));
				denumire_departament=PrelucrariDB.returnDepartamente(Integer.parseInt(cod_departament)).getDenumire_departament();
				request.setAttribute("departament", denumire_departament);
				request.setAttribute("listaProfesori", listaProfesori);
			}
			else
				request.setAttribute("inexistent", "Nu a fost selectat niciun departament!");
			System.out.println("S-au afisat profesorii din departamentul: "+denumire_departament);
			request.getRequestDispatcher("departamente.jsp").forward(request,response);
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		//prelucrari admin departamente
		if(request.getParameter("denumire_dep") != null && request.getParameter("denumire_dep")!="")
		{
			PrelucrariDB.insertDepartament(request.getParameter("denumire_dep"));
			System.out.println("S-a inserat departamentul "+request.getParameter("denumire_dep"));
			request.getRequestDispatcher("departamente.jsp").forward(request,response);
			
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
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

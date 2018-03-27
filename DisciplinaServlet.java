package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import claseResurse.Disciplina;
import database.PrelucrariDB;

/**
 * Servlet implementation class DisciplinaServlet
 */
@WebServlet("/DisciplinaServlet")
public class DisciplinaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisciplinaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<Disciplina> listaDiscipline=new ArrayList<Disciplina>();
		if(request.getParameter("cauta")!=null){
			listaDiscipline=PrelucrariDB.returnDiscipline(request.getParameter("tipDisciplina"));
			request.setAttribute("listaDiscipline", listaDiscipline);
			if(listaDiscipline.isEmpty())
				request.setAttribute("notFound", "Nu exista discipline care sa corespunda criteriilor de cautare!");
		}
//		if(request.getParameter("cauta")==null)
//		{
//			listaDiscipline=PrelucrariDB.returnDiscipline();
//			request.setAttribute("listaDiscipline", listaDiscipline);
//		}
		request.getRequestDispatcher("discipline.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

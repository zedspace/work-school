package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.PrelucrariDB;

/**
 * Servlet implementation class ContServlet
 */
@WebServlet("/ContServlet")
public class ContServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getParameter("adaugaCont")!=null)
		{
			if(request.getParameter("utilizator")!=null&&request.getParameter("parola")!=null&&request.getParameter("informatii")!=null){
				if(request.getParameter("tipCont")=="profesor")
				{
					PrelucrariDB.insertCont(request.getParameter("utilizator"), request.getParameter("parola"), request.getParameter("informatii"), "0", request.getParameter("profesor"));
					System.out.println("S-a creat cont pentru profesorul "+request.getParameter("profesor"));
				}
				else
				{	
					PrelucrariDB.insertCont(request.getParameter("utilizator"), request.getParameter("parola"), request.getParameter("informatii"),request.getParameter("student"), "0");
					System.out.println("S-a creat cont pentru studentul "+request.getParameter("student"));
				}	
			}
			else
				request.setAttribute("incomplet", "Toate campurile sunt obligatorii");
			request.getRequestDispatcher("conturi.jsp").forward(request,response);
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

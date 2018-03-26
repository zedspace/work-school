package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.PrelucrariDB;

/**
 * Servlet implementation class UpdateServletAn
 */
@WebServlet("/UpdateServletAn")
public class UpdateServletAn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServletAn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getParameter("denumire_an") != null && request.getParameter("denumire_an")!="" && request.getParameter("semestrul") != null && request.getParameter("semestrul")!="")
		{
			PrelucrariDB.insertAn(request.getParameter("denumire_an"), request.getParameter("semestrul"));
			System.out.println("S-a inserat anul "+request.getParameter("denumire_an")+" semestrul "+request.getParameter("semestrul"));
			
		}
		request.getRequestDispatcher("ani_universitari.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

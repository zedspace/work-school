package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.Securitate;
/**
 * Servlet implementation class ConnectionServlet
 */
@WebServlet("/ConnectionServlet")
public class ConnectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String nume=request.getParameter("nume");
		String parola=request.getParameter("parola");
		//verificare user si parola introduse
		if(Securitate.tipUser(nume,parola).equals("a"))
			request.getRequestDispatcher("admin.jsp").forward(request,response);
		else 
			if(Securitate.tipUser(nume,parola).equals("p"))
				request.getRequestDispatcher("profesor.jsp").forward(request,response);
			else
				if(Securitate.tipUser(nume,parola).equals("s"))
					request.getRequestDispatcher("student.jsp").forward(request,response);
				else
					request.getRequestDispatcher("PaginaPrincipala.jsp").forward(request,response);
					
		System.out.println("Utilizatorul a introdus: "+nume+" "+parola);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

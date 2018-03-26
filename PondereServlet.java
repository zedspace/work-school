package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import claseResurse.Grupa;
import database.ConexiuneDB;
import database.PrelucrariDB;

/**
 * Servlet implementation class PondereServlet
 */
@WebServlet("/PondereServlet")
public class PondereServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PondereServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
			
			if(request.getParameter("profesor") != null)
			{
				int profesor =Integer.parseInt(request.getParameter("profesor"));
				int specializare = Integer.parseInt((String)request.getParameter("specializare"));
		    int an_studiu =Integer.parseInt(request.getParameter("an_studiu"));  
		    int grupa =Integer.parseInt(request.getParameter("grupa"));
		    int disciplina = Integer.parseInt(request.getParameter("disciplina"));
		    int pondere = Integer.parseInt(request.getParameter("pondere"));
		    int total=0;
		    Connection con=ConexiuneDB.conectare();		
			try{
				if(con!=null){
				PreparedStatement stmt= con.prepareStatement("select * from stabileste_pondere"
															+" where disciplina_id_disciplina=?");
				stmt.setInt(1,disciplina);
				ResultSet rs=stmt.executeQuery(); 
				while(rs.next())  
				{	
					total=total+rs.getInt("pondere");		
				}
				ConexiuneDB.closeResources(con, rs, stmt);
				}				
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}	
			if(total<100)
			{	PrelucrariDB.insertPondere(profesor, disciplina, grupa, pondere);
				response.sendRedirect("ponderiStabilite.jsp");}
			else
				response.sendRedirect("pondereDepasita.jsp"); 
			}
			else
				response.sendRedirect("ponderiStabilite.jsp");
			}
			
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

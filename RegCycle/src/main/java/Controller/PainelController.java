package Controller;

import java.io.IOException;

import Model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PainelController")
public class PainelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null && session.isNew()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");

			request.setAttribute("sessaoexpirou", true);

			dispatcher.forward(request, response);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/painel.jsp");

		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

//	public void somarVendas(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		HttpSession session = request.getSession(false);
//		Usuario usuario = (Usuario) session.getAttribute("usuario");
//		
//		for(int i = 0; i < usuario.getVendas(); i++) {
//			
//		}
//	}

}

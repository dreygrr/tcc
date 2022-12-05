package Controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import Model.RegCycleDAO;
import Model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ExcluirMetasController")
public class ExcluirMetasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RegCycleDAO regcycleDAO;

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("regcycle-jpa");
	
	@Override
	public void init() throws ServletException {
		regcycleDAO = new RegCycleDAO(emf);
	}
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("meta_id"));
		
		HttpSession session = request.getSession(false);
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		
		
		boolean concluiu = regcycleDAO.excluirMeta(id, usuario.getUsername());
		
		if (concluiu) {
			Usuario novoUsuario = regcycleDAO.encontrarUsuario(usuario.getUsername());
			session.setAttribute("usuario", novoUsuario);
		}
		
		response.sendRedirect("PainelController");
	}
	
	
}

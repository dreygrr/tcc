package Controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import Model.RegCycleDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CadastroController")
public class CadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RegCycleDAO regcycleDAO;

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("regcycle-jpa");

	@Override
	public void init() throws ServletException {
		regcycleDAO = new RegCycleDAO(emf);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nomeCompleto = request.getParameter("nomeCampo");
		String username = request.getParameter("usernameCampo");
		String senha = request.getParameter("senhaCampo");
		String confSenha = request.getParameter("confirmarSenhaCampo");
		String telefone = request.getParameter("telefoneCampo");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		
		boolean inseriu;
		
		if(!confSenha.equals(senha)) {
			inseriu = false;
			
			dispatcher = request.getRequestDispatcher("/cadastro.jsp");
			
			request.setAttribute("status", inseriu);
			dispatcher.forward(request, response);
			
			return;
		}
		
		inseriu = regcycleDAO.inserirUsuario(username, nomeCompleto, senha, telefone);

		request.setAttribute("operacao", "cadastrada");
		
		dispatcher.forward(request, response);
	
	}
}
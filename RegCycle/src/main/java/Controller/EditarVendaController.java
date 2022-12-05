package Controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import Model.RegCycleDAO;
import Model.Usuario;
import Model.Venda;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditarVendaController")
public class EditarVendaController extends HttpServlet {
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
		int id = Integer.parseInt(request.getParameter("venda_id"));

		Venda vendaBanco = regcycleDAO.procurarVenda(id);

		request.setAttribute("venda", vendaBanco);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/editar_venda.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("venda_id"));
		
		String descricao = request.getParameter("descCampo");
		int quantidade = Integer.parseInt(request.getParameter("qtdCampo"));
		float valor = Float.parseFloat(request.getParameter("valorCampo"));
		LocalDate data = LocalDate.parse(request.getParameter("dataCampo"));
		
		HttpSession session = request.getSession(false);
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		boolean atualizou = regcycleDAO.modificarVenda(id,descricao, quantidade, valor, data, usuario.getUsername());

		
		
		if (atualizou) {
			Usuario novoUsuario = regcycleDAO.encontrarUsuario(usuario.getUsername());
			session.setAttribute("usuario", novoUsuario);
		}
		
		response.sendRedirect("painel.jsp");
	}
	
}

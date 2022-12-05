package Controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import Model.Meta;
import Model.RegCycleDAO;
import Model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditarMetaController")
public class EditarMetaController extends HttpServlet {
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
		int id = Integer.parseInt(request.getParameter("meta_id"));

		Meta metaBanco = regcycleDAO.procurarMeta(id);

		request.setAttribute("meta", metaBanco);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/editar_meta.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("meta_id"));
		
		String descricao = request.getParameter("descCampo");
		float valor_meta = Float.parseFloat(request.getParameter("valorCampo"));
		LocalDate data_inicial = LocalDate.parse(request.getParameter("dataInicialCampo"));
		LocalDate data_final = LocalDate.parse(request.getParameter("dataFinalCampo"));
		
		HttpSession session = request.getSession(false);
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		boolean atualizou = regcycleDAO.modificarMeta(id,descricao, valor_meta, data_inicial, data_final, usuario.getUsername());

		
		
		if (atualizou) {
			Usuario novoUsuario = regcycleDAO.encontrarUsuario(usuario.getUsername());
			session.setAttribute("usuario", novoUsuario);
		}
		
		
		response.sendRedirect("painel.jsp");
	}
	
}

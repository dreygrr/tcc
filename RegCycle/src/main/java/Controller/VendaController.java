package Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

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

@WebServlet("/VendaController")
public class VendaController extends HttpServlet {
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

		List<Venda> listaVendas = regcycleDAO.consultarVendas();

		request.setAttribute("vendasBanco", listaVendas);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/painel.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String operacao = request.getParameter("operacao");
		operacao = operacao.toLowerCase();

		switch (operacao) {
		case "registrar":
			cadastrarVenda(request, response);
			break;
		case "remover":
			removerVenda(request, response);
			break;
		}

	}

	private void cadastrarVenda(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		LocalDate data = LocalDate.parse(request.getParameter("dataCampo")); 
		String local = request.getParameter("localCampo");
		int quantidade = Integer.parseInt(request.getParameter("qtdCampo")); 
		float valor = Float.parseFloat(request.getParameter("valorCampo"));
		String descricao = request.getParameter("descCampo");
		
		Venda venda = new Venda(data, local, quantidade, valor, descricao);
		HttpSession session = request.getSession(false);
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		
		boolean inseriu = regcycleDAO.inserirVenda(venda, usuario.getUsername());
		
		if (inseriu)
			usuario.getVendas().add(venda);
		
		session.setAttribute("usuario", usuario);

		request.setAttribute("status", inseriu); 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/form_venda.jsp");
		dispatcher.forward(request, response);	
	}
	
	private void removerVenda (HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession(false);
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		boolean excluiu = regcycleDAO.excluirVenda(id, usuario.getUsername());
		
		request.setAttribute("status", excluiu);
		request.setAttribute("operacao", "removida");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/excluir_status.jsp");
		dispatcher.forward(request, response);
		
	}
}

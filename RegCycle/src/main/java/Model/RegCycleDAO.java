package Model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class RegCycleDAO {
	private EntityManagerFactory emf;

	public RegCycleDAO(EntityManagerFactory emf) {
		super();
		this.emf = emf;
	}

	public boolean inserirUsuario(String username, String nomeCompleto, String senha, String telefone) {
		EntityManager em = emf.createEntityManager();

		try {
			Usuario usuario = new Usuario(username, nomeCompleto, telefone, senha);
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();

			return true;
		}

		catch (Exception e) {
			return false;
		}
	}

	public Usuario encontrarUsuario(String username) {
		EntityManager em = emf.createEntityManager();
		Usuario usuario = null;

		try {
			usuario = em.find(Usuario.class, username);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return usuario;
	}

	public boolean inserirVenda(Venda venda, String username) {

		EntityManager em = emf.createEntityManager();

		try {
			Usuario usuario = em.find(Usuario.class, username);
			usuario.getVendas().add(venda);
			em.getTransaction().begin();
			em.merge(usuario);
			em.getTransaction().commit();

			return true;
		}

		catch (Exception e) {
			return false;
		}

	}

	public boolean inserirMeta(Meta meta, String username) {
		EntityManager em = emf.createEntityManager();

		try {
			Usuario usuario = em.find(Usuario.class, username);

			usuario.getMetas().add(meta);

			em.getTransaction().begin();
			em.persist(meta);
			em.merge(usuario);
			em.getTransaction().commit();
			
			
			return true;
		}

		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Venda> consultarVendas() {
		List<Venda> listaVendas = new ArrayList<>();
		EntityManager em = emf.createEntityManager();

		try {
			listaVendas = em.createQuery("from " + Venda.class.getName()).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return listaVendas;
	}


	public boolean concluirMeta(int id, String username) {
		EntityManager em = emf.createEntityManager();

		try {

			Meta meta = em.find(Meta.class, id);

			meta.setStatus(1);
			em.getTransaction().begin();
			em.merge(meta);
			em.getTransaction().commit();

			return true;
		}

		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Meta procurarMeta(int id) {
		EntityManager em = emf.createEntityManager();
		Meta meta = null; 
		
		try {
			meta = em.find(Meta.class, id);
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		return meta; 
	}
	
	public boolean modificarMeta(int id,String descricao, float valor_meta, LocalDate data_inicial, LocalDate data_final, String username) {
		EntityManager em = emf.createEntityManager(); 
		
		System.out.println(id);
		
		try {
			Usuario usuario = em.find(Usuario.class, username);
			Meta meta = em.find(Meta.class, id);

				meta.setDescricao(descricao);
				meta.setValor_meta(valor_meta);
				meta.setData_inicial(data_inicial);
				meta.setData_final(data_final);
				
				em.getTransaction().begin();
				em.merge(meta); 
				em.getTransaction().commit();
				

				return true;
				
		}
		catch(Exception e) {
			e.printStackTrace(); 
			return false; 
		}
	}
	
	public Venda procurarVenda(int id) {
		EntityManager em = emf.createEntityManager();
		Venda venda = null;
		
		try {
			venda = em.find(Venda.class, id);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return venda;
	}
	
	public boolean modificarVenda(int id,String descricao, int quantidade, float valor, LocalDate data, String username) {
		EntityManager em = emf.createEntityManager(); 
		
		System.out.println(id);
		
		try {
			Usuario usuario = em.find(Usuario.class, username);
			Venda venda = em.find(Venda.class, id);

				venda.setDescricao(descricao);
				venda.setQuantidade(quantidade);
				venda.setValor_venda(valor);
				venda.setData(data);
				
				em.getTransaction().begin();
				em.merge(venda); 
				em.getTransaction().commit();
				

				return true;
				
		}
		catch(Exception e) {
			e.printStackTrace(); 
			return false; 
		}
	}
	

	public boolean excluirVenda(int id, String username) {
		EntityManager em = emf.createEntityManager();

		try {
			Usuario usuario = em.find(Usuario.class, username);
			Venda venda = em.find(Venda.class, id);

			usuario.getVendas().remove(venda);
			
					em.getTransaction().begin();
					em.remove(venda);
					em.getTransaction().commit();

					return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			em.close();
		}
	}
	
	public boolean excluirMeta(int id, String username) {
		EntityManager em = emf.createEntityManager();
		
		try {
			Usuario usuario = em.find(Usuario.class, username);
			Meta meta = em.find(Meta.class, id);
			
			usuario.getMetas().remove(meta);
			
			em.getTransaction().begin();
			em.remove(meta);
			em.getTransaction().commit();
			
			return true;
		
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}

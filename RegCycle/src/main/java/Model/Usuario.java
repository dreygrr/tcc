package Model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Usuario {
	@Id
	private String username;
	private String nomeCompleto;
	private String telefone;
	private String senha;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "usuario_id")
	private List<Venda> vendas;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "usuario_id")
	private List<Meta> metas; 
	
	
	
	public List<Meta> getMetas() {
		return metas;
	}


	public void setMetas(List<Meta> metas) {
		this.metas = metas;
	}


	public Usuario() {
		super();
	}


	public Usuario(String username, String senha) {
		super();
		this.username = username;
		this.senha = senha;
	}

	public Usuario(String username, String nomeCompleto,  String telefone,  String senha) {
		super();
		this.nomeCompleto = nomeCompleto;
		this.username = username;
		this.telefone = telefone;
		this.senha = senha;
	}
	
	
	public String getNomeCompleto() {
		return nomeCompleto;
	}


	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}


	public String getTelefone() {
		return telefone;
	}


	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getSenha() {
		return senha;
	}


	public void setSenha(String senha) {
		this.senha = senha;
	}


	public List<Venda> getVendas() {
		return vendas;
	}


	public void setVendas(List<Venda> vendas) {
		this.vendas = vendas;
	}
	
	
}

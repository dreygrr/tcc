package Model;


import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Venda {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id; 
	
	private LocalDate data; 
	private String local; 
	private int quantidade; 
	private float valor_venda; 
	private String descricao;
	
	public Venda() {
		super();
	}

	public Venda(LocalDate data, String local, int quantidade, float valor_venda, String descricao) {
		super();
		this.data = data;
		this.local = local;
		this.quantidade = quantidade;
		this.valor_venda = valor_venda;
		this.descricao = descricao;
	}

	public Venda(int id, LocalDate data, String local, int quantidade, float valor_venda, String descricao) {
		super();
		this.id = id;
		this.data = data;
		this.local = local;
		this.quantidade = quantidade;
		this.valor_venda = valor_venda;
		this.descricao = descricao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public float getValor_venda() {
		return valor_venda;
	}

	public void setValor_venda(float valor_venda) {
		this.valor_venda = valor_venda;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	} 
	
	
	
	
	
	
}

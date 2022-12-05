package Model;

import java.time.LocalDate;
import java.time.Period;

import javax.persistence.Entity;
import javax.persistence.Id;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Meta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String descricao; 
	private float valor_meta; 
	private LocalDate data_inicial; 
	private LocalDate data_final;
	private int status;
	
	public Meta() {
		super();
	}
	
	public Meta(String descricao, float valor_meta, LocalDate data_inicial, LocalDate data_final, int status) {
		super();
		this.descricao = descricao;
		this.valor_meta = valor_meta;
		this.data_inicial = data_inicial;
		this.data_final = data_final;
		this.status = status;
	}
	
	

	public Meta(String descricao, float valor_meta, LocalDate data_inicial, LocalDate data_final) {
		super();
		this.descricao = descricao;
		this.valor_meta = valor_meta;
		this.data_inicial = data_inicial;
		this.data_final = data_final;
	}

	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
	
	public boolean expirada() {
		return Period.between(LocalDate.now(), data_final).isNegative();
	}
	
	public boolean quaseExpirada() {
		Period period = Period.between(LocalDate.now(), data_final);
		
		int dias = period.getDays() + period.getMonths() * 30;
		
		return dias <= 7;
	}
	
	
	
	public float getValor_meta() {
		return valor_meta;
	}
	
	public void setValor_meta(float valor_meta) {
		this.valor_meta = valor_meta;
	}
	
	public LocalDate getData_inicial() {
		return data_inicial;
	}
	
	public void setData_inicial(LocalDate data_inicial) {
		this.data_inicial = data_inicial;
	}
	
	public LocalDate getData_final() {
		return data_final;
	}
	
	public void setData_final(LocalDate data_final) {
		this.data_final = data_final;
	} 
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status; 
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}

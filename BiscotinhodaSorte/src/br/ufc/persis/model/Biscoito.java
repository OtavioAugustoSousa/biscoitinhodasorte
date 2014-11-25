package br.ufc.persis.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Biscoito{
	
	@Id
	@GeneratedValue
	private long id;
	private String frase;
	public String getFrase() {
		return frase;
	}
	public void setFrase(String frase) {
		this.frase = frase;
	}
	public long getId() {
		return id;
	}
	
	

	
}

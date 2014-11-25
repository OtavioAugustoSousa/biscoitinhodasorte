package br.ufc.persis.dao;

import br.ufc.persis.model.Biscoito;


public class BiscoitoJPADAO extends GenericJPADAO<Biscoito> implements BiscoitoDAO {

	public BiscoitoJPADAO() {
		this.persistentClass = Biscoito.class;
	}
	
}

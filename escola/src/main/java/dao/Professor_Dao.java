package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

import model.Professor_Model;

public class Professor_Dao {

	private EntityManagerFactory produtorDeEntidades = Persistence.createEntityManagerFactory("exemplo-jpa");

	private EntityManager gerenciadorEntidades;

	public Professor_Dao() {

		gerenciadorEntidades = produtorDeEntidades.createEntityManager();

	}

	public void adicionaProfessor(Professor_Model professorModel) {

		gerenciadorEntidades.getTransaction().begin();
		gerenciadorEntidades.persist(professorModel);
		gerenciadorEntidades.getTransaction().commit();

	}

	public void atualizaProfessor(Integer id, String nome, String especialidade, String data_admissao) {

		Professor_Model professorModel = acharPorId(id);

		gerenciadorEntidades.getTransaction().begin();
		professorModel.setNome(nome);
		professorModel.setEspecialidade(especialidade);
		professorModel.setData(data_admissao);
		gerenciadorEntidades.getTransaction().commit();

	}

	public Professor_Model acharPorId(Integer id) {

		return gerenciadorEntidades.find(Professor_Model.class, id);

	}

	public List<Professor_Model> listarProfessores() {

		try {

			return gerenciadorEntidades.createQuery("SELECT p FROM Professor_Model p", Professor_Model.class).getResultList();

		} catch (NoResultException e) {
			throw new EntityNotFoundException("Nenhum país encontrado.");

		}
	}
	
	
	public void removerProfessor(Professor_Model professorModel) {
		
		
		gerenciadorEntidades.getTransaction().begin();
		professorModel = gerenciadorEntidades.merge(professorModel);
		gerenciadorEntidades.remove(professorModel);
		gerenciadorEntidades.getTransaction().commit();
		
	}
	
	public void fechar() {
		
		gerenciadorEntidades.close();
		produtorDeEntidades.close();
		
	}

}

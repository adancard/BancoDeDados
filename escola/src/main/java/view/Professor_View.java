package view;

import java.util.List;

import model.Professor_Model;

public class Professor_View {

	public void exibirProfessor(Professor_Model professorModel) {

		System.out.println(
				"ID: " + professorModel.getId() + "\nNome do Professor: " + professorModel.getNome() + " \nEspecialidade: "
						+ professorModel.getEspecialidade() + "\nData de Admissao: " + professorModel.getData());

	}
	
	public void exibirProfessores(List<Professor_Model> professores) {
		
		System.out.println("====== Lista de Professores ======");
		
		for(Professor_Model professorModel : professores) {
			
			exibirProfessor(professorModel);
		
			System.out.println("-----------------");
			
		}
		
		
	}

}

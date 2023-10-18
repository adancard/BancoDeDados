package controller;

import java.util.Scanner;

import dao.Professor_Dao;
import model.Professor_Model;
import view.Professor_View;

public class Professor_Controller {

	private Professor_Dao professorDao;
	private Professor_View professorView;

	public Professor_Controller() {

		professorDao = new Professor_Dao();
		professorView = new Professor_View();

	}

	public void adicionarProfessor(String nome, String especialidade, String data) {

		Professor_Model professorModel = new Professor_Model(nome, especialidade, data);

		professorDao.adicionaProfessor(professorModel);

	}

	public void atualizarProfessor(Integer id, String nome, String especialidade, String data) {

		professorDao.atualizaProfessor(id, nome, especialidade, data);

	}

	public void removerProfessor(Integer id) {

		Professor_Model professorModel = professorDao.acharPorId(id);

		professorDao.removerProfessor(professorModel);

	}

	public void listarProfessores() {

		professorView.exibirProfessores(professorDao.listarProfessores());

	}

	public void menu() {

		Scanner scanner = new Scanner(System.in);

		int opcao = -1;

		while (opcao != 0) {

			// Menu da nossa aplicação
			System.out.println("==== Menu ====");
			System.out.println("1. Adicionar Professor");
			System.out.println("2. Listar Professor");
			System.out.println("3. Remover Professor da lista");
			System.out.println("4. Atualizar Professor");
			System.out.println("0. Sair");
			System.out.print("Escolha uma opcao: ");

			try {

				opcao = scanner.nextInt();

				switch (opcao) {

				case 1:
					System.out.print("Digite o nome do Professor: ");
					scanner.nextLine();
					String nome = scanner.nextLine();

					System.out.print("Digite a Especialidade do Professor " + nome + ":");
					String especialidade = scanner.nextLine();

					System.out.println("Digite a Data de Admissao do Professor " + nome + ":");
					String data = scanner.next();

					adicionarProfessor(nome, especialidade, data);

					break;

				case 2:
					listarProfessores();
					break;

				case 3:
					System.out.println("Digite o ID do Professor a ser removido: ");

					Integer idProfessorRemover = scanner.nextInt();

					removerProfessor(idProfessorRemover);
					break;

				case 4:
					System.out.println("Digite o ID do Professor que deseja atualizar: ");
					Integer idProfessorAtualizar = scanner.nextInt();

					System.out.print("Digite o nome do Professor: ");
					scanner.nextLine();
					nome = scanner.nextLine();

					System.out.print("Digite a Especialidade do Professor " + nome + ":");
					especialidade = scanner.nextLine();

					System.out.println("Digite a Data de Admissao do Professor " + nome + ":");
					data = scanner.next();

					atualizarProfessor(idProfessorAtualizar, nome, especialidade, data);

					break;

				case 0:
					System.out.println("Saindo...");
					break;

				default:
					System.out.println("Opcao inválida.");
					break;
				}
			} catch (java.util.InputMismatchException e) {
				System.out.println("Opcao invalida. Por favor, digite um numero inteiro valido.");
				scanner.nextLine();
			}
		}

		scanner.close();
	}

}

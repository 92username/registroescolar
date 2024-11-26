import 'dart:io';

void main() {
  // Lists to store students and grades
  List<String> alunos = [];
  List<List<double>> notas = [];

  while (true) {
    print('\n=== MENU PRINCIPAL ===');
    print('1 - Registrar aluno');
    print('2 - Ver lista de alunos');
    print('3 - Sair do programa');
    print('Digite sua opção: ');

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        registrarAluno(alunos, notas);
        break;
      case '2':
        exibirAlunos(alunos, notas);
        break;
      case '3':
        print('Programa encerrado.');
        exit(0);
      default:
        print('Opção inválida!');
    }
  }
}

// Cria uma função com duas atividades: registrar aluno e registrar nota.
// Essa função deve aceitar várias notas e encerrar a operação com um comando como 'fim'
void registrarAluno(List<String> alunos, List<List<double>> notas) {
  // Variável para armazenar o nome do aluno
  String? nomeAluno;

  // Solicita ao usuário o nome do aluno
  print('Digite o nome do aluno:');
  nomeAluno = stdin.readLineSync();
  if (nomeAluno != null && nomeAluno.isNotEmpty) {
    // Adiciona o nome do aluno na lista de alunos
    alunos.add(nomeAluno);
  } else {
    // Exibe uma mensagem de erro se o nome do aluno for vazio
    print('Nome do aluno não pode ser vazio.');
    return;
  }

  // Adiciona uma nova lista de notas para o aluno na lista de notas
  notas.add([]);

  // Solicita as 3 notas do aluno
  for (int i = 0; i < 3; i++) {
    print(
        'Digite a ${i + 1}ª nota do aluno $nomeAluno (ou "fim" para encerrar):');
    String? notaAlunoInput = stdin.readLineSync();

    if (notaAlunoInput?.toLowerCase() == 'fim') {
      print('Encerrando o programa.');
      exit(0);
    }

    if (notaAlunoInput != null && notaAlunoInput.isNotEmpty) {
      try {
        double notaAluno = double.parse(notaAlunoInput);
        notas[alunos.length - 1].add(notaAluno);
      } catch (e) {
        print('Nota inválida. Digite um número válido.');
        // Remove o aluno e suas notas se houver erro
        alunos.removeLast();
        notas.removeLast();
        return;
      }
    } else {
      print('Nota inválida.');
      // Remove o aluno e suas notas se houver erro
      alunos.removeLast();
      notas.removeLast();
      return;
    }
  }
}

/* Declare a função que vai fazer o cálculo de média da nota 
escolar e chame-a abaixo. Lembre-se de que o cálculo deve ser 
feito com as notas registradas na função registrarAluno. */

// Função para calcular a média das notas de um aluno
double calcularMedia(List<double> notas) {
  // Variável para armazenar a soma das notas
  double soma = 0;
  // Loop para somar todas as notas
  for (double nota in notas) {
    soma += nota;
  }
  // Calcula a média das notas
  double media = soma / notas.length;
  return media;
}

void exibirAlunos(List<String> alunos, List<List<double>> notas) {
  if (alunos.isEmpty) {
    print('\nNenhum aluno registrado.');
    return;
  }

  print('\n=== ALUNOS REGISTRADOS ===');
  for (int i = 0; i < alunos.length; i++) {
    print('\nAluno: ${alunos[i]}');
    print('Notas: ${notas[i]}');
    print('Média: ${calcularMedia(notas[i]).toStringAsFixed(2)}');
  }
}

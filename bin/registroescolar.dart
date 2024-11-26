import 'dart:io';

void main() {
  // Lista para armazenar os nomes dos alunos
  List<String> alunos = [];
  // Lista para armazenar as notas dos alunos
  List<List<double>> notas = [];

  // Chama a função para registrar alunos e notas
  registrarAluno(alunos, notas);
  // chama a funçao para exibir a media do aluno calculada na funçao calcularMedia
  print(
      'A média do aluno ${alunos[0]} é: ${calcularMedia(notas[0]).toStringAsFixed(2)}');
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
  // Solicita ao usuário a quantidade de notas que o aluno terá
  print(
      'Quantas notas o aluno $nomeAluno terá? (Ou digite "fim" para encerrar o programa)');
  String? quantidadeNotasInput = stdin.readLineSync();
  if (quantidadeNotasInput != null && quantidadeNotasInput.isNotEmpty) {
    if (quantidadeNotasInput.toLowerCase() == 'fim') {
      print('Encerrando o programa.');
      exit(0);
    }
    int quantidadeNotas = int.parse(quantidadeNotasInput);
    // Adiciona as notas do aluno na lista de notas
    for (int i = 0; i < quantidadeNotas; i++) {
      // Solicita ao usuário a nota do aluno
      print('Digite a ${i + 1}ª nota do aluno $nomeAluno:');
      String? notaAlunoInput = stdin.readLineSync();
      if (notaAlunoInput != null && notaAlunoInput.isNotEmpty) {
        // Converte a nota para double e adiciona na lista de notas do aluno
        double notaAluno = double.parse(notaAlunoInput);
        notas[alunos.length - 1].add(notaAluno);
      } else {
        // Exibe uma mensagem de erro se a nota for inválida
        print('Nota inválida.');
        return;
      }
    }
  } else {
    // Exibe uma mensagem de erro se a quantidade de notas for inválida
    print('Quantidade de notas inválida.');
    return;
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

class AlunoEntity {
  String? id;
  String? nome;
  String? email;
  int? idade;

  // Construtor.
  AlunoEntity({
    this.id,
    this.nome,
    this.email,
    this.idade,
  });

  // Converte map em objeto Aluno.
  static AlunoEntity mapToEntity(Map<String, dynamic> map) {
    return AlunoEntity(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      idade: map['idade'] ?? '',
    );
  }
}

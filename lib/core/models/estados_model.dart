class EstadosModel {
  int id;
  String sigla;
  String nome;
  Regiao regiao;

  EstadosModel({this.id, this.sigla, this.nome, this.regiao});

  EstadosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
    regiao =
        json['regiao'] != null ? new Regiao.fromJson(json['regiao']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sigla'] = this.sigla;
    data['nome'] = this.nome;
    if (this.regiao != null) {
      data['regiao'] = this.regiao.toJson();
    }
    return data;
  }
}

class Regiao {
  int id;
  String sigla;
  String nome;

  Regiao({this.id, this.sigla, this.nome});

  Regiao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sigla'] = this.sigla;
    data['nome'] = this.nome;
    return data;
  }
}

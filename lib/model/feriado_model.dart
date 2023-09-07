class Feriado {
  String? date;
  String? name;
  String? type;

  // Construtor.
  Feriado({this.date, this.name, this.type});

  // Transforma json em objeto Feriado.
  Feriado.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    type = json['type'];
  }

  // Transforma objeto Feriado em json.
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

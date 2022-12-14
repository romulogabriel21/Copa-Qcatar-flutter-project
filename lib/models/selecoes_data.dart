class SelecoesData {
  int? id;
  String? name;

  SelecoesData({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  factory SelecoesData.fromMap(Map<String, dynamic> map) {
    return SelecoesData(
      id: map['id'],
      name: map['name'],
    );
  }

  factory SelecoesData.fromJson(Map<String, dynamic> json) {
    return SelecoesData(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

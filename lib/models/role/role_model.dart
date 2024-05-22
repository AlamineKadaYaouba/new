class Role {
  String? id;
  String? name;
  String? level;
  List<String>? capacities;

  Role({this.id, this.name, this.level, required this.capacities});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
    capacities = json["capacities"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['level'] = level;
    data['level'] = capacities;
    return data;
  }
}

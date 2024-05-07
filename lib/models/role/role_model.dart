class Role {
  String? id;
  String? name;
  String? level;

  Role({this.id, this.name, this.level});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['level'] = level;
    return data;
  }
}

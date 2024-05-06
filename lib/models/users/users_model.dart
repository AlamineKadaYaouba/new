class Users {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? signature;
  List<String>? capacity;
  List<String>? rolesId;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.signature,
      this.capacity,
      this.rolesId});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    signature = json['signature'];
    capacity = json['capacity'].cast<String>();
    rolesId = json['rolesId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['signature'] = signature;
    data['capacity'] = capacity;
    data['rolesId'] = rolesId;
    return data;
  }
}

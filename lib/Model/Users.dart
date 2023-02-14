class Users {
  int id;
  String email;
  String password;
  String name;
  String phoneNo;

//constructor
  Users({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phoneNo,
  });

  Users.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    password = map['password'];
    name = map['name'];
    phoneNo = map['phoneNo'];
  }

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phoneNo': phoneNo,
    };
  }
}

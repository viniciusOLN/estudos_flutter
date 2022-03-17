class User {
  int id;
  String username;
  String password;
  bool activated;

  User({
    this.id,
    this.username,
    this.password,
    this.activated,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['activated'] = this.activated;

    return data;
  }
}

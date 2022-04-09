class User {
  int id;
  String username;
  String password;
  String fullname;
  bool activated;
  String image;

  User({
    this.id,
    this.username,
    this.password,
    this.activated,
    this.fullname,
    this.image,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    activated = json['activated'];
    fullname = json['fullname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['activated'] = this.activated;
    data['fullname'] = this.fullname;
    data['image'] = this.image;

    return data;
  }
}

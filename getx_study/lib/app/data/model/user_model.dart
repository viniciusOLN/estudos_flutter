class User {
  int id;
  String fullname;
  String username;
  bool image;
  bool activated;

  User({
    this.id,
    this.fullname,
    this.username,
    this.image,
    this.activated,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    image = json['image'];
    activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['image'] = this.image;
    data['activated'] = this.activated;

    return data;
  }
}

class Employee {
  int id;
  String firstName;
  int companyId;
  int userId;

  Employee({this.id, this.firstName, this.companyId, this.userId});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    companyId = json['company_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['company_id'] = this.companyId;
    data['user_id'] = this.userId;
    return data;
  }
}

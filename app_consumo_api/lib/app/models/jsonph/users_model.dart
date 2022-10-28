class JsonUsersModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  String? phone;

  JsonUsersModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.phone,
  });

  factory JsonUsersModel.fromJson(Map<String, dynamic> json) {
    return JsonUsersModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      street: json['address']['street'],
      suite: json['address']['suite'],
      city: json['address']['city'],
      zipcode: json['address']['zipcode'],
      phone: json['phone'],
    );
  }
}

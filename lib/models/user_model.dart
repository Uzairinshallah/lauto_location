class UserModel {
  late String id;
  late String userName;
  late String phone;
  late String city;

  UserModel({
    required this.id,
    required this.userName,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'city': city,
      'phone': phone,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userName = map["userName"];
    city = map["city"];
    phone = map["phone"];
  }
}

class AgencyModel {
  late String id;
  late String name;
  late String phone;
  late String city;

  AgencyModel({
    required this.id,
    required this.name,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'phone': phone,
    };
  }

  AgencyModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    city = map["city"];
    phone = map["phone"];
  }
}

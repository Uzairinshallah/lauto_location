class CarModel {
  late String id;
  late String name;
  late String model;
  late String city;
  late String price;
  late String description;
  late String category;

  CarModel({
    required this.id,
    required this.name,
    required this.model,
    required this.city,
    required this.price,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'city': city,
      'price': price,
      'description': description,
      'category': category,
    };
  }

  CarModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    city = map["city"];
    model = map["model"];
    price = map["price"];
    description = map["description"];
    category = map["category"];
  }
}

class Product{
  late int? id, amount, price;
  late String? name, description, image;

  Product({
    required this.id,
    required this.name,
    required this.amount,
    required this.price,
    required this.description,
    required this.image
  });

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    price = json['Price'];
    description = json['description'];
    image = json['img_link'];
  }
}
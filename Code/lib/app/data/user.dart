class User{
  late int? id;
  late String? name, email, password, phone, address, avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.avatar
  });

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['SDT'];
    address = json['Address'];
    avatar = json['avatar'];
  } 
}
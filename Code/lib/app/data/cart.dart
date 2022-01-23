class Cart{
  late String? address;
  late int? accept;
  late List? listID, listAmount;

  Cart({
    required this.address,
    required this.accept,
    required this.listID,
    required this.listAmount
  });

  Cart.fromJson(Map<String, dynamic> json){
    address = json['address'];
    accept = json['accept'];
    listID = json['IDSanPham'];
    listAmount = json['SLSanPham'];
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/cart.dart';
import 'package:shop_multilevel/app/data/product.dart';
import 'package:shop_multilevel/app/data/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpMethods{
  static const String baseUrl = 'https://quanlybanhangapi.herokuapp.com';
  static Future<User> userLogin(String email, String password) async{
    final response = await http.post(
      Uri.parse(baseUrl + '/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      })
    );
    return User.fromJson(jsonDecode(response.body));
  }

  static List<Product> parseProduct(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Product> listProduct = list.map((model) => Product.fromJson(model)).toList();
    return listProduct;
  } 

  static Future<List<Product>> getListProduct() async {
    final response = await http.get(Uri.parse(baseUrl + '/api/v1/getSP'));
    return compute(parseProduct, response.body);
  }

  static Future<User> signUpUser(String name, String email, String password, String phone, String address) async {
    final response = await http.post(
      Uri.parse(baseUrl + '/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name' : name,
        'email' : email,
        'password': password,
        'SDT': phone,
        'Address': address
      })
    );
    return User.fromJson(jsonDecode(response.body));
  }

  static Future<Cart> orderProduct(int idUser, String address, int accept, List listId, List listAmount) async{
    final response = await http.post(
      Uri.parse(baseUrl + '/api/v2/createDH/' + idUser.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'address': address,
        'accept': accept,
        'IDSanPham': listId,
        'SLSanPham': listAmount
      })
    );
    return Cart.fromJson(jsonDecode(response.body));  
  }
}

import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/cart.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/data/product.dart';
import 'package:shop_multilevel/app/data/user.dart';

class HomeController extends GetxController {
  
  var httpMethod = HttpMethods();
  User? currentUser;
  String currentEmail = '';
  String currentPassword = '';
  final isClickedSignIn = 0.obs;

  String? signUpName, signUpEmail, signUpPhone, signUpAddress, signUpPassword;
  final isClickedSignUp = 0.obs;

  //Detail Product
  Product? currentProduct;

  //Cart
  String amount = '';
  Cart currentCart = new Cart(address: '', accept: 1, listAmount: [], listID: []);
  List<Product> productCart  = [];
  List listPrice = [];
  final isClickedBuy = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> signUp() async{
    if(signUpName == null || signUpEmail == null || signUpPhone == null || signUpAddress == null || signUpPassword == null){
      return false;
    }
    else{
      await HttpMethods.signUpUser(signUpName!, signUpEmail!, signUpPassword!, signUpPhone!, signUpAddress!);
      return true;
    }
  }

  Future<User> login() async{
    return await HttpMethods.userLogin(currentEmail, currentPassword);
  }

  void Order(){
    currentCart.listAmount!.add(amount);
    currentCart.listID!.add(currentProduct!.id);
    productCart.add(currentProduct!);
    listPrice.add(currentProduct!.price! * int.parse(amount));
  }

  void Buy(){

  }
}

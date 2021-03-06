
import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/cart.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/data/product.dart';
import 'package:shop_multilevel/app/data/user.dart';

class HomeController extends GetxController {
  //Sign in
  User? currentUser;
  String txtEmailLogin = '';
  String txtPasswordLogin = '';
  final isLoadingSignIn = false.obs;

  //Sign up
  String? signUpName, signUpEmail, signUpPhone, signUpAddress, signUpPassword;  

  //Detail Product
  Product? currentProduct;

  //Cart
  String amount = '';
  Cart currentCart = new Cart(address: '', accept: 1, listAmount: [], listID: [].obs);
  List<Product> productCart  = [];
  List listPrice = [];

  Future<bool> signUp() async{
    if(signUpName == null || signUpEmail == null || signUpPhone == null || signUpAddress == null || signUpPassword == null){
      return false;
    }
    else{
      await HttpMethods.signUpUser(signUpName!, signUpEmail!, signUpPassword!, signUpPhone!, signUpAddress!);
      return true;
    }
  }

  Future<bool> login() async{
    if(txtEmailLogin == '' || txtPasswordLogin == ''){
      return false;
    }
    else{
      currentUser = await HttpMethods.userLogin(txtEmailLogin.toString(), txtPasswordLogin.toString());
      if(currentUser!.id == null){
        return false;
      }
      else{
        return true;
      }
    }
  }

  int Order(){
    if(amount == ''){
      return 0;
    }
    if(int.parse(amount) > currentProduct!.amount!.toInt()){
      return 1;
    }
    else{
      currentCart.listAmount!.add(amount);
      currentCart.listID!.add(currentProduct!.id);
      productCart.add(currentProduct!);
      listPrice.add(currentProduct!.price! * int.parse(amount));
      return 2;
    }
  }

  Future<bool> Buy() async{
    if(productCart.length == 0){
      return false;
    }
    else{
      await HttpMethods.orderProduct(
        currentUser!.id!.toInt(), 
        currentUser!.address.toString(), 
        1, 
        currentCart.listID!, 
        currentCart.listAmount!
      );
      productCart.clear();
      currentCart.listID!.clear();
      currentCart.listAmount!.clear();
      return true;
    }
    
  }

  void deleteProductCart(int index){
    productCart.removeAt(index);
    currentCart.listID!.removeAt(index);
    currentCart.listAmount!.removeAt(index);
  }
}

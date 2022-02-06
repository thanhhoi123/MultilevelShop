import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/views/list_product.dart';
import 'package:shop_multilevel/app/modules/home/views/order_product.dart';
import 'package:shop_multilevel/app/modules/home/views/profile_user.dart';


class DashBoardController extends GetxController{
  final tabIndex = 0.obs;
  // void changeTabIndex(int index){
  //   tabIndex = index;
  //   update();
  // }
  final pages = [
    ListProduct(),
    OrderProduct(),
    ProfileUser()
  ];
}
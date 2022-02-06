import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/dash_board_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DashBoardController>(
      () => DashBoardController()
    );
  }
}

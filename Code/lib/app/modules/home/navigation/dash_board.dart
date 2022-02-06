import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/dash_board_controller.dart';

class DashBoard extends GetView<DashBoardController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: controller.pages[controller.tabIndex.value],
        );
      }),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
          backgroundColor: Colors.blue,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,
          currentIndex: controller.tabIndex.value,
          onTap: (int index) => controller.tabIndex.value = index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'List Product' 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            )
          ],
        );
      }),
    );
  }

}
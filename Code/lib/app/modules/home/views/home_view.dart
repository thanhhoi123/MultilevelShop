import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/navigation/dash_board.dart';
import 'package:shop_multilevel/app/modules/home/views/list_product.dart';
import 'package:shop_multilevel/app/modules/home/views/sign_up.dart';
import 'package:shop_multilevel/app/widget/my_alert_dialog_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 60),
              child: const Text(
                'Multilevel Shop',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 50, 0),
                    child: const Text('Email: ', style: TextStyle(fontSize: 25),),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                      child: TextField(
                        onChanged: (value){
                          controller.txtEmailLogin = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                )
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 4, 0),
                    child: const Text('Password: ', style: TextStyle(fontSize: 25),),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 10, 8, 0),
                      child: TextField(
                        obscureText: true,
                        onChanged: (value){
                          controller.txtPasswordLogin = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              height: 50,
              width: 150,
              child: Obx((){
                return ElevatedButton(
                  onPressed: () async{
                    controller.isLoadingSignIn.value = true;
                    if(await controller.login()){
                      controller.isLoadingSignIn.value = false;
                      Get.to(() => DashBoard());                    
                    }
                    else{
                      controller.isLoadingSignIn.value = false;
                      MyAlertDialogWidget(
                        title: 'Error', 
                        content: 'Incorrect email or password',
                        onClicked: () => Get.back()
                      ).showCustomDialog(context);
                    }
                  },
                  child: controller.isLoadingSignIn.value
                    ? CircularProgressIndicator(color: Colors.white,)
                    : const Text('Sign in')
                );
              }),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                text: TextSpan(
                  text: 'Do you have a account? ',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign up ', 
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => SignUp());
                        }
                    )
                  ]
                )
              )
            ),
          ],
        ),
      ),
    );
  }  
}
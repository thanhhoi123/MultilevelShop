// import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/data/user.dart';
import 'package:shop_multilevel/app/modules/home/views/list_product.dart';
import 'package:shop_multilevel/app/modules/home/views/profile_user.dart';
import 'package:shop_multilevel/app/modules/home/views/sign_up.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 50, 0),
                    child: Text('Email: ', style: TextStyle(fontSize: 25),),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                      child: TextField(
                        onSubmitted: (value){
                          controller.currentEmail = value;
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
                    child: Text('Password: ', style: TextStyle(fontSize: 25),),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 10, 8, 0),
                      child: TextField(
                        onSubmitted: (value){
                          controller.currentPassword = value;
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

            Obx((){
              return Container(
                child: (controller.isClickedSignIn.value == 1)?
                FutureBuilder<User>(
                  future: HttpMethods.userLogin(
                    controller.currentEmail, 
                    controller.currentPassword
                  ),
                  builder: (context, snapshot){
                    if(snapshot.data == null){
                      return Text('Failed');
                    }
                    else{
                      controller.currentUser = snapshot.data!;
                      controller.currentCart.address = snapshot.data!.address.toString();
                      print(snapshot.data);
                      return Text('Success');
                    }
                  },
                ):
                Text(''),
              );
            }),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  controller.isClickedSignIn.value = 1;
                  Get.to(() => ListProduct());
                },
                child: Text('Sign in'),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
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



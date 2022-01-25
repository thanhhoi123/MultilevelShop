// import 'dart:js';
import 'package:path/path.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/views/list_product.dart';
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
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                'Multilevel Shop',
                style: TextStyle(fontSize: 40),
              ),
            ),
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

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () async{
                  controller.isClickedSignIn.value = 1;
                  controller.currentUser = await controller.login();
                  if(controller.currentUser!.id != null ){
                    Get.to(() => ListProduct());                    
                  }
                  else{
                    print('Failed');
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Incorrect email or password'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            }, 
                            child: Text('OK', style: TextStyle(color: Colors.purple[700]))
                          )
                        ],
                      ),
                    );
                  }
                },
                child: Text('Sign in'),
              ),
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
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/data/user.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/views/home_view.dart';

class SignUp extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Text('Multi-level Association', style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold, color: Colors.blue),),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Column(
                children: [
                  TextFormField(
                    onFieldSubmitted: (value){
                      controller.signUpName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value){
                      controller.signUpEmail = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value){
                      controller.signUpPhone = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value){
                      controller.signUpAddress = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value){
                      controller.signUpPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            
            Obx((){
              return Container(
                child: (controller.isClickedSignUp.value == 1)?
                FutureBuilder<User>(
                  future: HttpMethods.signUpUser(
                    controller.signUpName.toString(), 
                    controller.signUpEmail.toString(), 
                    controller.signUpPassword.toString(), 
                    controller.signUpPhone.toString(), 
                    controller.signUpAddress.toString()
                  ),
                  builder: (context, snapshot){
                    if(snapshot.data == null){
                      return Text('');
                    }
                    else{
                      return Text('');
                    }
                  },
                ):
                Text(''),
              );
            }),

            ElevatedButton(
              onPressed: () {
                controller.isClickedSignUp.value = 1;
                Get.to(HomeView());
              }, 
              child: Text('Sign up')
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/views/home_view.dart';
import 'package:shop_multilevel/app/widget/my_alert_dialog_widget.dart';

class SignUp extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const Text('Multi-level Association', style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold, color: Colors.blue),),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                      controller.signUpName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value){
                      controller.signUpEmail = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value){
                      controller.signUpPhone = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value){
                      controller.signUpAddress = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value){
                      controller.signUpPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () async{
                if(await controller.signUp()){
                  Get.to(() => HomeView());
                }
                else{
                  MyAlertDialogWidget(
                    content: 'You must enter all values',
                    title: 'Error',
                    onClicked: () => Get.back(),
                  ).showCustomDialog(context);                  
                }
              }, 
              child: const Text('Sign up')
            )
          ],
        ),
      ),
    );
  }
}
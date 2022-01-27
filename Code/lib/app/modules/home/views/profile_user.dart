import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/values/app_styles.dart';
import 'package:shop_multilevel/app/modules/home/views/home_view.dart';

class ProfileUser extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log out'),
                  onTap: () => Get.to(() => HomeView()),
                )
              )
            ]
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            controller.currentUser!.avatar != null?
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
              child: Image.network(controller.currentUser!.avatar.toString())
            ):
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
              child: Image.asset('assets/avatar_default.jpeg')
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Text('Name: ${controller.currentUser!.name.toString()}', style: AppStyles.h5, softWrap: true,),
                  Text('Email: ${controller.currentUser!.email.toString()}', style: AppStyles.h5, softWrap: true,),
                  Text('Phone: ${controller.currentUser!.phone.toString()}', style: AppStyles.h5, softWrap:  true,),
                  Text('Address: ${controller.currentUser!.address.toString()}', style: AppStyles.h5, softWrap: true,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
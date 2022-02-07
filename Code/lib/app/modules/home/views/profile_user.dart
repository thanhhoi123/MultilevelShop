import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/values/app_styles.dart';
import 'package:shop_multilevel/app/modules/home/views/home_view.dart';

class ProfileUser extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: const Text('Log out'),
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
              child: Image.network('https://www.google.com.vn/search?q=avatar+person+default+remove+backgroud&tbm=isch&ved=2ahUKEwjOl7GbydP1AhWn0IsBHTY3CuAQ2-cCegQIABAA&oq=avatar+person+default+remove+backgroud&gs_lcp=CgNpbWcQAzoHCCMQ7wMQJ1D_AljjJ2DuLmgCcAB4AIABrgGIAdoOkgEEOC4xMJgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=DGzzYc7hCKehr7wPtu6ogA4&bih=754&biw=1536#imgrc=vUnatp4jtxRPyM')
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 20),
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
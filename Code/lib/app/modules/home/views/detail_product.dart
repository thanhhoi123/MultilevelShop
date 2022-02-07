import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/navigation/dash_board.dart';
import 'package:shop_multilevel/app/modules/home/views/order_product.dart';

class DetailProduct extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Image.network(controller.currentProduct!.image.toString())
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${controller.currentProduct!.name.toString()}', style: TextStyle(fontSize: 20),),
                  Text('Price: ${controller.currentProduct!.price.toString()} VND', style: TextStyle(fontSize: 20),),
                  Text('Amount: ${controller.currentProduct!.amount.toString()}', style: TextStyle(fontSize: 20),),
                  Text('Description: ${controller.currentProduct!.description.toString()}', style: TextStyle(fontSize: 20),),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Enter quantity to buy: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      onSubmitted: (value){
                        controller.amount = value;
                      },
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              height: 50,
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  if(!controller.Order()){
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('You must enter less than the remaining amount'),
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
                  else{
                    Get.to(() => DashBoard());
                  }                
                }, 
                child: Text('Add to cart', style: TextStyle(fontSize: 20),)
              ),
            ),           
          ],
        ),
      ),
    );
  }
}

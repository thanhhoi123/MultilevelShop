import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/navigation/dash_board.dart';
import 'package:shop_multilevel/app/modules/home/views/list_product.dart';
import 'package:shop_multilevel/app/widget/my_alert_dialog_widget.dart';

class OrderProduct extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    double widght = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: widght,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery address: ${controller.currentUser!.address}',
                    softWrap:true,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Phone: ${controller.currentUser!.phone}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SizedBox(
                child: Obx((){
                  return ListView.builder(
                    itemCount: controller.currentCart.listID!.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          leading: Container(
                            child: Image.network(controller.productCart[index].image.toString())
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Name: ${controller.productCart[index].name.toString()}',
                                style: TextStyle(fontSize: 20),
                                softWrap: true,
                              ),
                              Text(
                                'Amount: ${controller.currentCart.listAmount![index]}',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Price: ${controller.listPrice[index]}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.productCart.removeAt(index);
                              controller.currentCart.listID!.removeAt(index);
                              controller.currentCart.listAmount!.removeAt(index);
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () async{
                  if(await controller.Buy() == true){
                    MyAlertDialogWidget(
                      title: 'Notification',
                      content: 'Your order has been successfully placed',
                      onClicked: () => Get.to(() => DashBoard()),
                    ).showCustomDialog(context);
                  }
                  else{
                    MyAlertDialogWidget(
                      title: 'Error',
                      content: 'Cart is currently empty, please add to cart before purchasing',
                      onClicked: () => Get.back(),
                    ).showCustomDialog(context);
                  }
                }, 
                child: const Text('Buy')
              ),
            )
          ],
        ),
      ),
    );    
  }  
}
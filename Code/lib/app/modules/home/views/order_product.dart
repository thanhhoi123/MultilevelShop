import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/views/list_product.dart';

class OrderProduct extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 375,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 16),
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
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () async{
                  await controller.Buy();
                  showModal(
                    configuration: FadeScaleTransitionConfiguration(
                      transitionDuration: Duration(seconds: 2),
                      reverseTransitionDuration: Duration(seconds: 2)
                    ),
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: Text('Notification'),
                      content: Text('Your order has been successfully placed'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.to(() => ListProduct());
                          }, 
                          child: Text('OK', style: TextStyle(color: Colors.purple[700]))
                        )
                      ],
                    ),
                  );                  
                }, 
                child: Text('Buy')
              ),
            )
          ],
        ),
      ),
    );    
  }
  
}
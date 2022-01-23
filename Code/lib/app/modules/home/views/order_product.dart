import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/cart.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';

class OrderProduct extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
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
                child: ListView.builder(
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

                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Obx((){
              return Container(
                child: (controller.isClickedBuy.value == 1)?
                FutureBuilder<Cart>(
                  future: HttpMethods.orderProduct(
                    controller.currentUser!.id!.toInt(), 
                    controller.currentUser!.address.toString(), 
                    1, 
                    controller.currentCart.listID!, 
                    controller.currentCart.listAmount!
                  ),
                  builder: (context, snapshot){
                    if(snapshot.data == null){
                      return Text('Failed');
                    }
                    else{
                      print(snapshot.data);
                      return Text('Success');
                    }
                  },
                ):
                Text(''),
              );
            }),

            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  controller.isClickedBuy.value = 1;
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
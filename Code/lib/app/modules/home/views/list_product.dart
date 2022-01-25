import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/data/product.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/views/detail_product.dart';
import 'package:shop_multilevel/app/modules/home/views/profile_user.dart';

class ListProduct extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.to(() => ProfileUser());
          },
          icon: Icon(Icons.person),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: HttpMethods.getListProduct(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Container(
              child: Text('Loading...'),
            );
          }
          else{
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                height: 500,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: ListTile(
                        title: Container(
                          margin: const EdgeInsets.all(4),
                          height: 200,
                          width: 200,
                          child: Image.network(snapshot.data![index].image.toString())
                        ),
                        subtitle: Center(
                          child: Column(
                            children: [
                              Text(snapshot.data![index].name.toString(), style: TextStyle(fontSize: 20),),
                              Text('${snapshot.data![index].price.toString()} VND', style: TextStyle(fontSize: 20),),
                            ],
                          )
                        ),
                        onTap: () {
                          controller.currentProduct = snapshot.data![index];
                          Get.to(() => DetailProduct());
                        },
                      ),
                    );
                  }
                ),
              ),
            );
          }
        },
      ),
    );
  }
  
}
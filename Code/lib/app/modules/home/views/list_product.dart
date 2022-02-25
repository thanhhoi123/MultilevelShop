import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_multilevel/app/data/http_methods.dart';
import 'package:shop_multilevel/app/data/product.dart';
import 'package:shop_multilevel/app/modules/home/controllers/home_controller.dart';
import 'package:shop_multilevel/app/modules/home/views/detail_product.dart';

class ListProduct extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Product>>(
        future: HttpMethods.getListProduct(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return SizedBox(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 24),
                  const Text('Please Wait...')
                ],
              ),
            );
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return OpenContainer(
                  transitionDuration: const Duration(milliseconds: 750),
                  openBuilder: (context, action){
                    controller.currentProduct = snapshot.data![index];
                    return DetailProduct();
                  },
                  closedBuilder: (context, openContainer) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
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
                        openContainer();
                      },
                    ),
                  ),
                );
              }
            );
          }
        },
      ),
    );
  }
  
}
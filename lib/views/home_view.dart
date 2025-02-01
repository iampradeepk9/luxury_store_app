import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/auth_controller.dart';
import 'product_tile.dart';

class HomeView extends StatelessWidget {
  final ProductController productController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Luxury Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
        flexibleSpace: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [Colors.blueAccent, Colors.purpleAccent],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           )
         ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, size: 28,),
            onPressed: authController.logout,
            tooltip: "Logout",
          )
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value && productController.products.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => productController.fetchProducts(isRefresh: true),
          child: ListView.builder(
            controller: productController.scrollController,
            itemCount: productController.products.length +
                (productController.isMoreDataAvailable.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == productController.products.length) {
                return productController.isMoreDataAvailable.value
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox();
              }
              return ProductTile(product: productController.products[index]);
            },
          ),
        );
      }),
    );
  }
}



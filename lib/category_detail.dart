import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_list/model/get_api_call_controller.dart';

class CategoryScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (cartController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (cartController.carts.isEmpty) {
          return const Center(child: Text('No carts found.'));
        } else {
          return ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: cartController.carts.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final cart = cartController.carts[index];
              return ListTile(
                title: Text(
                  'Cart ID: ${cart.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  'Total: \$${cart.total}\nProducts: ${cart.products.map((p) => 'ID: ${p.id}, Qty: ${p.quantity}').join(', ')}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                onTap: () {},
              );
            },
          );
        }
      }),
    );
  }
}

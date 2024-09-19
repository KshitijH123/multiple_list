import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'model/get_api_call_controller.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (categoryController.categories.isEmpty) {
          return const Center(child: Text('No categories found.'));
        } else {
          return ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: categoryController.categories.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final category = categoryController.categories[index];
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Icon(
                    Icons.category,
                    color: Colors.purple,
                    size: 40.0,
                  ),
                  title: Text(
                    category.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text(
                    'Description or additional info here',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {},
                ),
              );
            },
          );
        }
      }),
    );
  }
}

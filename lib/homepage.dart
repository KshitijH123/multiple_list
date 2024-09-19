import 'package:flutter/material.dart';
import 'package:multiple_list/category_detail.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  void _navigateToCategoryDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  CategoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _navigateToCategoryDetail(context),
          child: const Text('Category Detail'),
        ),
      ),
    );
  }
}

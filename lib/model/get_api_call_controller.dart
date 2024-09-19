import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:multiple_list/model/get_api_call_model.dart';
import 'dart:convert';

class CartController extends GetxController {
  var carts = <Cart>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCarts();
    super.onInit();
  }

  Future<void> fetchCarts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://dummyjson.com/carts'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var cart in jsonData['carts']) {
          carts.add(Cart.fromJson(cart));
        }
      } else {
        // Handle error
      }
    } finally {
      isLoading(false);
    }
  }
}

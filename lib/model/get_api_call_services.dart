import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multiple_list/model/get_api_call_model.dart';

class CategoryService {
  get isLoading => null;

  get categories => null;

  Future<List<CategoryModel>> fetchCategories() async {
    final url = Uri.parse('https://dummyjson.com/carts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

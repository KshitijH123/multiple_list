import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:multiple_list/model/get_api_call_model.dart';
import 'package:multiple_list/model/get_api_call_services.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var categoryList = await CategoryService().fetchCategories();
      if (categoryList.isNotEmpty) {
        categories.addAll(categoryList);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}

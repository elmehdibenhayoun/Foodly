import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/category_controller.dart';
import 'package:foody/models/api_error.dart';
import 'package:foody/models/foods.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:foody/models/hook_models/hook_result.dart';

FetchHook useFetchFoodsByRestaurant(String id) {
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/restaurant-foods/$id');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      //error.value = e as Exception;
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
      data: foods.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var isMoreDataAvailable = true.obs;
  var currentPage = 0;
  final int pageSize = 20;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchProducts();
    setupScrollListener();
    super.onInit();
  }

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        fetchProducts();
      }
    });
  }

  Future<void> fetchProducts({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
      products.clear();
      isMoreDataAvailable.value = true;
    }

    if (!isMoreDataAvailable.value || isLoading.value) return;

    isLoading.value = true;
    try {
      List<Product> newProducts = await ApiService.fetchProducts(currentPage * pageSize, pageSize);

      if (newProducts.isEmpty) {
        isMoreDataAvailable.value = false;
      } else {
        products.addAll(newProducts);
        currentPage++;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load products");
    } finally {
      isLoading.value = false;
    }
  }
}
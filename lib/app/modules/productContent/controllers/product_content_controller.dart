import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductContentController extends GetxController {
  final ScrollController scrollController = ScrollController();

  RxDouble opacity = 0.0.obs;

  RxInt selectedTabId = 1.obs;

  List tabsList = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    scrollListener();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //监听滚动
  void scrollListener() {
    scrollController.addListener(() {
      var opt = scrollController.position.pixels / 100;
      opt = opt < 0 ? 0 : opt;
      opt = opt > 1 ? 1 : opt;
      opacity.value = opt;
    });
  }

  //切换tab
  void changeTab(int id) {
    selectedTabId.value = id;
  }
}

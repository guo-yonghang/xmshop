import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../models/focus_model.dart';

class HomeController extends GetxController {
  //滚动控制器
  final ScrollController scrollController = ScrollController();
  //浮动导航开关
  final RxBool flag = false.obs;
  //轮播图数据
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    getFocusData();
  }

  //监听滚动
  void scrollListener() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      if (pixels > 20 && flag.value == false) {
        flag.value = true;
        update();
      }
      if (pixels < 20 && flag.value == true) {
        flag.value = false;
        update();
      }
    });
  }

  //获取轮播图数据
  void getFocusData() async {
    var response = await Dio().get('https://miapp.itying.com/api/focus');
    FocusModel focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;

    // swiperList.value = response.data['result'];
    update();
  }
}

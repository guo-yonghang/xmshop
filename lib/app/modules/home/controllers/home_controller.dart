import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../models/focus_model.dart';
import '../../../models/category_model.dart';
import '../../../models/plist_model.dart';

class HomeController extends GetxController {
  //滚动控制器
  final ScrollController scrollController = ScrollController();
  //浮动导航开关
  final RxBool flag = false.obs;
  //轮播图数据
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  //分类数据
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  //热销轮播数据
  RxList<FocusItemModel> bellSellingSwiperList = <FocusItemModel>[].obs;
  //热销商品数据
  RxList<PlistItemModel> bellSellingGoodsList = <PlistItemModel>[].obs;
  //推荐商品数据
  RxList<PlistItemModel> bestGoodsList = <PlistItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    getFocusData();
    getCategoryData();
    getBellSellingSwiperData();
    getBellSellingGoodsData();
    getBestGoodsList();
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
    update();
  }

  //获取分类数据
  void getCategoryData() async {
    var response = await Dio().get('https://miapp.itying.com/api/bestCate');
    CategoryModel category = CategoryModel.fromJson(response.data);
    categoryList.value = category.result!;
    update();
  }

  //获取热销轮播数据
  void getBellSellingSwiperData() async {
    var response =
        await Dio().get('https://miapp.itying.com/api/focus?position=2');
    FocusModel focus = FocusModel.fromJson(response.data);
    bellSellingSwiperList.value = focus.result!;
    update();
  }

  //获取热销商品数据
  void getBellSellingGoodsData() async {
    var response = await Dio()
        .get('https://miapp.itying.com/api/plist?is_hot=1&pageSize=3');
    PlistModel plist = PlistModel.fromJson(response.data);
    bellSellingGoodsList.value = plist.result!;
    update();
  }

  //获取推荐商品数据
  void getBestGoodsList() async {
    var response =
        await Dio().get('https://miapp.itying.com/api/plist?is_bset=1');
    PlistModel plist = PlistModel.fromJson(response.data);
    bestGoodsList.value = plist.result!;
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../service/httpsClient.dart';
import '../../../models/plist_model.dart';

class ProductListController extends GetxController {
  //页码
  RxInt page = 1.obs;
  //排序
  RxString sort = ''.obs;
  //商品列表数据
  RxList<PlistItemModel> productList = <PlistItemModel>[].obs;
  //加载完毕
  RxBool completed = false.obs;
  //滚动控制器
  ScrollController scrollController = ScrollController();
  //是否请求中
  bool flag = false;
  //二级导航数据
  List<Map<String, dynamic>> subHeaderList = [
    {'id': 1, 'title': '综合', 'field': 'all', 'sort': -1},
    {'id': 2, 'title': '销量', 'field': 'salecount', 'sort': -1},
    {'id': 3, 'title': '价格', 'field': 'price', 'sort': -1},
    {'id': 4, 'title': '筛选'},
  ];
  //二级菜单选中id
  RxInt selectHeaderId = 1.obs;
  //定义响应式变量控制箭头方向变化
  RxInt subHeaderSort = 0.obs;
  //全局key
  GlobalKey<ScaffoldState> scanffoldGlobalKey = GlobalKey<ScaffoldState>();
  //网络请求
  HttpsClient httpsClient = HttpsClient();

  String? keywords = Get.arguments['keywords'];
  String? cid = Get.arguments['cid'];
  String apiUri = "";

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    getProductListData();
  }

  //监听滚动
  void scrollListener() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      if (pixels > maxScrollExtent - 20) {
        page.value++;
        getProductListData();
      }
    });
  }

  //改变二级导航
  void changeSubHeader(int id) {
    selectHeaderId.value = id;
    if (id != 4) {
      sort.value =
          '${subHeaderList[id - 1]['field']}_${subHeaderList[id - 1]['sort']}';
      subHeaderList[id - 1]['sort'] = subHeaderList[id - 1]['sort'] * -1;
      subHeaderSort.value = subHeaderList[id - 1]['sort']; //无作用操作，为了使箭头响应式
      page.value = 1;
      completed.value = false;
      productList.clear();
      scrollController.jumpTo(0);
      getProductListData();
    } else {
      scanffoldGlobalKey.currentState!.openEndDrawer();
    }
    update();
  }

  //获取商品列表数据
  void getProductListData() async {
    if (flag) return;
    flag = true;
    if (cid != null) {
      apiUri =
          '/api/plist?cid=${cid}&page=${page.value}&pageSize=10&sort=${sort.value}';
    } else {
      apiUri =
          '/api/plist?search=${keywords}&page=${page.value}&pageSize=10&sort=${sort.value}';
    }
    var response = await httpsClient.get(apiUri);
    if (response != null) {
      PlistModel plist = PlistModel.fromJson(response.data);
      productList.addAll(plist.result!);
      completed.value = plist.result!.length < 10;
      flag = false;
      update();
    }
  }
}

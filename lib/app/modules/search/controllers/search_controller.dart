import 'package:get/get.dart';

class SearchPageController extends GetxController {
  //模拟历史记录列表
  RxList historyList =
      ['小米手机', '笔记本电脑', '空调', '洗衣机', '电视机', '冰箱', '电饭煲', '电磁炉'].obs;
  //模拟热搜关键词列表
  RxList hotSearchList =
      ['手机', '电脑', '空调', '洗衣机', '电视机', '冰箱', '电饭煲', '电磁炉'].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

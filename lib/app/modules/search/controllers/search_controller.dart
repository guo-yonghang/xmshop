import 'package:get/get.dart';
import '../../../service/storage.dart';

class SearchPageController extends GetxController {
  //模拟历史记录列表
  RxList historyList = [].obs;
  //模拟猜你想搜列表
  RxList againSearchList =
      ['手机', '电脑', '空调', '洗衣机', '电视机', '冰箱', '电饭煲', '电磁炉'].obs;
  //搜索框内容
  String keywords = '';

  @override
  void onInit() async {
    super.onInit();
    getHistoryList();
  }

  @override
  void onClose() {
    super.onClose();
    saveHistoryList();
    print('关闭了');
  }

  //获取历史记录
  void getHistoryList() async {
    List? res = await Storage.getData('searchHistory');
    historyList.value = res ?? [];
  }

  //保存历史记录
  void saveHistoryList() {
    Storage.setData('searchHistory', historyList);
  }

  //修改历史记录
  void changeHistoryList(String value) {
    if (historyList.contains(value)) {
      historyList.remove(value);
    }
    historyList.insert(0, value);
    if (historyList.length > 10) {
      historyList.removeLast();
    }
  }

  //跳转到搜索结果页
  void toSearchResult() {
    if (keywords.isNotEmpty) {
      changeHistoryList(keywords);
      Get.offAndToNamed('/product-list', arguments: {'keywords': keywords});
    }
  }
}

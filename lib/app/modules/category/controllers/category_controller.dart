import 'package:get/get.dart';
import '../../../service/httpsClient.dart';
import '../../../models/category_model.dart';

class CategoryController extends GetxController {
  //选中的索引
  RxInt selectIndex = 0.obs;
  //左侧分类数据
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  //右侧分类数据
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;

  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //改变选中的索引
  void changeIndex(int index, String id) {
    selectIndex.value = index;
    getRightCategoryData(id);
    update();
  }

  //获取左侧分类数据
  void getLeftCategoryData() async {
    var response = await httpsClient.get('/api/pcate');
    if (response != null) {
      CategoryModel category = CategoryModel.fromJson(response.data);
      leftCategoryList.value = category.result!;
      getRightCategoryData(leftCategoryList[0].sId!);
      update();
    }
  }

  //获取右侧分类数据
  void getRightCategoryData(String pid) async {
    var response = await httpsClient.get('/api/pcate?pid=$pid');
    if (response != null) {
      CategoryModel category = CategoryModel.fromJson(response.data);
      rightCategoryList.value = category.result!;
      update();
    }
  }
}

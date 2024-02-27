import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../service/httpsClient.dart';
import '../controllers/category_controller.dart';
import '../../../service/screenAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  //左侧分类
  Widget leftCateWidget() {
    return SizedBox(
      width: ScreenAdapter.width(280),
      height: double.infinity,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.leftCategoryList.length,
          itemBuilder: ((context, index) {
            String title = controller.leftCategoryList[index].title!;
            String id = controller.leftCategoryList[index].sId!;

            return SizedBox(
              width: double.infinity,
              height: ScreenAdapter.height(180),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.changeIndex(index, id);
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: ScreenAdapter.width(10),
                          height: ScreenAdapter.height(46),
                          color: controller.selectIndex.value == index
                              ? Colors.orange
                              : Colors.transparent,
                        ),
                      ),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            fontWeight: controller.selectIndex.value == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  //右侧分类
  Widget rightCateWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        height: double.infinity,
        color: Colors.white,
        child: Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: ScreenAdapter.width(20),
              mainAxisSpacing: ScreenAdapter.height(20),
              childAspectRatio: 240 / 330,
            ),
            itemCount: controller.rightCategoryList.length,
            itemBuilder: ((context, index) {
              String title = controller.rightCategoryList[index].title!;
              String id = controller.rightCategoryList[index].sId!;

              return InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/product-list', arguments: {'id': id});
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Image.network(
                          HttpsClient.replaceUrl(
                              controller.rightCategoryList[index].pic!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, ScreenAdapter.height(10), 0, 0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Get.toNamed('/search');
          },
          child: Container(
            width: ScreenAdapter.width(840),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                    child: const Icon(Icons.search, color: Colors.black54)),
                Text(
                  "手机",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(40),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined, color: Colors.black54),
          ),
        ],
      ),
      body: Row(
        children: [
          leftCateWidget(),
          rightCateWidget(),
        ],
      ),
    );
  }
}

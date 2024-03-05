import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_list_controller.dart';
import '../../../service/httpsClient.dart';
import '../../../service/screenAdapter.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  //商品列表
  Widget produrctListWidget() {
    return Obx(
      () => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.productList.length,
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(26),
            ScreenAdapter.height(146),
            ScreenAdapter.width(26),
            0,
          ),
          itemBuilder: ((context, index) {
            String title = controller.productList[index].title!;
            String subTitle = controller.productList[index].subTitle!;
            int price = controller.productList[index].price!;

            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(60)),
                        width: ScreenAdapter.width(400),
                        height: ScreenAdapter.height(600),
                        child: Image.network(
                          HttpsClient.replaceUrl(
                              controller.productList[index].pic!),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: ScreenAdapter.height(20)),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: ScreenAdapter.height(20)),
                              child: Text(
                                subTitle,
                                style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: ScreenAdapter.height(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'CUP',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          'Helio G25',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '高清拍摄',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          '800亿像素',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '超大屏',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          '6.1英寸',
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '¥$price',
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(38),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                controller.productList.length - 1 == index
                    ? loadmoreWidget()
                    : Container(),
              ],
            );
          })),
    );
  }

  //二级导航头部
  Widget subHeaderWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(120),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Color.fromRGBO(233, 233, 233, 0.9),
            ),
          ),
        ),
        child: Obx(
          () => Row(
            children: controller.subHeaderList.map((value) {
              return Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeSubHeader(value['id']);
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(16), 0,
                            ScreenAdapter.width(16), 0),
                        child: Center(
                          child: Text(
                            value['title'],
                            style: TextStyle(
                                color: controller.selectHeaderId == value['id']
                                    ? Colors.red
                                    : Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    showIconWidget(value['id'], value['sort']),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  //箭头组件
  Widget showIconWidget(int id, int? sort) {
    if (id == 2 || id == 3) {
      return controller.subHeaderSort.value > -2 && sort == 1
          ? const Icon(Icons.arrow_drop_down, color: Colors.black54)
          : const Icon(Icons.arrow_drop_up, color: Colors.black54);
    } else {
      return Container();
    }
  }

  //loadmore组件
  Widget loadmoreWidget() {
    if (controller.completed.value) {
      return Center(
        child: Text(
          '没有更多数据了',
          style: TextStyle(
            color: Colors.grey,
            fontSize: ScreenAdapter.fontSize(30),
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      key: controller.scanffoldGlobalKey,
      endDrawer: const Drawer(
        child: DrawerHeader(
          child: Text(''),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: const [Text('')],
        title: InkWell(
          onTap: () {
            Get.offAndToNamed('/search');
          },
          child: Container(
            width: ScreenAdapter.width(900),
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
                  controller.keywords ?? '搜索商品',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.productList.isEmpty
            ? loadmoreWidget()
            : Stack(
                children: [
                  produrctListWidget(),
                  subHeaderWidget(),
                ],
              ),
      ),
    );
  }
}

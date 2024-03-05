import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import '../../../service/screenAdapter.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

  Widget appBarWidget(BuildContext context) {
    return Obx(
      () => AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(controller.opacity.value),
        title: Opacity(
          opacity: controller.opacity.value > 0.9 ? 1 : 0,
          child: SizedBox(
            width: ScreenAdapter.width(350),
            height: ScreenAdapter.height(96),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controller.tabsList.map((value) {
                return InkWell(
                  onTap: () {
                    controller.changeTab(value['id']);
                    if (value['id'] == 1) {
                      Scrollable.ensureVisible(
                        controller.gk1.currentContext as BuildContext,
                        duration: const Duration(milliseconds: 300),
                      );
                    } else if (value['id'] == 2) {
                      Scrollable.ensureVisible(
                        controller.gk2.currentContext as BuildContext,
                        duration: const Duration(milliseconds: 300),
                      );
                    } else {
                      Scrollable.ensureVisible(
                        controller.gk3.currentContext as BuildContext,
                        duration: const Duration(milliseconds: 300),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: ScreenAdapter.width(10),
                      right: ScreenAdapter.width(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value['title'],
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            color: controller.selectedTabId == value['id']
                                ? Colors.red
                                : Colors.black54,
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(80),
                          height: ScreenAdapter.height(4),
                          color: controller.selectedTabId == value['id']
                              ? Colors.red
                              : Colors.transparent,
                          margin:
                              EdgeInsets.only(top: ScreenAdapter.height(10)),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        leading: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: ScreenAdapter.width(88),
            height: ScreenAdapter.height(88),
            child: Obx(
              () => ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(
                    controller.opacity.value > 0.9
                        ? Colors.white
                        : Colors.black12,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    controller.opacity.value > 0.9
                        ? Colors.black54
                        : Colors.white,
                  ),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            width: ScreenAdapter.width(88),
            height: ScreenAdapter.height(88),
            margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(
                  controller.opacity.value > 0.9
                      ? Colors.white
                      : Colors.black12,
                ),
                foregroundColor: MaterialStateProperty.all(
                  controller.opacity.value > 0.9
                      ? Colors.black54
                      : Colors.white,
                ),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              child: const Icon(Icons.file_upload_outlined),
            ),
          ),
          Container(
            width: ScreenAdapter.width(88),
            height: ScreenAdapter.height(88),
            margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
            child: ElevatedButton(
              onPressed: () {
                showMenu(
                  context: context,
                  color: Colors.black54.withOpacity(0.7),
                  position: RelativeRect.fromLTRB(
                    ScreenAdapter.width(800),
                    ScreenAdapter.height(280),
                    ScreenAdapter.width(30),
                    0,
                  ),
                  items: [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          SizedBox(width: ScreenAdapter.width(30)),
                          const Text(
                            '首页',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          SizedBox(width: ScreenAdapter.width(30)),
                          const Text(
                            '消息',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          SizedBox(width: ScreenAdapter.width(30)),
                          const Text(
                            '收藏',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(
                  controller.opacity.value > 0.9
                      ? Colors.white
                      : Colors.black12,
                ),
                foregroundColor: MaterialStateProperty.all(
                  controller.opacity.value > 0.9
                      ? Colors.black54
                      : Colors.white,
                ),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          Container(
            key: controller.gk1,
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(1200),
            color: Colors.red,
          ),
          Container(
            key: controller.gk2,
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(1200),
            color: Colors.green,
          ),
          Container(
            key: controller.gk3,
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(1200),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.height(190),
        padding: EdgeInsets.only(
            left: ScreenAdapter.width(20),
            right: ScreenAdapter.width(20),
            bottom: ScreenAdapter.height(30)),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: ScreenAdapter.width(2),
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: ScreenAdapter.width(200),
              height: ScreenAdapter.height(160),
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black54,
                      size: ScreenAdapter.fontSize(60),
                    ),
                    Text(
                      "购物车",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenAdapter.fontSize(32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: ScreenAdapter.height(120),
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "加入购物车",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenAdapter.fontSize(40),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: ScreenAdapter.height(120),
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "立即购买",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenAdapter.fontSize(40),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
        child: appBarWidget(context),
      ),
      body: Stack(
        children: [
          bodyWidget(),
          bottomWidget(),
        ],
      ),
    );
  }
}

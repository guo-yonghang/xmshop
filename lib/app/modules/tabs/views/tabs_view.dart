import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (int index) {
              controller.pageController.jumpToPage(index);
              controller.setCurrentIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: '分类',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '服务',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '购物车',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '我的',
              ),
            ],
          ),
          body: PageView(
            controller: controller.pageController,
            children: controller.tabs,
            onPageChanged: (int index) {
              controller.setCurrentIndex(index);
            },
          ),
        ));
  }
}

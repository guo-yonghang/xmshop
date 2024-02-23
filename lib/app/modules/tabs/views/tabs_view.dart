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
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Give',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'User',
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

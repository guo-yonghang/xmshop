import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import '../../../service/screenAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('屏幕宽度${ScreenAdapter.getScreenWidth()}');
    print('屏幕高度${ScreenAdapter.getScreenHeight()}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(600),
            color: Colors.yellow,
            child: Text(
              '手机',
              style: TextStyle(fontSize: ScreenAdapter.fontSize(40)),
            ),
          )
        ],
      ),
    );
  }
}

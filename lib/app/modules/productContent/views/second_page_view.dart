import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import '../../../service/screenAdapter.dart';

class SecondPageView extends GetView {
  @override
  final ProductContentController controller =
      Get.find<ProductContentController>();
  SecondPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(1200),
      color: Colors.green,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import '../../../service/screenAdapter.dart';

class FirstPageView extends GetView {
  @override
  final ProductContentController controller =
      Get.find<ProductContentController>();
  FirstPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk1,
      width: ScreenAdapter.width(1080),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              "https://www.itying.com/images/flutter/1.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(20),
              ScreenAdapter.height(20),
              ScreenAdapter.width(20),
              0,
            ),
            child: Text(
              "小米10至尊纪念版 120X 变焦 120W秒充 120Hz屏 50W无线充 骁龙865",
              style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenAdapter.fontSize(46),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(20),
              ScreenAdapter.height(20),
              ScreenAdapter.width(20),
              0,
            ),
            child: Text(
              "震撼首发 120倍长焦变焦 120W秒充 120Hz屏 50W无线充 骁龙865 1亿像素 120倍长焦",
              style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenAdapter.fontSize(34),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

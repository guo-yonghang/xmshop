import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import '../../../service/screenAdapter.dart';

class SearchView extends GetView<SearchPageController> {
  const SearchView({Key? key}) : super(key: key);

  //历史记录
  Widget historyWidget() {
    return Column(
      children: [
        SizedBox(height: ScreenAdapter.height(20)),
        Container(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '历史记录',
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(48),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.delete,
                  color: Colors.black45,
                  size: ScreenAdapter.fontSize(60),
                ),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('提示'),
                      content: const Text('确定要删除历史记录吗？'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('取消'),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.historyList.clear();
                            Get.back();
                          },
                          child: const Text('确定'),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
        //历史记录列表
        Container(
          margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
            ScreenAdapter.width(0),
            ScreenAdapter.height(20),
          ),
          child: Obx(
            () => Wrap(
              children: controller.historyList.map((value) {
                return Container(
                  margin: EdgeInsets.only(
                    right: ScreenAdapter.width(30),
                    bottom: ScreenAdapter.height(30),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(30),
                    ScreenAdapter.height(14),
                    ScreenAdapter.width(30),
                    ScreenAdapter.height(14),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(34),
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  //热搜关键词
  Widget hotSearchWidget() {
    return Column(
      children: [
        SizedBox(height: ScreenAdapter.height(20)),
        Container(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '热搜关键词',
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(48),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
            ScreenAdapter.width(0),
            ScreenAdapter.height(20),
          ),
          child: Obx(
            () => Wrap(
              children: controller.hotSearchList.map((value) {
                return Container(
                  margin: EdgeInsets.only(
                    right: ScreenAdapter.width(30),
                    bottom: ScreenAdapter.height(30),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(30),
                    ScreenAdapter.height(14),
                    ScreenAdapter.width(30),
                    ScreenAdapter.height(14),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(34),
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Container(
          width: ScreenAdapter.width(820),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            autofocus: true,
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: const Icon(Icons.search, color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                '搜索',
                style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
              ))
        ],
      ),
      body: ListView(
        children: [
          historyWidget(),
          hotSearchWidget(),
        ],
      ),
    );
  }
}

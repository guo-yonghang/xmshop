import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import '../../../service/screenAdapter.dart';

class SearchView extends GetView<SearchPageController> {
  const SearchView({Key? key}) : super(key: key);

  //单个标签按钮
  Widget keywordTag(value) {
    return InkWell(
      onTap: () {
        controller.keywords = value;
        controller.toSearchResult();
      },
      onLongPress: () {
        Get.dialog(
          AlertDialog(
            title: const Text('提示'),
            content: const Text('确定要删除该条历史记录吗？'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  controller.historyList.remove(value);
                  Get.back();
                },
                child: const Text('确定'),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(30),
          ScreenAdapter.height(14),
          ScreenAdapter.width(30),
          ScreenAdapter.height(14),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          value,
          style: TextStyle(
            fontSize: ScreenAdapter.fontSize(34),
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

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
                  size: ScreenAdapter.fontSize(42),
                ),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('提示'),
                      content: const Text('确定要清空历史记录吗？'),
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
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Obx(
            () => Wrap(
              spacing: ScreenAdapter.width(20),
              runSpacing: ScreenAdapter.height(30),
              children: controller.historyList.map((value) {
                return keywordTag(value);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  //猜你想搜
  Widget againSearchWidget() {
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
                  '猜你想搜',
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
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Obx(
            () => Wrap(
              spacing: ScreenAdapter.width(30),
              runSpacing: ScreenAdapter.height(30),
              children: controller.againSearchList.map((value) {
                return keywordTag(value);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  //热销商品
  Widget hotSearchList() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        ScreenAdapter.width(30),
        ScreenAdapter.height(20),
        ScreenAdapter.width(30),
        ScreenAdapter.height(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenAdapter.height(138),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hot_search.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 1,
                  crossAxisSpacing: ScreenAdapter.width(40),
                  mainAxisSpacing: ScreenAdapter.height(20),
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: ScreenAdapter.width(120),
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Image.network(
                            'https://www.itying.com/images/flutter/1.png'),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(10)),
                          alignment: Alignment.topLeft,
                          child: const Text('小米净化器 热水器 小米净化器'),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        title: Container(
          width: ScreenAdapter.width(820),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(235, 235, 235, 1),
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
            onChanged: (value) {
              controller.keywords = value;
            },
            onSubmitted: (value) {
              controller.toSearchResult();
            },
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller.toSearchResult();
              },
              child: Text(
                '搜索',
                style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
              ))
        ],
      ),
      body: ListView(
        children: [
          Obx(
            () => controller.historyList.isNotEmpty
                ? historyWidget()
                : Container(),
          ),
          againSearchWidget(),
          SizedBox(height: ScreenAdapter.height(20)),
          hotSearchList(),
        ],
      ),
    );
  }
}

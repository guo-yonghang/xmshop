import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:xmshop/app/service/screenAdapter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controllers/home_controller.dart';
import '../../../service/httpsClient.dart';
import '../../../service/keepAliceWrapper.dart';
import '../../../service/ityingFonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  //导航栏
  Widget appBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(
        () => AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor:
              controller.flag.value ? Colors.white : Colors.transparent,
          leading: controller.flag.value
              ? null
              : const Icon(
                  ItyingFonts.xiaomi,
                  color: Colors.white,
                ),
          title: InkWell(
            onTap: () {
              Get.toNamed('/search');
            },
            child: AnimatedContainer(
              width: controller.flag.value
                  ? ScreenAdapter.width(800)
                  : ScreenAdapter.width(620),
              height: ScreenAdapter.height(96),
              decoration: BoxDecoration(
                color: const Color.fromARGB(230, 252, 243, 236),
                borderRadius: BorderRadius.circular(30),
              ),
              duration: const Duration(milliseconds: 300),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0,
                          ScreenAdapter.width(10), 0),
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
              icon: Icon(Icons.qr_code,
                  color: controller.flag.value ? Colors.black87 : Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message,
                  color: controller.flag.value ? Colors.black87 : Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  //轮播图
  Widget focus() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(
        () => Swiper(
          itemCount: controller.swiperList.length,
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          autoplay: true,
          loop: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              HttpsClient.replaceUrl(controller.swiperList[index].pic!),
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }

  //banner
  Widget banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset('assets/images/xiaomiBanner.png', fit: BoxFit.cover),
    );
  }

  //分类
  Widget category() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(480),
      child: Obx(
        () => Swiper(
          itemCount: controller.categoryList.length ~/ 10,
          loop: false,
          pagination: const SwiperPagination(
            builder: SwiperPagination.rect,
          ),
          itemBuilder: (context, index) {
            return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: ScreenAdapter.width(20),
                    mainAxisSpacing: ScreenAdapter.width(20)),
                itemBuilder: (context, i) {
                  return InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ScreenAdapter.height(140),
                          height: ScreenAdapter.height(140),
                          child: Image.network(
                            HttpsClient.replaceUrl(
                                controller.categoryList[index * 10 + i].pic!),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text(
                            '${controller.categoryList[index * 10 + i].title}',
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(28)),
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  );
                });
          },
        ),
      ),
    );
  }

  //banner2
  Widget banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/images/xiaomiBanner2.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: ScreenAdapter.height(420),
      ),
    );
  }

  //热销商品
  Widget bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30),
              ScreenAdapter.height(40),
              ScreenAdapter.width(30),
              ScreenAdapter.height(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '热销臻选',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(46),
                ),
              ),
              Text(
                '更多手机推荐 >',
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(38),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,
              ScreenAdapter.width(20), ScreenAdapter.height(20)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Obx(
                    () => Swiper(
                      itemCount: controller.bellSellingSwiperList.length,
                      pagination: const SwiperPagination(
                          builder: SwiperPagination.rect),
                      autoplay: true,
                      loop: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          HttpsClient.replaceUrl(
                              controller.bellSellingSwiperList[index].pic!),
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: ScreenAdapter.width(20)),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Obx(
                    () => Column(
                      children: controller.bellSellingGoodsList
                          .asMap()
                          .entries
                          .map((entrie) {
                        var value = entrie.value;
                        int key = entrie.key;

                        return Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ScreenAdapter.height(10)),
                              color: const Color.fromRGBO(246, 246, 246, 1),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0,
                                ScreenAdapter.height(key == 2 ? 0 : 20)),
                            padding: EdgeInsets.fromLTRB(
                              ScreenAdapter.height(20),
                              ScreenAdapter.height(10),
                              ScreenAdapter.height(10),
                              ScreenAdapter.height(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${value.title}',
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(38),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                          height: ScreenAdapter.height(10)),
                                      Text(
                                        '${value.subTitle}',
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(28),
                                        ),
                                      ),
                                      SizedBox(
                                          height: ScreenAdapter.height(10)),
                                      Text(
                                        '众筹价¥${value.price}元',
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    HttpsClient.replaceUrl(value.pic!),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  //推荐商品
  Widget bestGoods() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(20),
              ScreenAdapter.height(20),
              ScreenAdapter.width(20),
              ScreenAdapter.height(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '省心优惠',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(46),
                ),
              ),
              Text(
                '全部优惠 >',
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(38),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Obx(
          () => Container(
            padding: EdgeInsets.all(ScreenAdapter.width(26)),
            color: const Color.fromRGBO(246, 246, 246, 1),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: ScreenAdapter.width(26),
              crossAxisSpacing: ScreenAdapter.height(26),
              itemCount: controller.bestGoodsList.length,
              //自动收缩元素，宽度自适应
              shrinkWrap: true,
              //禁止滑动
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String title = controller.bestGoodsList[index].title!;
                String subTitle = controller.bestGoodsList[index].subTitle!;
                int price = controller.bestGoodsList[index].price!;
                String sId = controller.bestGoodsList[index].sId!;

                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/product-content',
                      arguments: {"id": sId},
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(20)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(10)),
                          child: Image.network(
                            HttpsClient.replaceUrl(
                                controller.bestGoodsList[index].pic!),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            ScreenAdapter.height(0),
                            ScreenAdapter.height(5),
                            ScreenAdapter.height(0),
                            ScreenAdapter.height(5),
                          ),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(38),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            ScreenAdapter.height(0),
                            ScreenAdapter.height(5),
                            ScreenAdapter.height(0),
                            ScreenAdapter.height(5),
                          ),
                          child: Text(
                            subTitle.isNotEmpty ? subTitle : 'flutter开发小米商城项目',
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            ScreenAdapter.height(0),
                            ScreenAdapter.height(5),
                            ScreenAdapter.height(0),
                            ScreenAdapter.height(5),
                          ),
                          child: Text(
                            '¥$price',
                            style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  //首页内容
  Widget homeBody(statusBarHeight) {
    return Positioned(
      top: -statusBarHeight,
      bottom: 0,
      left: 0,
      right: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          focus(),
          banner(),
          category(),
          banner2(),
          bestSelling(),
          bestGoods(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            homeBody(statusBarHeight),
            appBar(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:xmshop/app/service/screenAdapter.dart';
import '../controllers/home_controller.dart';
import '../../../service/keepAliceWrapper.dart';
import '../../../service/ityingFonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget appBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(
        () => AppBar(
          centerTitle: true,
          backgroundColor:
              controller.flag.value ? Colors.white : Colors.transparent,
          elevation: 0,
          leading: controller.flag.value
              ? null
              : const Icon(
                  ItyingFonts.xiaomi,
                  color: Colors.white,
                ),
          title: AnimatedContainer(
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
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code,
                  color: controller.flag.value ? Colors.black : Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message,
                  color: controller.flag.value ? Colors.black : Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  focusContent() {
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
              'https://miapp.itying.com/${controller.swiperList[index].pic}'
                  .replaceAll('\\', '/'),
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }

  bannerContent() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset('assets/images/xiaomiBanner.png', fit: BoxFit.cover),
    );
  }

  Widget homeBody(statusBarHeight) {
    return Positioned(
      top: -statusBarHeight,
      bottom: 0,
      left: 0,
      right: 0,
      //https://www.itying.com/images/focus/focus02.png
      child: ListView(
        controller: controller.scrollController,
        children: [
          focusContent(),
          bannerContent(),
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(470),
            color: Colors.red,
            child: Swiper(
              itemCount: 2,
              pagination: const SwiperPagination(
                builder: SwiperPagination.rect,
              ),
              itemBuilder: (context, index) {
                return const Text('data');
                // return GridView.builder(gridDelegate:, itemBuilder: (context,index) {
                //   return Column(
                //     children: [
                //       SizedBox(
                //         width: ScreenAdapter.height(180),
                //         height: ScreenAdapter.height(180),
                //         child: Image.network('https://miapp.itying.com/public/upload/01.png',fit: BoxFit.cover,),
                //       )
                //     ],
                //   );
                // });
              },
            ),
          )
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/common/widgets/bottombar.dart';
import 'package:yyh_clothes/pages/clothes/view.dart';
import 'package:yyh_clothes/pages/index.dart';
import 'package:yyh_clothes/pages/mine/view.dart';
import 'package:yyh_clothes/pages/paired/view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX();

  // 主视图
  Widget _buildView() {
    DateTime? _lastPressedAt;
    return WillPopScope(
      // 防止连续点击两次退出
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          Loading.toast('Press again to exit');
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // 导航栏
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) {
            return FloatingNavBar(
              items: const [
                NavItem(icon: AssetsImages.nav_1),
                NavItem(icon: AssetsImages.nav_2),
                NavItem(icon: AssetsImages.nav_3),
                NavItem(icon: AssetsImages.nav_4),
              ],
              currentIndex: controller.currentIndex,
              onTap: (i) {
                controller.onIndexChanged(i);
                controller.onJumpToPage(i);
              },
            );
          },
        ),
        // 内容页
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          // onPageChanged: controller.onIndexChanged,
          children: const [
            HomePage(),
            ClothesPage(),
            PairedPage(),
            MinePage(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      // init: MainController(), //已经binding中 lazyput
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}

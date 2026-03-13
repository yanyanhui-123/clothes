import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  // 主视图
  Widget _buildView() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

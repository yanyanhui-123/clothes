import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MineViewGetX();
  }
}

class _MineViewGetX extends GetView<MineController> {
  const _MineViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MinePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("mine")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

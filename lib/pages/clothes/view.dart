import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ClothesPage extends StatefulWidget {
  const ClothesPage({Key? key}) : super(key: key);

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _ClothesViewGetX();
  }
}

class _ClothesViewGetX extends GetView<ClothesController> {
  const _ClothesViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ClothesPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClothesController>(
      init: ClothesController(),
      id: "clothes",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("clothes")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

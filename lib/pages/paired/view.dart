import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PairedPage extends StatefulWidget {
  const PairedPage({Key? key}) : super(key: key);

  @override
  State<PairedPage> createState() => _PairedPageState();
}

class _PairedPageState extends State<PairedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _PairedViewGetX();
  }
}

class _PairedViewGetX extends GetView<PairedController> {
  const _PairedViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PairedPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PairedController>(
      init: PairedController(),
      id: "paired",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("paired")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

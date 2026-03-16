import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/components/main_appbar.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/pages/clothes/widgets/verticalCategoryTab.dart';

import 'index.dart';

class ClothesPage extends StatefulWidget {
  const ClothesPage({Key? key}) : super(key: key);

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

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
    return Row(
          children: [
            VerticalCategoryTab(
              items: controller.categorys.map((e) => e.name).toList(),
              onChanged: (index) {
                print(index);
              },
            ),

            Expanded(child: Container())
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClothesController>(
      init: ClothesController(),
      id: "clothes",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBar(
            title: "我的衣柜", 
            actions: [
              IconButton(
                icon: const Icon(Icons.add_box_rounded),
                onPressed: () {
                  Get.toNamed(RouteNames.createClothes);
                },
              ),
            ]
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class ChattingViewController extends GetxController {}

class ChattingView extends GetView<ChattingViewController> {
  const ChattingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChattingViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: '1:1 CHECK',
          isEnglishTitle: true,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.off(const MainScreenView());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            MainTitle(
              width: 662,
              text: '궁금하신 점을\n확인하세요.',
            ),
            const SizedBox(height: 60),
            Container(
              width: 662,
              height: 1200,
              decoration: BoxDecoration(
                color: colorScheme.onBackground,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
          ],
        ),
      ),
    );
  }
}



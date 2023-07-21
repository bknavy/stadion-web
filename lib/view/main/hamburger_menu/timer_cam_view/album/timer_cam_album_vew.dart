import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/home_view/main_home_view.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';
import 'package:stadion_project/view/main/mom_level_view/main_mom_level_view.dart';
import 'package:stadion_project/view/main/momster_view/main_momster_view.dart';
import 'package:stadion_project/view/main/numbers_view/main_numbers_view.dart';
import 'package:stadion_project/view/main/wod_view/main_wod_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamAlbumViewController extends GetxController {

  bool isView = true;

  void selectView(bool isView) {
    this.isView = isView;
    update();
  }
}

class TimerCamAlbumView extends GetView<TimerCamAlbumViewController> {
  const TimerCamAlbumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TimerCamAlbumViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: GetBuilder<TimerCamAlbumViewController>(
          builder: (controller) {
            return Column(
              children: [
                //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
                PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: CustomAppBar(
                    title: 'VIDEOS',
                    isEnglishTitle: true,
                    withMenu: true,
                    withAction: true,
                    onLeading: () {
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.selectView(true);
                      },
                      width: 322,
                      height: 70,
                      color: controller.isView? colorScheme.primary : colorScheme.onBackground,
                      text: 'IMAGE VIEW',
                      isSelected: controller.isView? true : false,
                    ),
                    const SizedBox(width: 18),
                    TextTapButton(
                      onTap: () {
                        controller.selectView(false);
                      },
                      width: 322,
                      height: 70,
                      color: controller.isView? colorScheme.onBackground : colorScheme.primary,
                      text: 'LIST VIEW',
                      isSelected: controller.isView? false : true,
                    ),
                  ],
                ),
              ],
            );
          }
      ),
    );
  }
}




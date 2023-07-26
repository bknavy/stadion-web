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
class NoticeEventViewController extends GetxController {

  bool isNotice = true;

  void selectNoticeEvent(bool isNotice)
  {
    this.isNotice = isNotice;
    update();
  }
}

class NoticeEventView extends GetView<NoticeEventViewController> {
  const NoticeEventView({Key? key, required this.isEvent}) : super(key: key);

  final bool isEvent;

  @override
  Widget build(BuildContext context) {
    Get.put(NoticeEventViewController());
    controller.isNotice = isEvent;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: controller.isNotice? '공지사항' : '이벤트',
          isEnglishTitle: false,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.off(const MainScreenView());
          },
        ),
      ),
      body: GetBuilder<NoticeEventViewController>(
        builder: (controller) {
          return Column(
            children: [
              const SizedBox(height: 56),
              const MainTitle(
                width: 662,
                text: '새로운 스타디온 소식을\n확인하세요.',
              ),
              const SizedBox(height: 60),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextTapButton(
                        onTap: () {
                          controller.selectNoticeEvent(true);
                        },
                        width: 322,
                        height: 70,
                        isEnglish: false,
                        color: controller.isNotice? colorScheme.primary : colorScheme.onBackground,
                          text: '공지사항',
                        isSelected: controller.isNotice? true : false,
                      ),
                      const SizedBox(width: 18),
                      TextTapButton(
                        onTap: () {
                          controller.selectNoticeEvent(false);
                        },
                        width: 322,
                        height: 70,
                        isEnglish: false,
                        color: controller.isNotice? colorScheme.onBackground : colorScheme.primary,
                        text: '이벤트',
                        isSelected: controller.isNotice? false : true,
                      ),
                    ],
                  ),
            ],
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 190,
          child: Column(
            children: [
              Container(
                width: 662,
                height: 2,
                color: colorScheme.shadow,
              ),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}


class buildGestureDetector extends StatelessWidget {
  const buildGestureDetector({
    required this.text,
    this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 322,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Text(
          text,
          style:
          textThemeKo.labelLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}



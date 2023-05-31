import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

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
  const NoticeEventView({Key? key, required this.isNotice}) : super(key: key);

  final bool isNotice;

  @override
  Widget build(BuildContext context) {
    Get.put(NoticeEventViewController());
    controller.isNotice = isNotice;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          GetBuilder<NoticeEventViewController>(
              builder: (controller) {
              return CustomAppBar(
                title: controller.isNotice? '공지사항' : '이벤트',
                isEnglishTitle: false,
                withAction: true,
                onLeadingSearch: () {},
                onLeadingImage: () {},
                onLeading: () {
                  //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
                  Get.off(const MainScreenView());
                },
              );
            }
          ),
          const SizedBox(height: 56),
          const MainTitle(
            width: 662,
            text: '새로운 스타디온 소식을\n확인하세요.',
          ),
          const SizedBox(height: 60),
          GetBuilder<NoticeEventViewController>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTapButton(
                    onTap: () {
                      controller.selectNoticeEvent(true);
                    },
                    width: 322,
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
                    isEnglish: false,
                    color: controller.isNotice? colorScheme.onBackground : colorScheme.primary,
                    text: '이벤트',
                    isSelected: controller.isNotice? false : true,
                  ),
                ],
              );
            }
          ),
        ],
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



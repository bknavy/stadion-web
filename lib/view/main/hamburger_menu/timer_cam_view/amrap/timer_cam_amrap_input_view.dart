import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/wod_view/popup/wod_box_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamAmrapInputViewController extends GetxController {
  static const String MainTimerCamView_Amrap_TotalTime =
      '1ROUNG OF EMOM\nTOTAL TIME : 05:00';

  final List<int> AmrapSelectedList = List.generate(99, (index) => index + 1);
  int _selectedAmrap = 1;
}

class TimerCamAmrapInputView extends GetView<TimerCamAmrapInputViewController> {
  const TimerCamAmrapInputView(
      {Key? key,
      required this.applyAmrapAtSub,
      required this.applyRestMinAtSub,
      required this.applyMinuteAtSub})
      : super(key: key);

  final Function(String) applyAmrapAtSub;
  final Function(String) applyRestMinAtSub;
  final Function(String) applyMinuteAtSub;

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamAmrapInputViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          ///배경화면
          Image.asset(
            'assets/images/timer_cam.png',
            width: 750,
            height: 1462,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/timer_cam_black.png',
            width: 750,
            height: 1462,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.9),
          ),

          ///엡바
          PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(
              title: 'TIMER CAM',
              isEnglishTitle: true,
              withMenu: true,
              withAction: true,
              onDarkTheme: true,
              onLeading: () {
                Get.back();
              },
            ),
          ),

          ///페이지 내용
          Positioned(
            child: Column(
              children: [
                const SizedBox(height: 200),
                Row(
                  children: [
                    const SizedBox(width: 94),
                    ViewContainer(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      color: colorScheme.primary,
                      child: TitleSmallText(
                        text: 'EMOM',
                        fontWeight: FontWeight.w600,
                        color: colorScheme.background,
                        letterSpacing: -2.4,
                      ),
                    ),
                    ViewContainer(
                      width: 402,
                      height: 80,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: HeadlineSmallText(
                        text: TimerCamAmrapInputViewController
                            .MainTimerCamView_Amrap_TotalTime,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.background,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ViewContainer(
                  width: 662,
                  height: 37,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: HeadlineSmallText(
                    text: 'EVERY MINUTE ON A MINUTE',
                    //textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.background,
                  ),
                ),
                const SizedBox(height: 60),
                const SizedBox(height: 230),
                Row(
                  children: [
                    const SizedBox(width: 285),
                    Column(
                      children: [
                        Container(
                          width: 180,
                          height: 2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0x00ffffff),
                                const Color(0xff848484),
                                const Color(0x00ffffff)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 142),
                        Container(
                          width: 180,
                          height: 2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0x00ffffff),
                                const Color(0xff848484),
                                const Color(0x00ffffff)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    LabelLargeText(
                      text: 'M',
                      fontWeight: FontWeight.w300,
                      color: colorScheme.background,
                    ),
                  ],
                ),
                const SizedBox(height: 260),
              ],
            ),
          ),

          ///CupertinoPicker 스타일
          Positioned(
            top: 340,
            left: 285,
            child: Container(
              width: 200,
              height: 800,
              child: CupertinoPicker(
                magnification: 2.5,
                squeeze: 0.5,
                itemExtent: 50,
                selectionOverlay: null,
                onSelectedItemChanged: (int selectedItem) {
                  controller._selectedAmrap = selectedItem + 1;
                },
                children: List<Widget>.generate(
                    controller.AmrapSelectedList.length, (int index) {
                  return Center(
                    child: Text(
                      controller.AmrapSelectedList[index].toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          ///저장버튼
          Positioned(
            top: 1013,
            left: 111,
            child: ButtonWithRollover(
              onTap: () {
                if (controller._selectedAmrap == 0) {
                  applyAmrapAtSub(controller._selectedAmrap.toString());
                  applyRestMinAtSub(controller._selectedAmrap.toString());
                  applyMinuteAtSub(controller._selectedAmrap.toString());
                } else {
                  applyAmrapAtSub(controller._selectedAmrap.toString());
                  applyRestMinAtSub(controller._selectedAmrap.toString());
                  applyMinuteAtSub(controller._selectedAmrap.toString());
                }
                Get.back();
              },
              backgroundColor: colorScheme.background,
              child: Center(
                child: Text(
                  '선택하기',
                  style: textThemeKo.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.surfaceVariant,
                  ),
                ),
              ),
            ),
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

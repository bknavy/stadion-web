import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamForTimeInputViewController extends GetxController {
  static const String MainTimerCamView_ForTime_TotalTime =
      '3 X ROUND FOR TIME\nTOTAL TIME : 05:00';

  final List<int> ForTimeSelectedList = List.generate(99, (index) => index + 1);
  int _selectedForTime = 1;
}

class TimerCamForTimeInputView
    extends GetView<TimerCamForTimeInputViewController> {
  const TimerCamForTimeInputView(
      {Key? key,
      required this.applyForTimeAtSub,
      required this.applySetsAtSub,
      required this.applyMinuteAtSub,
      required this.applySecondAtSub})
      : super(key: key);

  final Function(String) applyForTimeAtSub;
  final Function(String) applySetsAtSub;
  final Function(String) applyMinuteAtSub;
  final Function(String) applySecondAtSub;

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamForTimeInputViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          ///배경화면
          Image.asset(
            'assets/images/timer_cam_for_time.png',
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
                      color: Color(0xff96da45),
                      child: TitleSmallText(
                        text: 'FOR\nTIME',
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
                        text: TimerCamForTimeInputViewController
                            .MainTimerCamView_ForTime_TotalTime,
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
                    text: 'FOR TIME',
                    //textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.background,
                  ),
                ),
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
              height: 680,
              child: CupertinoPicker(
                magnification: 2.5,
                squeeze: 0.5,
                itemExtent: 50,
                selectionOverlay: null,
                onSelectedItemChanged: (int selectedItem) {
                  controller._selectedForTime = selectedItem + 1;
                },
                children: List<Widget>.generate(
                    controller.ForTimeSelectedList.length, (int index) {
                  return Center(
                    child: Text(
                      controller.ForTimeSelectedList[index].toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff96da45),
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
                if (controller._selectedForTime == 0) {
                  applyForTimeAtSub(controller._selectedForTime.toString());
                  applySetsAtSub(controller._selectedForTime.toString());
                  applyMinuteAtSub(controller._selectedForTime.toString());
                  applySecondAtSub(controller._selectedForTime.toString());
                } else {
                  applyForTimeAtSub(controller._selectedForTime.toString());
                  applySetsAtSub(controller._selectedForTime.toString());
                  applyMinuteAtSub(controller._selectedForTime.toString());
                  applySecondAtSub(controller._selectedForTime.toString());
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

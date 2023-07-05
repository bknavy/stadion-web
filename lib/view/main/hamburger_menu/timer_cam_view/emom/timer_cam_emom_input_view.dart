import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamEmomInputViewController extends GetxController {
  static const String MainTimerCamView_Emom_TotalTime =
      '1ROUNG OF EMOM\nTOTAL TIME : 05:00';

  final List<int> EmomSelectedList = List.generate(60, (index) => index + 1);
  int _selectedEmom = 1;
}

class TimerCamEmomInputView extends GetView<TimerCamEmomInputViewController> {
  const TimerCamEmomInputView(
      {Key? key,
      required this.applyTimeCapAtSub,
      required this.applyForAtSub,
      required this.applySetsAtSub,
      required this.applyMinuteAtSub,
      required this.applySecondAtSub})
      : super(key: key);

  final Function(String) applyTimeCapAtSub;
  final Function(String) applyForAtSub;
  final Function(String) applySetsAtSub;
  final Function(String) applyMinuteAtSub;
  final Function(String) applySecondAtSub;

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamEmomInputViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          ///배경화면
          Image.asset(
            'assets/images/timer_cam_emom.png',
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    'TIMER CAM',
                    style: TextStyle(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: colorScheme.background,
                    size: 50,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 50,
                      ),
                      color: colorScheme.background,
                    ),
                    //SizedBox(width: 18),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.image_outlined,
                        size: 50,
                      ),
                      color: colorScheme.background,
                    ),
                  ]),
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
                      color: colorScheme.tertiary,
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
                        text: TimerCamEmomInputViewController
                            .MainTimerCamView_Emom_TotalTime,
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
                  controller._selectedEmom = selectedItem + 1;
                },
                children: List<Widget>.generate(
                    controller.EmomSelectedList.length, (int index) {
                  return Center(
                    child: Text(
                      controller.EmomSelectedList[index].toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.tertiary,
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
                if (controller._selectedEmom == 0) {
                  applyTimeCapAtSub(controller._selectedEmom.toString());
                  applyForAtSub(controller._selectedEmom.toString());
                  applySetsAtSub(controller._selectedEmom.toString());
                  applyMinuteAtSub(controller._selectedEmom.toString());
                  applySecondAtSub(controller._selectedEmom.toString());
                } else {
                  applyTimeCapAtSub(controller._selectedEmom.toString());
                  applyForAtSub(controller._selectedEmom.toString());
                  applySetsAtSub(controller._selectedEmom.toString());
                  applyMinuteAtSub(controller._selectedEmom.toString());
                  applySecondAtSub(controller._selectedEmom.toString());
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

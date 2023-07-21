import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamForTimeTimerViewController extends GetxController {
  static const String MainTimerCamView_ForTome_count = 'SET 1/2\nROUND 1';

  final CountDownController TimeController = CountDownController();

  bool _isRunning = false;

  void _clickButton() {
    _isRunning = !_isRunning; // 상태 반전

    if (_isRunning) {
      //_startTimer();
      TimeController.restart();
      update();
    } else {
      //_stopTimer();
      TimeController.pause();
      update();
    }
  }
}

class TimerCamForTimeTimerView extends GetView<TimerCamForTimeTimerViewController> {
  const TimerCamForTimeTimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamForTimeTimerViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: GetBuilder<TimerCamForTimeTimerViewController>(builder: (controller) {
        return Stack(
          children: [
            ///바탕 이미지
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
              opacity: AlwaysStoppedAnimation(0.8),
            ),
            Center(
              child: Image.asset(
                'assets/images/timer_cam_for_time_count.png',
                width: 562,
                height: 562,
                //fit: BoxFit.cover,
              ),
            ),

            ///appbar
            PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                title: '',
                isEnglishTitle: true,
                withMenu: true,
                withAction: false,
                onDarkTheme: true,
                onLeading: () {
                  Get.back();
                },
              ),
            ),

            ///stop watch 마크 및 서클 타이머
            Positioned(
              top: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 94),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ViewContainer(
                          width: 80,
                          height: 80,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Color(0xff96da45),
                          alignment: Alignment.center,
                          child: TitleSmallText(
                            text: 'FOR\nTIME',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.background,
                            letterSpacing: -2.4,
                          ),
                        ),
                        SizedBox(width: 81),
                        SizedBox(
                          width: 402,
                          height: 80,
                          child: HeadlineSmallText(
                            text: TimerCamForTimeTimerViewController.MainTimerCamView_ForTome_count,
                            textAlign: TextAlign.end,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.background,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 155),
                    GestureDetector(
                      onTap: () {
                        controller._clickButton();
                      },
                      child: Container(
                        width: 562,
                        height: 562,
                        child: Stack(
                          children: [
                            NeonCircularTimer(
                              onComplete: () {
                                controller.TimeController.restart();
                              },
                              width: 540,
                              duration: 160,
                              strokeWidth: 23,
                              controller: controller.TimeController,
                              isReverse: true,
                              isTimerTextShown: true,
                              textStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Color(0xff96da45),
                              ),
                              neumorphicEffect: false,
                              autoStart: false,
                              outerStrokeColor: Colors.transparent,
                              innerFillGradient: LinearGradient(colors: [
                                Color(0xff96da45),
                                Color(0xff96da45),
                              ]),
                              neonGradient: LinearGradient(colors: [
                                Color(0xff96da45),
                                Color(0xff96da45),
                              ]),
                              strokeCap: StrokeCap.round,
                            ),
                            Positioned(
                              top: 401,
                              child: Container(
                                width: 562,
                                height: 36,
                                alignment: Alignment.center,
                                child: HeadlineSmallText(
                                  text: controller._isRunning
                                      ? '탭하면 정지합니다!'
                                      : '탭하면 시작합니다!',
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.background,
                                  letterSpacing: -1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icons/timer_cam_recording_circular.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    HeadlineSmallText(
                      text: '비디오 녹화 중',
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background,
                      letterSpacing: -1.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
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

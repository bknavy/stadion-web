import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamTabataTimerViewController extends GetxController {
  static const String MainTimerCamView_Tabata_count = 'SET 1/2\nROUND 1';
  static const String MainTimerCamView_Tabata_time = '10 MINUTES';

  final CountDownController TimeController = CountDownController();

  bool _isRunning = false;

  void _clickButton() {
    _isRunning = !_isRunning; // 상태 반전

    if (_isRunning) {
      TimeController.restart();
      update();
    } else {
      TimeController.pause();
      update();
    }
  }
}

class TimerCamTabataTimerView extends GetView<TimerCamTabataTimerViewController> {
  const TimerCamTabataTimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamTabataTimerViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: GetBuilder<TimerCamTabataTimerViewController>(builder: (controller) {
        return Stack(
          children: [
            ///바탕 이미지
            Image.asset(
              'assets/images/timer_cam_tabata.png',
              width: 750,
              height: 1462,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/timer_cam_black.png',
              width: 750,
              height: 1462,
              fit: BoxFit.cover,
              opacity: AlwaysStoppedAnimation(0.2),
            ),
            Center(
              child: Image.asset(
                'assets/images/timer_cam_stopwatch.png',
                width: 562,
                height: 562,
                //fit: BoxFit.cover,
              ),
            ),

            ///appbar
            PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: colorScheme.background,
                    size: 50,
                  ),
                ),
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
                          color: colorScheme.secondary,
                          alignment: Alignment.center,
                          child: TitleSmallText(
                            text: 'EMOM',
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
                            text: TimerCamTabataTimerViewController
                                .MainTimerCamView_Tabata_count,
                            textAlign: TextAlign.end,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.background,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    HeadlineLargeText(
                      text: TimerCamTabataTimerViewController.MainTimerCamView_Tabata_time,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background,
                    ),
                    const SizedBox(height: 40),
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
                              duration: 60,
                              strokeWidth: 23,
                              controller: controller.TimeController,
                              isReverse: true,
                              isTimerTextShown: controller._isRunning ? true : false,
                              textStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.secondary,
                              ),
                              neumorphicEffect: false,
                              autoStart: false,
                              outerStrokeColor: Colors.transparent,
                              innerFillGradient: LinearGradient(colors: [
                                colorScheme.secondary,
                                colorScheme.secondary,
                              ]),
                              neonGradient: LinearGradient(colors: [
                                colorScheme.secondary,
                                colorScheme.secondary,
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
                        'assets/icons/timer_cam_recording.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    HeadlineSmallText(
                      text: '비디오 녹화 시작',
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background,
                      letterSpacing: -1.5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                child: GestureDetector(
                  onTap: () {
                    controller._clickButton();
                  },
                  child: Center(
                    child: controller._isRunning ? null :
                    Image.asset(
                      'assets/images/timer_cam_tabata_tap.png'
                    ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/amrap/timer_cam_amrap_input_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/amrap/timer_cam_amrap_timer_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamAmrapViewController extends GetxController {
  static const String MainTimerCamView_Amrap_TotalTime =
      '1ROUNG AMRAP\nTOTAL TIME : 10:00';

  var amrapTimeController = TextEditingController();
  var restMinController = TextEditingController();
  var minuteController = TextEditingController();

  bool amrapShow = false;
  bool restMinShow = false;
  bool minuteShow = false;
  bool isSetsAddition = false;

  String isAmrap = '';
  String isRestMin = '';
  String isMinute = '';

  void selectSets(bool isSetsAddition) {
    this.isSetsAddition = isSetsAddition;
    update();
  }

  void applyAmrap(String value) {
    isAmrap = value;
    amrapTimeController.text = '${isAmrap}';
    update();
  }

  void applyRestMin(String value) {
    isRestMin = value;
    restMinController.text = '${isRestMin}';
    update();
  }

  void applyMinute(String value) {
    isMinute = value;
    minuteController.text = '${isMinute}';
    update();
  }

  void amrapField(bool amrapShow) {
    this.amrapShow = amrapShow;
    update();
  }

  void restMinField(bool restMinShow) {
    this.restMinShow = restMinShow;
    update();
  }

  void minuteField(bool minuteShow) {
    this.minuteShow = minuteShow;
    update();
  }

  void AmrapFind() {
    Get.dialog(
      TimerCamAmrapInputView(
        applyAmrapAtSub: applyAmrap,
        applyRestMinAtSub: (String) {},
        applyMinuteAtSub: (String) {},
      ),
      barrierColor: Colors.transparent,
    );
  }

  void RestMinFind() {
    Get.dialog(
      TimerCamAmrapInputView(
        applyAmrapAtSub: (String) {},
        applyRestMinAtSub: applyRestMin,
        applyMinuteAtSub: (String) {},
      ),
      barrierColor: Colors.transparent,
    );
  }

  void MinuteFind() {
    Get.dialog(
      TimerCamAmrapInputView(
        applyAmrapAtSub: (String) {},
        applyRestMinAtSub: (String) {},
        applyMinuteAtSub: applyMinute,
      ),
      barrierColor: Colors.transparent,
    );
  }

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem() {
    _key.currentState!.removeItem(0, (context, animation) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    });
  }
}

class TimerCamAmrapView extends GetView<TimerCamAmrapViewController> {
  const TimerCamAmrapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamAmrapViewController());
    return GetBuilder<TimerCamAmrapViewController>(builder: (controller) {
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
                opacity: AlwaysStoppedAnimation(0.8),
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
                          color: colorScheme.primary,
                          child: TitleSmallText(
                            text: 'AMRAP',
                            textAlign: TextAlign.center,
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
                            text: TimerCamAmrapViewController
                                .MainTimerCamView_Amrap_TotalTime,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.background,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    ViewContainer(
                      width: 662,
                      height: 37,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: HeadlineSmallText(
                        text: 'AS MANY ROUNDS AS POSSIBLE',
                        //textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.background,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const SizedBox(width: 260),
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
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              controller: controller.amrapTimeController,
                              onTap: () {
                                controller.AmrapFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.primary,
                              ),
                              hintText: '00',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 10),
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
                    const SizedBox(height: 15),
                    buildSetAddition(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller._addItem();
                            controller.selectSets(true);
                          },
                          child: LabelLargeText(
                            text: 'SET 추가',
                            color: colorScheme.background,
                          ),
                        ),
                        const SizedBox(width: 11),
                        GestureDetector(
                          onTap: () {
                            controller._addItem();
                            controller.selectSets(true);
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 45,
                            color: colorScheme.background,
                          ),
                        ),
                      ],
                    ),
                    controller.isSetsAddition
                        ? const SizedBox(height: 90)
                        : const SizedBox(height: 555),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/icons/timer_cam_camera.png'),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: LabelLargeText(
                            text: '비디오 촬영',
                            color: colorScheme.background,
                          ),
                        ),
                        const SizedBox(width: 11),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.check_circle_outline,
                            size: 45,
                            color: colorScheme.background,
                          ),
                        ),
                      ],
                    ),
                    if (controller.isSetsAddition)
                      Column(
                        children: [
                          const SizedBox(height: 40),
                          ButtonWithRollover(
                            onTap: () {
                              Get.to(const TimerCamAmrapTimerView());
                            },
                            backgroundColor: colorScheme.primary,
                            child: Center(
                              child: Text(
                                '기록하기',
                                style: textThemeKo.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.shadow,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                  ],
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
    );
  }

  buildSetAddition() {
    return AnimatedList(
        key: controller._key,
        initialItemCount: 0,
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(94, 30, 94, 0),
              child: Container(
                width: 562,
                height: 390,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: colorScheme.background, width: 1),
                    bottom: BorderSide(color: colorScheme.background, width: 1),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            const SizedBox(width: 195),
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
                                const SizedBox(height: 12),
                                MainScreenPopupTextFormField(
                                  width: 120,
                                  height: 81,
                                  color: Colors.transparent,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.restMinField(true);
                                    } else {
                                      controller.restMinField(false);
                                    }
                                  },
                                  onTap: () {
                                    controller.RestMinFind();
                                  },
                                  controller: controller.restMinController,
                                  style: textThemeEn.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.primary,
                                  ),
                                  hintText: '00',
                                  hintStyle: textThemeEn.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 4),
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
                              fontWeight: FontWeight.w400,
                              color: colorScheme.background,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const SizedBox(width: 195),
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
                                const SizedBox(height: 5),
                                MainScreenPopupTextFormField(
                                  width: 160,
                                  height: 142,
                                  color: Colors.transparent,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.minuteField(true);
                                    } else {
                                      controller.minuteField(false);
                                    }
                                  },
                                  onTap: () {
                                    controller.MinuteFind();
                                  },
                                  controller: controller.minuteController,
                                  style: textThemeEn.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.primary,
                                  ),
                                  hintText: '00',
                                  hintStyle:
                                  textThemeEn.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 5),
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
                              fontWeight: FontWeight.w400,
                              color: colorScheme.background,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 9,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              HeadlineSmallText(
                                text: '2 AMRAP',
                                fontWeight: FontWeight.w600,
                                color: colorScheme.background,
                              ),
                              const SizedBox(width: 383),
                              GestureDetector(
                                onTap: () {
                                  controller._removeItem();
                                  controller.selectSets(false);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.close,
                                    size: 50,
                                    color: colorScheme.background,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 562,
                            height: 34,
                            child: LabelLargeText(
                              text: "REST",
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              color: colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/timer_cam_emom_count_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/timer_cam_emom_forinput_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/timer_cam_emom_timercapinput_view.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/wod_view/popup/wod_box_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamEmomViewController extends GetxController {
  static const String MainTimerCamView_Emom_TotalTime =
      '1ROUNG OF EMOM\nTOTAL TIME : 05:00';

  var timeCapController = TextEditingController();
  var forController = TextEditingController();
  var setsController = TextEditingController();
  var minuteController = TextEditingController();
  var secondController = TextEditingController();

  bool timeCapShow = false;
  bool forShow = false;
  bool setsShow = false;
  bool minuteShow = false;
  bool secondShow = false;
  bool isSetsAddition = false;

  String isTimeCap = '';
  String isFor = '';
  String isSets = '';
  String isMinute = '';
  String isSecond = '';

  void selectSets(bool isSetsAddition) {
    this.isSetsAddition = isSetsAddition;
    update();
  }

  void applyTimeCap(String value) {
    isTimeCap = value;
    timeCapController.text = '${isTimeCap}';
    update();
  }

  void applyFor(String value) {
    isFor = value;
    forController.text = '${isFor}';
    update();
  }

  void applySets(String value) {
    isSets = value;
    setsController.text = '${isSets}';
    update();
  }

  void applyMinute(String value) {
    isMinute = value;
    minuteController.text = '${isMinute}';
    update();
  }

  void applySecond(String value) {
    isSecond = value;
    secondController.text = '${isSecond}';
    update();
  }

  void timeCapField(bool timeCapShow) {
    this.timeCapShow = timeCapShow;
    update();
  }

  void forField(bool forShow) {
    this.forShow = forShow;
    update();
  }

  void setsField(bool setsShow) {
    this.setsShow = setsShow;
    update();
  }

  void minuteField(bool minuteShow) {
    this.minuteShow = minuteShow;
    update();
  }

  void secondField(bool secondShow) {
    this.secondShow = secondShow;
    update();
  }

  void TimerCapFind() {
    Get.dialog(
      TimerCamEmomTimewCapInputView(applyTimeCapAtSub: applyTimeCap),
      barrierColor: Colors.transparent,
    );
  }

  void ForFind() {
    Get.dialog(
      TimerCamEmomForInputView(applyForAtSub: applyFor),
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

class TimerCamEmomView extends GetView<TimerCamEmomViewController> {
  const TimerCamEmomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamEmomViewController());
    return GetBuilder<TimerCamEmomViewController>(builder: (controller) {
        return Scaffold(
          backgroundColor: colorScheme.background,
          body: SingleChildScrollView(
              child: Stack(
                children: [
                  ///배경화면
                  Image.asset(
                    controller.isSetsAddition
                        ? 'assets/images/timer_cam_emom_sets.png'
                        : 'assets/images/timer_cam_emom.png',
                    width: 750,
                    //height: 1462,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    controller.isSetsAddition
                        ? 'assets/images/timer_cam_black_after.png'
                        : 'assets/images/timer_cam_black.png',
                    width: 750,
                    //height: 1462,
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
                                text: TimerCamEmomViewController
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
                        const SizedBox(height: 60),
                        ViewContainer(
                          width: 662,
                          height: 37,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: HeadlineSmallText(
                            text: 'TIME CAP',
                            //textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 27),
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
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.timeCapField(true);
                                    } else {
                                      controller.timeCapField(false);
                                    }
                                  },
                                  onTap: () {
                                    controller.TimerCapFind();
                                  },
                                  controller: controller.timeCapController,
                                  style: textThemeEn.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
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
                        const SizedBox(height: 50),
                        ViewContainer(
                          width: 662,
                          height: 37,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: HeadlineSmallText(
                            text: 'FOR',
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 27),
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
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.forField(true);
                                    } else {
                                      controller.forField(false);
                                    }
                                  },
                                  onTap: () {
                                    controller.ForFind();
                                  },
                                  controller: controller.forController,
                                  style: textThemeEn.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
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
                            ? const SizedBox(height: 80)
                            : const SizedBox(height: 230),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset('assets/icons/emom_camera.png'),
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
                                  Get.to(const TimerCamEmomCountView());
                                },
                                backgroundColor: colorScheme.tertiary,
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
                              const SizedBox(height: 90),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          bottomNavigationBar: controller.isSetsAddition ? null : Padding(
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
                height: 455,
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
                        const SizedBox(height: 45),
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
                                      controller.setsField(true);
                                    } else {
                                      controller.setsField(false);
                                    }
                                  },
                                  onTap: () {
                                    //controller.TimerCapFind();
                                  },
                                  controller: controller.setsController,
                                  style: textThemeEn.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
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
                              text: 'SETS',
                              fontWeight: FontWeight.w400,
                              color: colorScheme.background,
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
                            text: 'SET REST',
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 90),
                            Column(
                              children: [
                                Container(
                                  width: 160,
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
                                    //controller.TimerCapFind();
                                  },
                                  controller: controller.minuteController,
                                  style: textThemeEn.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
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
                                  width: 160,
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
                            const SizedBox(width: 44),
                            Column(
                              children: [
                                Container(
                                  width: 160,
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
                                    //controller.TimerCapFind();
                                  },
                                  controller: controller.minuteController,
                                  style: textThemeEn.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
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
                                  width: 160,
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
                              text: 'S',
                              fontWeight: FontWeight.w400,
                              color: colorScheme.background,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

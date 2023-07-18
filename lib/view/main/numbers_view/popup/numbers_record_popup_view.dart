import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_date_popup_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_deadlift_popup_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_ibTime_record_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class NumbersRecordPopupViewController extends GetxController {

  var dateController = TextEditingController();
  var deadliftController = TextEditingController();
  var lbController = TextEditingController();
  var timeController = TextEditingController();

  bool dateShow = false;
  bool deadliftShow = false;
  bool lbShow = false;
  bool timeShow = false;

  String isYear = '';
  String isMonth = '';
  String isDay = '';
  String isDeadlift = '';
  String isLb = '';
  String isTime = '';

  void dateField(bool dateShow) {
    this.dateShow = dateShow;
    update();
  }

  void deadliftField(bool deadliftShow) {
    this.deadliftShow = deadliftShow;
    update();
  }

  void lbField(bool lbShow) {
    this.lbShow = lbShow;
    update();
  }

  void timeField(bool timeShow) {
    this.timeShow = timeShow;
    update();
  }

  void applyDate(String valueYear, String valueMonth, String valueDay) {
    isYear = valueYear;
    isMonth = valueMonth;
    isDay = valueDay;
    dateController.text = '${isMonth}/${isDay}/${isYear}';
    update();
  }

  void applyDeadlidt(String value) {
    isDeadlift = value;
    deadliftController.text = '${isDeadlift} SQUAT';
    update();
  }

  void applyLb(String value) {
    isLb = value;
    lbController.text = '${isLb}';
    update();
  }

  void applyTime(String value) {
    isTime = value;
    timeController.text = '${isTime}';
    update();
  }

  void DateFind() {
    Get.dialog(
      DatePopupView(applyDateAtSub: applyDate),
      barrierColor: Colors.transparent,
    );
  }

  void DeadliftFind() {
    Get.dialog(
      NumbersDeadliftPopupView(applyDeadliftAtSub: applyDeadlidt),
      barrierColor: Colors.transparent,
    );
  }

  void LbTimeFind() {
    Get.dialog(
      NumbersLbTimeRecordPopupView(applyLbAtSub: applyLb, applyTimeAtSub: applyTime),
      barrierColor: Colors.transparent,
    );
  }

  int? defaultChoiceIndex;
  final List<String> _choicesList = [
    '1RM', '3RM', '5RM'
  ];

  void selectIndex(index, value) {

    defaultChoiceIndex = value ? index : null;
    update();
  }
}

class NumbersRecordPopupView extends GetView<NumbersRecordPopupViewController> {
  const NumbersRecordPopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NumbersRecordPopupViewController());
    return GetBuilder<NumbersRecordPopupViewController>(builder: (controller) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: const Alignment(0.0, -0.75),
        shadowColor: colorScheme.shadow.withOpacity(0.1),
        content: Stack(
          children: [
            ///바탕 스타일
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  width: 662,
                  height: 1136,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.onSurface.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1a000000),
                        offset: Offset(6, 6),
                        blurRadius: 6,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///popup 스타일
            Container(
              width: 662,
              height: 1136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    const SizedBox(height: 100),

                    ///종목 선택
                    MainScreenPopupTextFormField(
                      width: 562,
                      height: 50,
                      color: Colors.transparent,
                      onTap: () {
                        controller.DeadliftFind();
                      },
                      style: textThemeEn.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.shadow,
                      ),
                      controller: controller.deadliftController,
                      hintText: 'DEADLIFT',
                      hintStyle: textThemeEn.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.shadow,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {
                          controller.DeadliftFind();
                        },
                        alignment: Alignment.topLeft,
                        icon: Icon(
                          Icons.check,
                          color: Colors.transparent,
                          size: 1,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.DeadliftFind();
                        },
                        icon: Icon(
                          Icons.check,
                          color: colorScheme.shadow,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 33),

                    ///날짜 선택
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelLargeText(
                          text: 'DATE',
                          fontWeight: FontWeight.w600,
                        ),
                        MainScreenPopupTextFormField(
                          width: 398,
                          height: 70,
                          style: textThemeEn.labelLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: colorScheme.shadow,
                          ),
                          color: colorScheme.background,
                          controller: controller.dateController,
                          onTap: () {
                            controller.DateFind();
                          },
                          hintText: '09/22/2022',
                          hintStyle: textThemeEn.labelLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: colorScheme.shadow,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),

                    ///RM 선택
                    Wrap(
                      spacing: 21,
                      //direction: Axis.horizontal,
                      children: List.generate(controller._choicesList.length, (index) {
                        return ChoiceChip(
                          labelPadding: EdgeInsets.fromLTRB(53, 8, 53, 8),
                          label: LabelLargeText(
                            text: controller._choicesList[index],
                            fontWeight: FontWeight.w300,
                          ),
                          selected: controller.defaultChoiceIndex == index,
                          selectedColor: colorScheme.primary,
                          backgroundColor: colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onSelected: (value) {
                            controller.selectIndex(index, value);
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: 76),

                    ///lb 배경
                    Row(
                      children: [
                        const SizedBox(width: 161),
                        Column(
                          children: [
                            Container(
                              width: 240,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  //begin: Alignment(0,0.5),
                                  //end: Alignment(1,0.5),
                                  colors: [
                                    Color(0x00ffffff),
                                    Color(0xff848484),
                                    Color(0x00ffffff)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              onTap: () {
                                controller.LbTimeFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.shadow,
                              ),
                              hintText: '000',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.shadow,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 240,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  //begin: Alignment(0,0.5),
                                  //end: Alignment(1,0.5),
                                  colors: [
                                    Color(0x00ffffff),
                                    Color(0xff848484),
                                    Color(0x00ffffff)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        LabelLargeText(
                          text: 'lb',
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),

                    ///time 배경
                    Row(
                      children: [
                        const SizedBox(width: 161),
                        Column(
                          children: [
                            Container(
                              width: 240,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  //begin: Alignment(0,0.5),
                                  //end: Alignment(1,0.5),
                                  colors: [
                                    Color(0x00ffffff),
                                    Color(0xff848484),
                                    Color(0x00ffffff)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              onTap: () {
                                controller.LbTimeFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.shadow,
                              ),
                              hintText: '000',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.shadow,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 240,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  //begin: Alignment(0,0.5),
                                  //end: Alignment(1,0.5),
                                  colors: [
                                    Color(0x00ffffff),
                                    Color(0xff848484),
                                    Color(0x00ffffff)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        LabelLargeText(
                          text: 'TIME',
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///저장버튼
            Positioned(
              top: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 592),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.close,
                            size: 50,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 886),
                  ButtonWithRollover(
                    onTap: () {
                      Get.back();
                    },
                    backgroundColor: colorScheme.background,
                    child: Center(
                      child: Text(
                        '저장하기',
                        style: textThemeKo.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.surfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

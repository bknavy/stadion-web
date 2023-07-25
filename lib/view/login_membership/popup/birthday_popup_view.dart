import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import '../../../style_config/text_theme.dart';
import '../../custom_widget/buttons/button_with_rollover.dart';
import '../../custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class BirthdayPopupViewController extends GetxController {
  final List<int> YearSelectedList =
      List.generate(200, (index) => index + 1900);
  final List<int> MonthSelectedList = List.generate(12, (index) => index + 1);
  final List<int> DaySelectedList = List.generate(31, (index) => index + 1);
  FixedExtentScrollController YearController =
      FixedExtentScrollController(initialItem: 100);
  int _selectedYear = 2000;
  int _selectedMonth = 1;
  int _selectedDay = 1;
}

class BirthdayPopupView extends GetView<BirthdayPopupViewController> {
  const BirthdayPopupView({Key? key, required this.applyBirthdayAtSub})
      : super(key: key);

  final Function(String, String, String) applyBirthdayAtSub;

  @override
  Widget build(BuildContext context) {
    Get.put(BirthdayPopupViewController());
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: const Alignment(0.0, -0.6),
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
                height: 1032,
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
            height: 1032,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                SizedBox(height: 100),
                PopupText(text: '생년월일'),
                const SizedBox(height: 84),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    Column(
                      children: [
                        PopupText(text: 'M'),
                        const SizedBox(height: 190),
                        Container(
                          width: 180,
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
                        const SizedBox(height: 142),
                        Container(
                          width: 180,
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
                    const SizedBox(width: 11),
                    Column(
                      children: [
                        PopupText(text: 'D'),
                        const SizedBox(height: 190),
                        Container(
                          width: 180,
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
                        const SizedBox(height: 142),
                        Container(
                          width: 180,
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
                    const SizedBox(width: 11),
                    Column(
                      children: [
                        PopupText(text: 'Y'),
                        const SizedBox(height: 190),
                        Container(
                          width: 180,
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
                        const SizedBox(height: 142),
                        Container(
                          width: 180,
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
                    const SizedBox(width: 50),
                  ],
                ),
              ],
            ),
          ),

          ///CupertinoPicker 스타일
          Positioned(
            child: Row(
              children: [
                const SizedBox(width: 50),
                Container(
                  height: 1030,
                  width: 180,
                  child: CupertinoPicker(
                    //scrollController: controller.MonthController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedMonth = selectedItem + 1;
                    },
                    children: List<Widget>.generate(
                        controller.MonthSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.MonthSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 11),
                Container(
                  height: 1030,
                  width: 180,
                  child: CupertinoPicker(
                    //scrollController: controller.DayController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedDay = selectedItem + 1;
                    },
                    children: List<Widget>.generate(
                        controller.DaySelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.DaySelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 11),
                Container(
                  height: 1030,
                  width: 180,
                  child: CupertinoPicker(
                    //scrollController: controller.YearController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedYear = selectedItem + 1900;
                    },
                    children: List<Widget>.generate(
                        controller.YearSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.YearSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
          ),

          ///단기버튼
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
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
          ),

          ///저장버튼
          Positioned(
            top: 850,
            left: 50,
            right: 50,
            child: ButtonWithRollover(
              onTap: () {
                if (controller._selectedYear == 0) {
                  applyBirthdayAtSub(
                      controller._selectedYear.toString(),
                      controller._selectedMonth.toString(),
                      controller._selectedDay.toString());
                } else {
                  applyBirthdayAtSub(
                      controller._selectedYear.toString(),
                      controller._selectedMonth.toString(),
                      controller._selectedDay.toString());
                }
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
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class MomLevelRecordPopupViewController extends GetxController {
  final List<int> HourSelectedList = List.generate(24, (index) => index);
  final List<int> MinuteSelectedList = List.generate(60, (index) => index);
  final List<int> SecondSelectedList = List.generate(60, (index) => index);
  final List<int> MillisecondSelectedList = List.generate(10, (index) => index);

  int _selectedHour = 0;
  int _selectedMinute = 0;
  int _selectedSecond = 0;
  int _selectedMillisecond = 0;
}

class MomLevelRecordPopupView extends GetView<MomLevelRecordPopupViewController> {
  const MomLevelRecordPopupView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MomLevelRecordPopupViewController());
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
                height: 1091,
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
            height: 1091,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                SizedBox(height: 100),
                PopupText(text: 'MOVEMENT RECORD'),
                const SizedBox(height: 83),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //const SizedBox(width: 15),
                    Column(
                      children: [
                        PopupText(text: 'H'),
                        const SizedBox(height: 210),
                        Container(
                          width: 160,
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
                          width: 160,
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
                    const SizedBox(width: 13),
                    Column(
                      children: [
                        PopupText(text: 'M'),
                        const SizedBox(height: 210),
                        Container(
                          width: 160,
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
                          width: 160,
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
                    const SizedBox(width: 13),
                    Column(
                      children: [
                        PopupText(text: 'S'),
                        const SizedBox(height: 210),
                        Container(
                          width: 160,
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
                          width: 160,
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
                    Column(
                      children: [
                        const SizedBox(height: 260),
                        BodyLargeText(text: '.'),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Column(
                      children: [
                        PopupText(text: ''),
                        const SizedBox(height: 210),
                        Container(
                          width: 80,
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
                          width: 80,
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
                const SizedBox(width: 10),
                Container(
                  height: 1075,
                  width: 140,
                  child: CupertinoPicker(
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedHour = selectedItem;
                    },
                    children: List<Widget>.generate(
                        controller.HourSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.HourSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 37),
                Container(
                  height: 1075,
                  width: 140,
                  child: CupertinoPicker(
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedMinute = selectedItem;
                    },
                    children: List<Widget>.generate(
                        controller.MinuteSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.MinuteSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 37),
                Container(
                  height: 1075,
                  width: 140,
                  child: CupertinoPicker(
                    //scrollController: controller.YearController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedSecond = selectedItem;
                    },
                    children: List<Widget>.generate(
                        controller.SecondSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.SecondSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                //const SizedBox(width: 37),
                Container(
                  height: 1075,
                  width: 140,
                  child: CupertinoPicker(
                    //scrollController: controller.YearController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedMillisecond = selectedItem;
                    },
                    children: List<Widget>.generate(
                        controller.MillisecondSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.MillisecondSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          ///저장버튼
          Positioned(
            top: 20,
            //left: 50,
            //right: 50,
            child: Column(
              children: [
                Row(
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
                const SizedBox(height: 780),
                LabelMediumText(
                  text: '한 번 저장된 기록은 삭제만 가능합니다.',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1.3,
                ),
                const SizedBox(height: 30),
                ButtonWithRollover(
                  onTap: () {
                    /*if (controller._selectedYear == 0) {
                      applyBirthdayAtSub(
                          controller._selectedYear.toString(),
                          controller._selectedMonth.toString(),
                          controller._selectedDay.toString());
                    } else {
                      applyBirthdayAtSub(
                          controller._selectedYear.toString(),
                          controller._selectedMonth.toString(),
                          controller._selectedDay.toString());
                    }*/
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

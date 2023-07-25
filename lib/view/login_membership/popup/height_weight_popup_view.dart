import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import '../../../style_config/text_theme.dart';
import '../../custom_widget/buttons/button_with_rollover.dart';
import '../../custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class HeightWeightPopupViewController extends GetxController {
  final List<int> HeightSelectedList = List.generate(300, (index) => index + 1);
  final List<int> WeightSelectedList = List.generate(300, (index) => index + 1);
  FixedExtentScrollController heightController =
      FixedExtentScrollController(initialItem: 180);
  FixedExtentScrollController WeightController =
      FixedExtentScrollController(initialItem: 70);
  int _selectedHeight = 181;
  int _selectedWeight = 71;
}

class HeightWeightPopupView extends GetView<HeightWeightPopupViewController> {
  const HeightWeightPopupView(
      {Key? key,
      required this.applyHeightAtSub,
      required this.applyWeightAtSub})
      : super(key: key);

  final Function(String) applyHeightAtSub;
  final Function(String) applyWeightAtSub;

  @override
  Widget build(BuildContext context) {
    Get.put(HeightWeightPopupViewController());
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
                height: 978,
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
            height: 978,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                const SizedBox(width: 111),
                Column(
                  children: [
                    SizedBox(height: 100),
                    PopupText(text: '신장(cm)',),
                    const SizedBox(height: 254),
                    Container(
                      width: 210,
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
                      width: 210,
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
                const SizedBox(width: 20),
                Column(
                  children: [
                    SizedBox(height: 100),
                    PopupText(text: '체중(kg)'),
                    const SizedBox(height: 254),
                    Container(
                      width: 210,
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
                      width: 210,
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
                const SizedBox(width: 111),
              ],
            ),
          ),

          ///CupertinoPicker 스타일
          Positioned(
            child: Row(
              children: [
                const SizedBox(width: 111),
                Container(
                  height: 930,
                  width: 210,
                  child: CupertinoPicker(
                    scrollController: controller.heightController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedHeight = selectedItem + 1;
                    },
                    children: List<Widget>.generate(
                        controller.HeightSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.HeightSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 930,
                  width: 210,
                  child: CupertinoPicker(
                    scrollController: controller.WeightController,
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedWeight = selectedItem + 1;
                    },
                    children: List<Widget>.generate(
                        controller.WeightSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.WeightSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 111),
              ],
            ),
          ),

          ///닫기버튼
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
            top: 796,
            left: 50,
            right: 50,
            child: ButtonWithRollover(
              onTap: () {
                if (controller._selectedHeight == 0) {
                  applyHeightAtSub(controller._selectedHeight.toString());
                  applyWeightAtSub(controller._selectedWeight.toString());
                } else {
                  applyHeightAtSub(controller._selectedHeight.toString());
                  applyWeightAtSub(controller._selectedWeight.toString());
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

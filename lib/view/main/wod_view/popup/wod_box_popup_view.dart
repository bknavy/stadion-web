import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class WodBoxPopupViewController extends GetxController {
  List<String> viewSelectedList = ['수업', '시간'];
  List<String> boxSelectedList = ['PG', 'GM', 'BG', 'SJ', 'SS'];
  int _selectedPass = 0;
  int _selectedBox = 0;
}

class WodBoxPopupView extends GetView<WodBoxPopupViewController> {
  const WodBoxPopupView(
      {Key? key, required this.applyViewAtSub, required this.applyBoxAtSub})
      : super(key: key);

  final Function(String) applyViewAtSub;
  final Function(String) applyBoxAtSub;

  @override
  Widget build(BuildContext context) {
    Get.put(WodBoxPopupViewController());
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
                    PopupText(
                      text: 'VIEW',
                    ),
                    const SizedBox(height: 255),
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
                    PopupText(text: 'BOX'),
                    const SizedBox(height: 255),
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
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedPass = selectedItem;
                    },
                    children: List<Widget>.generate(
                        controller.viewSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.viewSelectedList[index].toString(),
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
                    magnification: 2,
                    squeeze: 0.5,
                    itemExtent: 50,
                    selectionOverlay: null,
                    onSelectedItemChanged: (int selectedItem) {
                      controller._selectedBox = selectedItem;
                    },
                    children: List<Widget>.generate(
                        controller.boxSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          controller.boxSelectedList[index].toString(),
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
                if (controller._selectedPass == 0) {
                  applyViewAtSub(controller
                      .viewSelectedList[controller._selectedPass]);
                  applyBoxAtSub(
                      controller.boxSelectedList[controller._selectedBox]);
                } else {
                  applyViewAtSub(controller
                      .viewSelectedList[controller._selectedPass]);
                  applyBoxAtSub(
                      controller.boxSelectedList[controller._selectedBox]);
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

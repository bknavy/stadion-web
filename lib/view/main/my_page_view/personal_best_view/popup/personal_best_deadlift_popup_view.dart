import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class PersonalBestDeadliftPopupViewController extends GetxController {
  List<String> deadliftSelectedList = [
    'BACK',
    'FRONT',
    'FRONT',
    'OVERHEADT',
    'FRONT',
    'FRONT',
    'BACK'
  ];
  int _selectedDeadlift = 0;
}

class PersonalBestDeadliftPopupView
    extends GetView<PersonalBestDeadliftPopupViewController> {
  const PersonalBestDeadliftPopupView({Key? key, required this.applyDeadliftAtSub})
      : super(key: key);

  final Function(String) applyDeadliftAtSub;

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalBestDeadliftPopupViewController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: const Alignment(0.0, -0.35),
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
                  width: 562,
                  height: 787,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.background,
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
              width: 562,
              height: 787,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  SizedBox(height: 201),
                  Container(
                    width: 420,
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
                    width: 420,
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
            ),

            ///CupertinoPicker 스타일
            Positioned(
              child: Row(
                children: [
                  const SizedBox(width: 71),
                  Container(
                    height: 550,
                    width: 420,
                    child: CupertinoPicker(
                      magnification: 2,
                      squeeze: 0.5,
                      itemExtent: 50,
                      selectionOverlay: null,
                      onSelectedItemChanged: (int selectedItem) {
                        controller._selectedDeadlift = selectedItem;
                      },
                      children: List<Widget>.generate(
                          controller.deadliftSelectedList.length, (int index) {
                        return Center(
                          child: Text(
                            controller.deadliftSelectedList[index].toString(),
                            style: textThemeKo.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.shadow,
                              fontSize: 30,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 71),
                ],
              ),
            ),

            ///저장버튼
            Positioned(
              top: 20,
              left: 50,
              right: 50,
              child: Column(
                children: [
                  const SizedBox(height: 607),
                  ButtonWithRollover(
                    width: 462,
                    onTap: () {
                      if (controller._selectedDeadlift == 0) {
                        applyDeadliftAtSub(controller.deadliftSelectedList[
                        controller._selectedDeadlift]);
                      } else {
                        applyDeadliftAtSub(controller.deadliftSelectedList[
                        controller._selectedDeadlift]);
                      }
                      Get.back();
                    },
                    backgroundColor: colorScheme.onBackground,
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
      ),
    );
  }
}

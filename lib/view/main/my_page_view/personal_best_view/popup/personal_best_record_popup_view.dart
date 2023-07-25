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
import 'package:stadion_project/view/main/my_page_view/personal_best_view/popup/personal_best_deadlift_popup_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_date_popup_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_deadlift_popup_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_ibTime_record_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class PersonalBestRecordPopupViewController extends GetxController {
  var deadliftController = TextEditingController();

  bool deadliftShow = false;

  String isDeadlift = '';

  void deadliftField(bool deadliftShow) {
    this.deadliftShow = deadliftShow;
    update();
  }

  void applyDeadlidt(String value) {
    isDeadlift = value;
    deadliftController.text = '${isDeadlift} SQUAT';
    update();
  }

  void PersonalBestDeadliftFind() {
    Get.dialog(
      PersonalBestDeadliftPopupView(applyDeadliftAtSub: applyDeadlidt),
      barrierColor: Colors.transparent,
    );
  }

  int? defaultChoiceIndex;
  final List<String> _choicesList = ['1RM', '3RM', '5RM'];

  void selectIndex(index, value) {
    defaultChoiceIndex = value ? index : null;
    update();
  }

  final List<int> PersonalBestSelectedList =
      List.generate(999, (index) => index + 1);
  int _selectedPersonalBest = 1;
}

class PersonalBestRecordPopupView
    extends GetView<PersonalBestRecordPopupViewController> {
  const PersonalBestRecordPopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalBestRecordPopupViewController());
    return GetBuilder<PersonalBestRecordPopupViewController>(
        builder: (controller) {
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
                  height: 1086,
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
              height: 1086,
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
                        controller.PersonalBestDeadliftFind();
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
                          controller.PersonalBestDeadliftFind();
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
                          controller.PersonalBestDeadliftFind();
                        },
                        icon: Icon(
                          Icons.check,
                          color: colorScheme.shadow,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 34),

                    ///RM 선택
                    Wrap(
                      spacing: 21,
                      //direction: Axis.horizontal,
                      children: List.generate(controller._choicesList.length,
                          (index) {
                        return ChoiceChip(
                          labelPadding: EdgeInsets.fromLTRB(53, 8, 53, 8),
                          label: LabelLargeText(
                            text: controller._choicesList[index],
                            fontWeight: FontWeight.w300,
                            color: controller.defaultChoiceIndex == index
                                ? colorScheme.background
                                : colorScheme.shadow,
                          ),
                          selected: controller.defaultChoiceIndex == index,
                          selectedColor: colorScheme.shadow,
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
                    const SizedBox(height: 230),

                    ///lb 배경
                    Row(
                      children: [
                        const SizedBox(width: 161),
                        Column(
                          children: [
                            Container(
                              width: 210,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
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
                  ],
                ),
              ),
            ),

            ///CupertinoPicker 스타일
            Positioned(
              top: 240,
              child: Container(
                height: 620,
                width: 660,
                child: CupertinoPicker(
                  magnification: 2,
                  squeeze: 0.5,
                  itemExtent: 50,
                  selectionOverlay: null,
                  onSelectedItemChanged: (int selectedItem) {
                    controller._selectedPersonalBest = selectedItem;
                  },
                  children: List<Widget>.generate(
                      controller.PersonalBestSelectedList.length, (int index) {
                    return Center(
                      child: Text(
                        controller.PersonalBestSelectedList[index].toString(),
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
                  const SizedBox(height: 756),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/picture.png'),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/video.png'),
                      ),
                      const SizedBox(width: 412),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/upload.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';

//로그인 뷰에서 사용될 Get X controller.
class CallChangePopupViewController extends GetxController {
  bool CallMiddleShow = false;
  bool CallEndShow = false;
  bool NewCallMiddleShow = false;
  bool NewCallEndShow = false;
  bool _isObscure = true;
  bool _isObscureNew = true;

  var callMiddleController = TextEditingController();
  var callEndController = TextEditingController();
  var newCallMiddleController = TextEditingController();
  var newCallEndController = TextEditingController();

  void callMiddleInputField(bool CallMiddleShow) {
    this.CallMiddleShow = CallMiddleShow;
    update();
  }

  void callEndInputField(bool CallEndShow) {
    this.CallEndShow = CallEndShow;
    update();
  }

  void newCallMiddleInputField(bool NewCallMiddleShow) {
    this.NewCallMiddleShow = NewCallMiddleShow;
    update();
  }

  void newCallEndInputField(bool NewCallEndShow) {
    this.NewCallEndShow = NewCallEndShow;
    update();
  }

  void isObscureMenu(bool _isObscure) {
    this._isObscure = !_isObscure;
    update();
  }

  void isObscureNewMenu(bool _isObscureNew) {
    this._isObscureNew = !_isObscureNew;
    update();
  }
}

class CallChangePopupView extends GetView<CallChangePopupViewController> {
  const CallChangePopupView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CallChangePopupViewController());
    return GetBuilder<CallChangePopupViewController>(builder: (context) {
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
                  height: 784,
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
              height: 784,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  HeadlineSmallText(
                    text: '휴대폰 번호 변경',
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 34),
                  SizedBox(
                    width: 562,
                    child: LabelLargeText(
                      text: '현재 휴대폰 번호',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.4,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ViewContainer(
                        width: 122,
                        height: 70,
                        alignment: Alignment.center,
                        color: colorScheme.background,
                        child: LabelLargeText(
                          text: '010',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.shadow,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 2,
                        color: colorScheme.surfaceVariant,
                      ),
                      const SizedBox(width: 10),
                      MyPageTextFormField(
                        width: 180,
                        height: 70,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.callMiddleInputField(true);
                          } else {
                            controller.callMiddleInputField(false);
                          }
                        },
                        obscureText: false,
                        textAlign: TextAlign.center,
                        controller: controller.callMiddleController,
                        hintText: '',
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 2,
                        color: colorScheme.surfaceVariant,
                      ),
                      const SizedBox(width: 10),
                      MyPageTextFormField(
                        width: 180,
                        height: 70,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.callEndInputField(true);
                          } else {
                            controller.callEndInputField(false);
                          }
                        },
                        obscureText: controller._isObscure,
                        textAlign: TextAlign.center,
                        controller: controller.callEndController,
                        hintText: '',
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: 562,
                    child: LabelLargeText(
                      text: '새 휴대폰 번호',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.4,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ViewContainer(
                        width: 122,
                        height: 70,
                        alignment: Alignment.center,
                        color: colorScheme.background,
                        child: LabelLargeText(
                          text: '010',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.shadow,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 2,
                        color: colorScheme.surfaceVariant,
                      ),
                      const SizedBox(width: 10),
                      MyPageTextFormField(
                        width: 180,
                        height: 70,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.newCallMiddleInputField(true);
                          } else {
                            controller.newCallMiddleInputField(false);
                          }
                        },
                        obscureText: false,
                        textAlign: TextAlign.center,
                        controller: controller.newCallMiddleController,
                        hintText: '',
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 2,
                        color: colorScheme.surfaceVariant,
                      ),
                      const SizedBox(width: 10),
                      MyPageTextFormField(
                        width: 180,
                        height: 70,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.newCallEndInputField(true);
                          } else {
                            controller.newCallEndInputField(false);
                          }
                        },
                        obscureText: controller._isObscureNew,
                        textAlign: TextAlign.center,
                        controller: controller.newCallEndController,
                        hintText: '',
                      ),
                    ],
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
                  const SizedBox(height: 534),
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
    }
    );
  }
}

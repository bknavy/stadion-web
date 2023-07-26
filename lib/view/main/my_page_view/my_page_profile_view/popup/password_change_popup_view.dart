import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';

//로그인 뷰에서 사용될 Get X controller.
class PasswordChangePopupViewController extends GetxController {
  bool passwordShow = false;
  bool passwordNewShow = false;
  bool passwordCheckShow = false;
  bool _isObscure = true;
  bool _isObscureNew = true;
  bool _isObscureCheck = true;

  var passwordController = TextEditingController();
  var passwordNewController = TextEditingController();
  var passwordCheckController = TextEditingController();

  void passwordShowInputField(bool passwordShow) {
    this.passwordShow = passwordShow;
    update();
  }

  void passwordNewShowInputField(bool passwordNewShow) {
    this.passwordNewShow = passwordNewShow;
    update();
  }

  void passwordCheckShowInputField(bool passwordCheckShow) {
    this.passwordCheckShow = passwordCheckShow;
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

  void isObscureCheckMenu(bool _isObscureCheck) {
    this._isObscureCheck = !_isObscureCheck;
    update();
  }
}

class PasswordChangePopupView extends GetView<PasswordChangePopupViewController> {
  const PasswordChangePopupView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PasswordChangePopupViewController());
    return GetBuilder<PasswordChangePopupViewController>(builder: (context) {
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
                    height: 1056,
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
                height: 1056,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    HeadlineSmallText(
                      text: '비밀번호 변경',
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 34),
                    SizedBox(
                      width: 562,
                      child: LabelLargeText(
                        text: '현재 비밀번호',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.4,
                      ),
                    ),
                    const SizedBox(height: 30),
                    MyPageTextFormField(
                      width: 562,
                      height: 70,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.passwordShowInputField(true);
                        } else {
                          controller.passwordShowInputField(false);
                        }
                      },
                      obscureText: controller._isObscure,
                      textAlign: TextAlign.left,
                      controller: controller.passwordController,
                      hintText: '현재 비밀번호를 입력해 주세요.',
                      hintStyle: textThemeKo.labelSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: colorScheme.onSurface,
                        letterSpacing: -1.2,
                      ),
                      suffixIcon: controller.passwordShow
                          ? IconButton(
                        padding: EdgeInsets.only(right: 25),
                        onPressed: () {
                          controller.isObscureMenu(controller._isObscure);
                        },
                        icon: Icon(
                          controller._isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      )
                          : null,
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: 562,
                      child: LabelLargeText(
                        text: '새 비밀번호',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.4,
                      ),
                    ),
                    const SizedBox(height: 30),
                    MyPageTextFormField(
                      width: 562,
                      height: 70,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.passwordNewShowInputField(true);
                        } else {
                          controller.passwordNewShowInputField(false);
                        }
                      },
                      obscureText: controller._isObscureNew,
                      textAlign: TextAlign.left,
                      controller: controller.passwordNewController,
                      hintText: '새로운 비밀번호를 입력해 주세요.',
                      hintStyle: textThemeKo.labelSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: colorScheme.onSurface,
                        letterSpacing: -1.2,
                      ),
                      suffixIcon: controller.passwordNewShow
                          ? IconButton(
                        padding: EdgeInsets.only(right: 25),
                        onPressed: () {
                          controller.isObscureNewMenu(controller._isObscureNew);
                        },
                        icon: Icon(
                          controller._isObscureNew
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      )
                          : null,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '숫자포함',
                              style: textThemeKo.labelSmall!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          const SizedBox(width: 39),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '6자 이내',
                              style: textThemeKo.labelSmall!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: 562,
                      child: LabelLargeText(
                        text: '새 비밀번호 확인',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.4,
                      ),
                    ),
                    const SizedBox(height: 30),
                    MyPageTextFormField(
                      width: 562,
                      height: 70,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.passwordCheckShowInputField(true);
                        } else {
                          controller.passwordCheckShowInputField(false);
                        }
                      },
                      obscureText: controller._isObscureCheck,
                      textAlign: TextAlign.left,
                      controller: controller.passwordCheckController,
                      hintText: '새로운 비밀번호를 입력해 주세요.',
                      hintStyle: textThemeKo.labelSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: colorScheme.onSurface,
                        letterSpacing: -1.2,
                      ),
                      suffixIcon: controller.passwordCheckShow
                          ? IconButton(
                        padding: EdgeInsets.only(right: 25),
                        onPressed: () {
                          controller.isObscureCheckMenu(controller._isObscureCheck);
                        },
                        icon: Icon(
                          controller._isObscureCheck
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      )
                          : null,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '비밀번호 일치',
                          style: textThemeKo.labelSmall!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: colorScheme.onSurface,
                          ),
                        ),
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
                    const SizedBox(height: 806),
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

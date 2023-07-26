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
class GreetingChangePopupViewController extends GetxController {
  var greetingController = TextEditingController();
}

class GreetingChangePopupView extends GetView<GreetingChangePopupViewController> {
  const GreetingChangePopupView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GreetingChangePopupViewController());
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
                height: 1022,
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
            height: 1022,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                SizedBox(height: 100),
                HeadlineSmallText(
                  text: '인사말 변경',
                  isEnglish: false,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 34),
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
                const SizedBox(height: 772),
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
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class MomsterChallengePopupViewController extends GetxController {
  static const String MainNumbersView_popup = 'FIGHT!!';
}

class MomsterChallengePopupView
    extends GetView<MomsterChallengePopupViewController> {
  const MomsterChallengePopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MomsterChallengePopupViewController());
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
                height: 1110,
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

          ///몬스터 챌린지 설명
          Positioned(
            top: 20,
            left: 50,
            right: 50,
            child: Column(
              children: [
                const SizedBox(height: 80),
               HeadlineSmallText(
                   text: 'MoMSTER THE CHALLENGE',
                 fontWeight: FontWeight.w600,
               ),
                const SizedBox(height: 71),
                LabelLargeText(
                    text: MomsterChallengePopupViewController.MainNumbersView_popup,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          ),

          ///단기버튼
          Positioned(
            top: 20,
            //left: 50,
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
        ],
      ),
    );
  }
}

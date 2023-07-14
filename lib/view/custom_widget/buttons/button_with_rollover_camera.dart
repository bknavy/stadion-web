import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

import '../../login_membership/membership_agreement_view.dart';

class ButtonWithRolloverCameraController extends GetxController {
  bool isTouching = false;

  void onTouching() {
    isTouching = true;
    update();
  }

  void onDismiss() {
    isTouching = false;
    update();
  }
}

class ButtonWithRolloverCamera extends StatelessWidget {
  const ButtonWithRolloverCamera({
    required this.onTap,
    this.width = 210,
    this.height = 412,
    this.splashColor,
    this.highlightColor,
    this.backgroundColor,
    this.child,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  final double width;
  final double height;

  final Color? splashColor;
  final Color? highlightColor;

  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Get.put(ButtonWithRolloverCameraController());
    return GetBuilder<ButtonWithRolloverCameraController>(
        builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.onDismiss();
            onTap();
          },
          onTapCancel: () => controller.onDismiss(),
          onPanDown: (details) {
            controller.onTouching();
          },
          child: Container(
            width: width,
            clipBehavior: Clip.hardEdge,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: colorScheme.shadow,
                ),
                color: backgroundColor ?? Colors.transparent),
            child: Material(
              color: backgroundColor ?? Colors.transparent,
              child: InkWell(
                onTap: onTap,
                //background를 nullable로 선언하였으나 ??를 통해 기본값을 활용한 예시
                //a ?? b의 구문의 경우 a를 넣되, a가 null인 경우 b로 대체하여 넣겠다는 의미
                splashColor: splashColor ?? colorScheme.background,
                highlightColor: highlightColor ?? colorScheme.background,

                //widget또한 변수로 입력받아 이처럼 사용할 수 있다.
                child: Image.asset(
                    controller.isTouching ? 'assets/images/timer_cam_setting_camera_after.png'
                        : 'assets/images/timer_cam_setting_camera_before.png'
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}


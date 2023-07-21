import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class FreeTrialRequestViewController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var callController = TextEditingController();
  var dateController = TextEditingController();
  var pointController = TextEditingController();

  bool nameShow = false;
  bool emailShow = false;
  bool callShow = false;
  bool dateShow = false;
  bool pointShow = false;

  void nameField(bool nameShow) {
    this.nameShow = nameShow;
    update();
  }

  void emailField(bool emailShow) {
    this.emailShow = emailShow;
    update();
  }

  void callField(bool callShow) {
    this.callShow = callShow;
    update();
  }

  void dateField(bool dateShow) {
    this.dateShow = dateShow;
    update();
  }

  void pointField(bool pointShow) {
    this.pointShow = pointShow;
    update();
  }
}

class FreeTrialRequestView extends GetView<FreeTrialRequestViewController> {
  const FreeTrialRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FreeTrialRequestViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: '무료 체험 신청',
          isEnglishTitle: false,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.off(const MainScreenView());
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 56),
          MainTitle(
            width: 662,
            text: '스타디온 무료 체험을 원하시면\n아래 신청서를 작성해 주세요.',
          ),
          const SizedBox(height: 60),
          Container(
            width: 662,
            height: 120,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              border: Border(
                  top: BorderSide(color: colorScheme.shadow),
                  bottom: BorderSide(color: colorScheme.shadow)),
            ),
            child: Center(
              child: PopupText(
                text: '스타디온 무료 체험 신청서',
              ),
            ),
          ),
          const SizedBox(height: 22),
          TrialTextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.nameField(true);
                } else {
                  controller.nameField(false);
                }
              },
              controller: controller.nameController,
              hintText: '이름'),
          const SizedBox(height: 6),
          TrialTextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.callField(true);
                } else {
                  controller.callField(false);
                }
              },
              controller: controller.callController,
              hintText: '휴대폰 번호'),
          const SizedBox(height: 6),
          TrialTextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.emailField(true);
                } else {
                  controller.emailField(false);
                }
              },
              controller: controller.emailController,
              hintText: '이메일'),
          const SizedBox(height: 6),
          TrialTextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.dateField(true);
                } else {
                  controller.dateField(false);
                }
              },
              controller: controller.dateController,
              hintText: '체험 신청 기간'),
          const SizedBox(height: 6),
          TrialTextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.pointField(true);
                } else {
                  controller.pointField(false);
                }
              },
              controller: controller.pointController,
              hintText: '체험 신청 지점'),
          const SizedBox(height: 19.5),
          SizedBox(
            width: 662,
            height: 29,
            child: Text(
              '* 무료체험은 시작일부터 3일 유효합니다.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Pretendard",
                  fontStyle: FontStyle.normal,
                  color: colorScheme.onSurface,
                  letterSpacing: -1.2),
            ),
          ),
          const SizedBox(height: 95.5),
          GetBuilder<FreeTrialRequestViewController>(
            builder: (controller) {
              return ButtonWithRollover(
                onTap: () {
                  Get.to(const MainScreenView());
                },
                backgroundColor: controller.nameShow &&
                        controller.callShow &&
                        controller.emailShow &&
                        controller.dateShow &&
                        controller.pointShow
                    ? colorScheme.primary
                    : colorScheme.onBackground,
                child: Center(
                  child: Text(
                    '신청하기',
                    style: textThemeKo.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.nameShow &&
                          controller.callShow &&
                          controller.emailShow &&
                          controller.dateShow &&
                          controller.pointShow
                          ? colorScheme.shadow
                          : colorScheme.surfaceVariant,
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 190,
          child: Column(
            children: [
              Container(
                width: 662,
                height: 2,
                color: colorScheme.shadow,
              ),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrialTextFormField extends StatelessWidget {
  const TrialTextFormField({
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 97,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorScheme.onSurface)),
        ),
        child: TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          controller: controller,
          style: textThemeKo.labelLarge!.copyWith(
            fontWeight: FontWeight.w300,
            color: colorScheme.shadow,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: textThemeKo.labelLarge!.copyWith(
              fontWeight: FontWeight.w300,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

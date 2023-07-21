import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_text.dart';
import 'membership_id_input_view.dart';
import 'membership_information_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MembershipPasswordInputViewController extends GetxController {
  bool passwordShow = false;
  bool passwordCheckShow = false;
  bool _isObscure = true;
  bool _isObscureCheck = true;

  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();

  void passwordShowInputField(bool passwordShow) {
    this.passwordShow = passwordShow;
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

  void isObscureCheckMenu(bool _isObscureCheck) {
    this._isObscureCheck = !_isObscureCheck;
    update();
  }
}

class MembershipPasswordInputView
    extends GetView<MembershipPasswordInputViewController> {
  const MembershipPasswordInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MembershipPasswordInputViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: '회원가입',
          isEnglishTitle: false,
          withMenu: true,
          withAction: false,
          onLeading: () {
            Get.off(const MembershipIdInputView());
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 56),
          LoginTitle(
            text: '로그인에 사용할\n비밀번호를 입력해 주세요.',
          ),
          const SizedBox(height: 86),
          buildIdFindInputField(),
        ],
      ),
    );
  }

  ///이메일 입력창/로그인버튼
  Column buildIdFindInputField() {
    return Column(
      children: [
        GetBuilder<MembershipPasswordInputViewController>(builder: (context) {
          return Column(
            children: [
              Column(
                children: [
                  LoginTextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.passwordShowInputField(true);
                      } else {
                        controller.passwordShowInputField(false);
                      }
                    },
                    controller: controller.passwordController,
                    obscureText: controller._isObscure,
                    hintText: '비밀번호 입력',
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
                  const SizedBox(height: 9),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 94),
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
                ],
              ),
              const SizedBox(height: 21),
              Column(
                children: [
                  LoginTextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.passwordCheckShowInputField(true);
                      } else {
                        controller.passwordCheckShowInputField(false);
                      }
                    },
                    controller: controller.passwordCheckController,
                    obscureText: controller._isObscureCheck,
                    hintText: '비밀번호 확인',
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
                  const SizedBox(height: 9),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 94),
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
              const SizedBox(height: 685),
              ButtonWithRollover(
                onTap: () {
                  Get.to(const MembershipInformationView());
                },
                backgroundColor:
                    controller.passwordShow && controller.passwordCheckShow
                        ? colorScheme.primary
                        : colorScheme.onBackground,
                child: Center(
                  child: Text(
                    '다음',
                    style: textThemeKo.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.passwordShow &&
                              controller.passwordCheckShow
                          ? colorScheme.shadow
                          : colorScheme.surfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

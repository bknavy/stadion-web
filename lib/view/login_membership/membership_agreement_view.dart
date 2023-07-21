import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/custom_checkbox_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_text.dart';
import '../login/login_view.dart';
import 'membership_id_input_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class LoginMembershipAgreementViewController extends GetxController {
  bool isCheckAll = false;
  bool isCheckSelect = false;

  List<bool> isCheckedList = [false, false, false, false];

  /// 전체 체크/해제 동시
  void checkChangeAll(bool state) {
    for (int i = 0; i < isCheckedList.length; i++) {
      isCheckedList[i] = state;
    }
    update();
  }

  checkBoxSelect() {
    update();
    bool flag = true;
    for (int i = 0; i < isCheckedList.length; i++) {
      if (!isCheckedList[i]) {
        flag = false;
        break;
      }
    }
    isCheckAll = flag;
  }

  checkBoxSelectIndividual() {
    update();
    bool flag = true;
    for (int i = 0; i < isCheckedList.length - 1; i++) {
      if (!isCheckedList[i]) {
        flag = false;
        break;
      }
    }
    isCheckSelect = flag;
  }
}

class LoginMembershipAgreementView
    extends GetView<LoginMembershipAgreementViewController> {
  const LoginMembershipAgreementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginMembershipAgreementViewController());
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
            Get.off(const LoginView());
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 56),
          LoginTitle(
            text: '스타디온 서비스 이용약관에\n동의해 주세요.',
          ),
          const SizedBox(height: 100),
          buildMembershipAgreen(),
        ],
      ),
    );
  }

  ///이용약관 동의
  Column buildMembershipAgreen() {
    return Column(
      children: [
        GetBuilder<LoginMembershipAgreementViewController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomCheckboxAll(
                      onChanged: (value) {
                        controller.isCheckAll = value!;
                        controller.checkChangeAll(controller.isCheckAll);
                      },
                      value: controller.isCheckAll,
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '모두 동의 (선택 정보 포함)',
                    ),
                  ],
                ),

                ///모두 동의
                const SizedBox(height: 10),
                Container(
                  width: 562,
                  height: 2,
                  color: colorScheme.shadow,
                ),

                ///밑줄
                const SizedBox(height: 9),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '약관을 꼭 확인하시기 바랍니다',
                    style: textThemeKo.labelSmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),

                ///약관 확인 문구
                const SizedBox(height: 53),
                Row(
                  children: [
                    ///첫번째 동의
                    CustomCheckboxSelect(
                      onChanged: (value) {
                        controller.isCheckedList[0] = value!;
                        controller.checkBoxSelect();
                        controller.checkBoxSelectIndividual();
                      },
                      value: controller.isCheckedList[0],
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '[필수] 만 14세 이상',
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                ///두번째 동의
                Row(
                  children: [
                    CustomCheckboxSelect(
                      onChanged: (value) {
                        controller.isCheckedList[1] = value!;
                        controller.checkBoxSelect();
                        controller.checkBoxSelectIndividual();
                      },
                      value: controller.isCheckedList[1],
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '[필수] 이용약관 동의',
                    ),
                    SizedBox(width: 15),
                    buildUnderLineButton(
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                ///세번째 동의
                Row(
                  children: [
                    CustomCheckboxSelect(
                      onChanged: (value) {
                        controller.isCheckedList[2] = value!;
                        controller.checkBoxSelect();
                        controller.checkBoxSelectIndividual();
                      },
                      value: controller.isCheckedList[2],
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '[필수] 개인정보 처리방침 동의',
                    ),
                    SizedBox(width: 15),
                    buildUnderLineButton(
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                ///네번째 동의
                Row(
                  children: [
                    CustomCheckboxSelect(
                      onChanged: (value) {
                        controller.isCheckedList[3] = value!;
                        controller.checkBoxSelect();
                      },
                      value: controller.isCheckedList[3],
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '[선택] 광고성 정보 수신 및 마케팅 활용 동의',
                    ),
                    SizedBox(width: 15),
                    buildUnderLineButton(
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 568),

                ///가입버튼
                ButtonWithRollover(
                  onTap: controller.isCheckAll || controller.isCheckSelect
                      ? () => Get.to(() => MembershipIdInputView())
                      : () => Get.to(() => false),
                  backgroundColor:
                      controller.isCheckAll || controller.isCheckSelect
                          ? colorScheme.primary
                          : colorScheme.onBackground,
                  child: Center(
                    child: Text(
                      '동의하고 가입하기',
                      style: textThemeKo.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        /*color: controller.isCheckAll || controller.isCheckSelect
                            ? colorScheme.shadow
                            : colorScheme.surfaceVariant,*/
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

/// 약관 보기 버튼
class buildUnderLineButton extends StatelessWidget {
  const buildUnderLineButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        '보기',
        style: textThemeKo.bodyMedium!.copyWith(
          fontSize: 28,
          letterSpacing: -1.4,
          color: colorScheme.shadow,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

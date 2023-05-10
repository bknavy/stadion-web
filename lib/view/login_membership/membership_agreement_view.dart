import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_login_text.dart';
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

  checkBoxSelect2() {
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
      body: Column(
        children: [
          CustomAppBar(
            title: '회원가입',
            isEnglishTitle: true,
            onLeading: () {
              Get.to(const LoginView());
            },
          ),
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

  ///이메일 입력창/로그인버튼
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check_box_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '모두 동의 (선택 정보 포함)',
                    ),
                  ],
                ), ///모두 동의
                const SizedBox(height: 10),
                Container(
                  width: 562,
                  height: 2,
                  color: colorScheme.shadow,
                ), ///밑줄
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
                ), ///약관 확인 문구
                const SizedBox(height: 53),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '[필수] 만 14세 이상',
                    ),
                  ],
                ), ///첫번째 동의
                const SizedBox(height: 15),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 30,
                      ),
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
                ), ///두번째 동의
                const SizedBox(height: 15),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 30,
                      ),
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
                ), ///세번째 동의
                const SizedBox(height: 15),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 5),
                    LoginMembershipText(
                      text: '[필수] 광고성 정보 수신 및 마케팅 활용 동의',
                    ),
                    SizedBox(width: 15),
                    buildUnderLineButton(
                      onTap: () {},
                    ),
                  ],
                ), ///네번째 동의
                const SizedBox(height: 568),
                ButtonWithRollover(
                  onTap: () {
                    Get.to(const MembershipIdInputView());
                  },
                  /*controller.isCheckAll || controller.isCheckSelect
                      ? () => Get.to(() => LoginMembershipIdInputView())
                      : () => Get.to(() => false),
                  backgroundColor:
                      controller.isCheckAll || controller.isCheckSelect
                          ? colorScheme.primary
                          : colorScheme.onBackground,*/
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
                ), ///가입버튼
              ],
            ),
          );
        }),
      ],
    );
  }
}

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
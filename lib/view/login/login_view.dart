import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/login/password_find_input_view.dart';
import 'package:stadion_project/view/login/start_view.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../login_membership/membership_agreement_view.dart';
import '../main/main_screen_view.dart';
import 'id_find_input_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class LoginViewController extends GetxController {
  bool isLogin = true;
  bool idShow = false;
  bool passwordShow = false;
  bool _isObscure = true;

  var idController = TextEditingController();
  var passwordController = TextEditingController();

  void switchMenu(bool isLogin) {
    this.isLogin = isLogin;
    update();
  }

  void idInputField(bool idShow) {
    this.idShow = idShow;
    update();
  }

  void passInputField(bool passwordShow) {
    this.passwordShow = passwordShow;
    update();
  }

  void isObscureMenu(bool _isObscure) {
    this._isObscure = !_isObscure;
    update();
  }
}

class LoginView extends GetView<LoginViewController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(LoginViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'LOGIN',
          isEnglishTitle: true,
          withMenu: true,
          withAction: false,
          onLeading: () {
            Get.off(const StartView());
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 56),
          // 아래처럼 메소드에 ///를 통해 주석을 적은 경우 마우스를 대서 설명 확인 가능
          buildTopMenu(),
          const SizedBox(height: 148),
          buildLoginInputField(),
          const SizedBox(height: 600),
          buildBottomMenu(),
        ],
      ),
    );
  }

  ///하단 아이디 찾기/비밀번호 찾기 메뉴 버튼
  Row buildBottomMenu() {
    return Row(
      children: [
        const SizedBox(width: 94),
        //GetBuilder<Controller> 를 사용하면 해당 컨트롤러의 변수 값이 변경될 때마다 builder 내부의 위젯을 rebuild 함
        GetBuilder<LoginViewController>(builder: (context) {
          return Row(
            children: [
              TextToggleButton(
                isSelected: false,
                text: '아이디 찾기',
                width: 272,
                onTap: () {
                  Get.to(const IdFindInputView());
                },
                underLineGap: 28,
              ),
              const SizedBox(width: 8.5),
              Column(
                children: [
                  Container(
                    color: colorScheme.shadow,
                    width: 2,
                    height: 30,
                  ),
                  const SizedBox(width: 2, height: 27.5)
                ],
              ),
              const SizedBox(width: 8.5),
              TextToggleButton(
                isSelected: false,
                text: '비밀번호 찾기',
                width: 272,
                onTap: () {
                  Get.to(const PasswordFindInputView());
                },
                underLineGap: 28,
              ),
            ],
          );
        }),
      ],
    );
  }

  ///상단 로그인/사인업 메뉴 버튼
  Row buildTopMenu() {
    return Row(
      children: [
        const SizedBox(width: 94),
        GetBuilder<LoginViewController>(builder: (context) {
          return Row(
            children: [
              TextToggleButton(
                isSelected: controller.isLogin,
                text: 'LOGIN',
                width: 94,
                onTap: () { controller.switchMenu(true);},
              ),
              const SizedBox(width: 39),
              TextToggleButton(
                isSelected: !controller.isLogin,
                text: 'SIGN UP',
                width: 120,
                onTap: () {
                  controller.switchMenu(false);
                  Get.to(const LoginMembershipAgreementView());
                },
              ),
            ],
          );
        }),
      ],
    );
  }

  ///로그인 입력창/로그인버튼
  Column buildLoginInputField() {
    return Column(
      children: [
        GetBuilder<LoginViewController>(builder: (context) {
          return Column(
            children: [
              LoginTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.idInputField(true);
                  } else {
                    controller.idInputField(false);
                  }
                },
                controller: controller.idController,
                obscureText: false,
                hintText: '아이디',
                suffixIcon: controller.idShow
                    ? IconButton(
                        padding: EdgeInsets.only(right: 25),
                        onPressed: () {
                          controller.idController.clear();
                          controller.idInputField(false);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 20),
              LoginTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.passInputField(true);
                  } else {
                    controller.passInputField(false);
                  }
                },
                controller: controller.passwordController,
                obscureText: controller._isObscure,
                hintText: '비밀번호',
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
              const SizedBox(height: 90),
              ButtonWithRollover(
                onTap: () {
                  Get.to(const MainScreenView());
                },
                backgroundColor: controller.idShow && controller.passwordShow
                    ? colorScheme.primary
                    : colorScheme.onBackground,
                child: Center(
                  child: Text(
                    '로그인하기',
                    style: textThemeKo.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.idShow && controller.passwordShow
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

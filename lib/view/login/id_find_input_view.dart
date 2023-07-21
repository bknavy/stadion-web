import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_text.dart';
import 'id_find_send_view.dart';
import 'login_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class IdFindInputViewController extends GetxController {
  bool emailShow = false;

  var emailController = TextEditingController();

  void emailInputField(bool emailShow) {
    this.emailShow = emailShow;
    update();
  }
}

class IdFindInputView extends GetView<IdFindInputViewController> {
  const IdFindInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(IdFindInputViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: '아이디 찾기',
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
            text: '회원가입시 입력한\n이메일 주소를 입력해 주세요.',
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
        GetBuilder<IdFindInputViewController>(builder: (context) {
          return Column(
            children: [
              LoginTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.emailInputField(true);
                  } else {
                    controller.emailInputField(false);
                  }
                },
                controller: controller.emailController,
                obscureText: false,
                hintText: '이메일 주소 입력',
                suffixIcon: controller.emailShow
                    ? IconButton(
                        padding: EdgeInsets.only(right: 25),
                        onPressed: () {
                          controller.emailController.clear();
                          controller.emailInputField(false);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 890),
              ButtonWithRollover(
                onTap: () {
                  Get.to(const IdFindSendView());
                },
                backgroundColor: controller.emailShow
                    ? colorScheme.primary
                    : colorScheme.onBackground,
                child: Center(
                  child: Text(
                    '아이디 요청하기',
                    style: textThemeKo.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.emailShow
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

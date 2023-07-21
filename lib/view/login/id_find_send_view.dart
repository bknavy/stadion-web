import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_text.dart';
import 'login_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class IdFindSendViewController extends GetxController {}

class IdFindSendView extends GetView<IdFindSendViewController> {
  const IdFindSendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(IdFindSendViewController());
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
            text: '아이디를 이메일로\n발송해 드렸어요.',
          ),
          const SizedBox(height: 86),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 94),
            child: Container(
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: colorScheme.error, width: 2),
                //border: Border.all(color: Colors.black),
              ),
              child: Text(
                '요청하신 아이디를 발송하였습니다. 메일을 확인해 주세요!',
                style: textThemeKo.labelSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.shadow,
                ),
              ),
            ),
          ),
          const SizedBox(height: 890),
          ButtonWithRollover(
            onTap: () {
              Get.to(const LoginView());
            },
            backgroundColor: colorScheme.primary,
            child: Center(
              child: Text(
                '다시 로그인하기',
                style: textThemeKo.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.shadow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

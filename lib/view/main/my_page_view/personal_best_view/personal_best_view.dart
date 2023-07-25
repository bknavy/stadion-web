import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/momster_view/popup/momster_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/personal_best_view/popup/personal_best_record_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class PersonalBestViewController extends GetxController {
  void PersonalBestRecordFind() {
    Get.dialog(
      PersonalBestRecordPopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class PersonalBestView extends GetView<PersonalBestViewController> {
  const PersonalBestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(PersonalBestViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'MY SYADION',
          isEnglishTitle: true,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            children: [
              const SizedBox(height: 55),
              Row(
                children: [
                  ViewContainer(
                    width: 60,
                    height: 60,
                    color: Color(0xfff9cc16),
                    child: Image.asset('assets/images/personal_best.png'),
                  ),
                  const SizedBox(width: 20),
                  HeadlineSmallText(
                    text: 'PERSONAL BEST',
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 130),
                  Container(
                    width: 200,
                    height: 60,
                    child: ButtonWithRollover(
                      onTap: () {
                        controller.PersonalBestRecordFind();
                      },
                      backgroundColor: colorScheme.onBackground,
                      child: Center(
                        child: Text(
                          '기록하기',
                          style: textThemeEn.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.surfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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

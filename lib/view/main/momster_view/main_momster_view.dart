import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/momster_view/popup/momster_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainMomsterViewController extends GetxController {
  var monthController = TextEditingController();

  String isMonth = '';

  bool ismom = true;

  void selectMom(bool ismom) {
    this.ismom = ismom;
    update();
  }

  void applyMonth(String value) {
    isMonth = value;
    monthController.text = '${isMonth}';
    update();
  }

  void MomsterFind() {
    Get.dialog(
      MomsterPopupView(applyMonthAtSub: applyMonth),
      barrierColor: Colors.transparent,
    );
  }
}

class MainMomsterView extends GetView<MainMomsterViewController> {
  const MainMomsterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainMomsterViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'MoMSTER',
          isEnglishTitle: true,
          withMenu: false,
          withAction: true,
          onLeading: () {},
        ),
      ),
      drawer: MainMenuBarView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 55),
            MainScreenTextFormField(
              width: 662,
              onTap: () {
                controller.MomsterFind();
              },
              controller: controller.monthController,
              hintText: 'MONTH',
            ),
            const SizedBox(height: 59),
            GetBuilder<MainMomsterViewController>(builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTapButton(
                    onTap: () {
                      controller.selectMom(true);
                    },
                    width: 332,
                    height: 70,
                    isEnglish: true,
                    color: controller.ismom
                        ? colorScheme.primary
                        : colorScheme.onBackground,
                    text: 'THIS MONTH',
                    isSelected: controller.ismom ? true : false,
                  ),
                  const SizedBox(width: 19),
                  TextTapButton(
                      onTap: () {
                        controller.selectMom(false);
                      },
                      width: 332,
                      height: 70,
                      isEnglish: true,
                      color: controller.ismom
                          ? colorScheme.onBackground
                          : colorScheme.primary,
                      text: 'PAST MONTH',
                      isSelected: controller.ismom ? false : true),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

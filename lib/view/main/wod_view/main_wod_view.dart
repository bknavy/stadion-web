import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/wod_view/popup/wod_box_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainWodViewController extends GetxController {
  var viewController = TextEditingController();
  var boxController = TextEditingController();

  String isView = '';
  String isBox = '';

  bool isToday = true;
  bool isTomorrow = true;

  void selectToday(bool isToday) {
    this.isToday = isToday;
    update();
  }

  void selectTomorrow(bool isTomorrow) {
    this.isTomorrow = isTomorrow;
    update();
  }

  void applyPass(String value) {
    isView = value;
    viewController.text = '${isView}';
    update();
  }

  void applyBox(String value) {
    isBox = value;
    boxController.text = '${isBox}';
    update();
  }

  void WodBoxFind() {
    Get.dialog(
      WodBoxPopupView(applyViewAtSub: applyPass, applyBoxAtSub: applyBox),
      barrierColor: Colors.transparent,
    );
  }
}

class MainWodView extends GetView<MainWodViewController> {
  const MainWodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainWodViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'WoD',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainScreenTextFormField(
                  width: 322,
                  onTap: () {
                    controller.WodBoxFind();
                  },
                  controller: controller.viewController,
                  hintText: 'VIEW',
                ),
                const SizedBox(width: 18),
                MainScreenTextFormField(
                  width: 322,
                  onTap: () {
                    controller.WodBoxFind();
                  },
                  controller: controller.boxController,
                  hintText: 'BOX',
                ),
              ],
            ),
            const SizedBox(height: 59),
            GetBuilder<MainWodViewController>(
                builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.selectToday(true);
                        controller.selectTomorrow(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.isToday
                          ? colorScheme.primary
                          : controller.isTomorrow
                              ? colorScheme.onBackground
                              : colorScheme.onBackground,
                      text: 'TODAY',
                      isSelected: controller.isToday
                          ? true
                          : controller.isTomorrow
                              ? false
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.selectToday(false);
                        controller.selectTomorrow(true);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.isToday
                          ? colorScheme.onBackground
                          : controller.isTomorrow
                              ? colorScheme.primary
                              : colorScheme.onBackground,
                      text: 'TOMORROW',
                      isSelected: controller.isToday
                          ? false
                          : controller.isTomorrow
                              ? true
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.selectToday(false);
                        controller.selectTomorrow(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.isToday
                          ? colorScheme.onBackground
                          : controller.isTomorrow
                              ? colorScheme.onBackground
                              : colorScheme.primary,
                      text: 'PAST',
                      isSelected: controller.isToday
                          ? false
                          : controller.isTomorrow
                              ? false
                              : true,
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

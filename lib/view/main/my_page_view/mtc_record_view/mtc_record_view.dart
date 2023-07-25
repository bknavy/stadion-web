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
import 'package:stadion_project/view/main/my_page_view/public_popup/select_one_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MtcRecordViewController extends GetxController {
  var mtcSortController = TextEditingController();

  String isMtcSort = '';

  void applyMtcSort(String value) {
    isMtcSort = value;
    mtcSortController.text = '${isMtcSort}';
    update();
  }

  void SortFind() {
    Get.dialog(
      SelectOnePopupView(
          applyWodSortAtSub: (String) {},
          applyMomLevelSortAtSub: (String) {},
          applyMtcSortAtSub: applyMtcSort,
          applyTrainingSortAtSub: (String) {}),
      barrierColor: Colors.transparent,
    );
  }
}

class MtcRecordView extends GetView<MtcRecordViewController> {
  const MtcRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MtcRecordViewController());
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
                    color: colorScheme.tertiary,
                    child: Image.asset('assets/icons/momster.png'),
                  ),
                  const SizedBox(width: 20),
                  HeadlineSmallText(
                    text: 'Mtc RECORD',
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              MainScreenTextFormField(
                width: 662,
                onTap: () {
                  controller.SortFind();
                },
                controller: controller.mtcSortController,
                hintText: 'SORT',
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

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
import 'package:stadion_project/view/main/my_page_view/training_log_view/popup/training_select_one_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TrainingLogViewController extends GetxController {
  var trainingSortController = TextEditingController();

  String isTrainingSort = '';

  void applyTrainingSort(String value) {
    isTrainingSort = value;
    trainingSortController.text = '${isTrainingSort}';
    update();
  }

  void SortFind() {
    Get.dialog(
      SelectOnePopupView(
          applyWodSortAtSub: (String) {},
          applyMomLevelSortAtSub: (String) {},
          applyMtcSortAtSub: (String) {},
          applyTrainingSortAtSub: applyTrainingSort),
      barrierColor: Colors.transparent,
    );
  }

  void NewFind() {
    Get.dialog(
      TrainingSelectOnePopupView(
          applyTrainingSortAtSub: applyTrainingSort),
      barrierColor: Colors.transparent,
    );
  }
}

class TrainingLogView extends GetView<TrainingLogViewController> {
  const TrainingLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TrainingLogViewController());
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
                    color: colorScheme.onTertiary,
                    child: Image.asset('assets/images/training_log.png'),
                  ),
                  const SizedBox(width: 20),
                  HeadlineSmallText(
                    text: 'TRAINING LOG',
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 163),
                  Container(
                    width: 200,
                    height: 60,
                    child: ButtonWithRollover(
                      onTap: () {
                        controller.NewFind();
                      },
                      backgroundColor: colorScheme.onBackground,
                      child: Center(
                        child: Text(
                          'NEW',
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
              const SizedBox(height: 60),
              MainScreenTextFormField(
                width: 662,
                onTap: () {
                  controller.SortFind();
                },
                controller: controller.trainingSortController,
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

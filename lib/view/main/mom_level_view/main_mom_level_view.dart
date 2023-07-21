import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/mom_level_view/mom_level_details_category_view.dart';
import 'package:stadion_project/view/main/mom_level_view/popup/body_level_description_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainMomLevelViewController extends GetxController {
  static const String MianMomLevelView_fly_momlevel = 'N3';
  static const String MianMomLevelView_fly_totallevel = '2022 TOTAL LEVEL';

  static const String MianMomLevelView_air_momlevel = 'I3';
  static const String MianMomLevelView_air_lifetimelevel = 'LIFETIME LEVEL';

  //AIR 상세 정보
  static const String MianMomLevelView_air_run1km_level = 'E';
  static const String MianMomLevelView_air_run1km_ExistingRecord = '5:39';
  static const String MianMomLevelView_air_run1km_nowRecord = '7:39';

  static const String MianMomLevelView_air_run5km_level = 'I2';
  static const String MianMomLevelView_air_run5km_ExistingRecord = '15:39';
  static const String MianMomLevelView_air_run5km_nowRecord = '17:39';

  static const String MianMomLevelView_air_bike1km_level = 'A3';
  static const String MianMomLevelView_air_bike1km_ExistingRecord = '25:39';
  static const String MianMomLevelView_air_bike1km_nowRecord = '27:39';

  static const String MianMomLevelView_air_bike5km_level = 'I1';
  static const String MianMomLevelView_air_bike5km_ExistingRecord = '35:39';
  static const String MianMomLevelView_air_bike5km_nowRecord = '37:39';

  static const String MianMomLevelView_air_jumpSu_level = 'N3';
  static const String MianMomLevelView_air_jumpSu_ExistingRecord = '538';
  static const String MianMomLevelView_air_jumpSu_nowRecord = '687';

  static const String MianMomLevelView_air_jumpDu_level = 'A1';
  static const String MianMomLevelView_air_jumpDu_ExistingRecord = '99';
  static const String MianMomLevelView_air_jumpDu_nowRecord = '156';

  //FORCE 상세 정보
  static const String MianMomLevelView_force_run1km_level = 'E';
  static const String MianMomLevelView_force_run1km_ExistingRecord = '5:39';
  static const String MianMomLevelView_force_run1km_nowRecord = '7:39';

  static const String MianMomLevelView_force_run5km_level = 'I2';
  static const String MianMomLevelView_force_run5km_ExistingRecord = '15:39';
  static const String MianMomLevelView_force_run5km_nowRecord = '17:39';

  static const String MianMomLevelView_force_bike1km_level = 'A3';
  static const String MianMomLevelView_force_bike1km_ExistingRecord = '25:39';
  static const String MianMomLevelView_force_bike1km_nowRecord = '27:39';

  static const String MianMomLevelView_force_bike5km_level = 'I1';
  static const String MianMomLevelView_force_bike5km_ExistingRecord = '35:39';
  static const String MianMomLevelView_force_bike5km_nowRecord = '37:39';

  static const String MianMomLevelView_force_jumpSu_level = 'N3';
  static const String MianMomLevelView_force_jumpSu_ExistingRecord = '538';
  static const String MianMomLevelView_force_jumpSu_nowRecord = '687';

  static const String MianMomLevelView_force_jumpDu_level = 'A1';
  static const String MianMomLevelView_force_jumpDu_ExistingRecord = '99';
  static const String MianMomLevelView_force_jumpDu_nowRecord = '156';

  //FLY 상세 정보
  static const String MianMomLevelView_fly_run1km_level = 'E';
  static const String MianMomLevelView_fly_run1km_ExistingRecord = '5:39';
  static const String MianMomLevelView_fly_run1km_nowRecord = '7:39';

  static const String MianMomLevelView_fly_run5km_level = 'I2';
  static const String MianMomLevelView_fly_run5km_ExistingRecord = '15:39';
  static const String MianMomLevelView_fly_run5km_nowRecord = '17:39';

  static const String MianMomLevelView_fly_bike1km_level = 'A3';
  static const String MianMomLevelView_fly_bike1km_ExistingRecord = '25:39';
  static const String MianMomLevelView_fly_bike1km_nowRecord = '27:39';

  static const String MianMomLevelView_fly_bike5km_level = 'I1';
  static const String MianMomLevelView_fly_bike5km_ExistingRecord = '35:39';
  static const String MianMomLevelView_fly_bike5km_nowRecord = '37:39';

  static const String MianMomLevelView_fly_jumpSu_level = 'N3';
  static const String MianMomLevelView_fly_jumpSu_ExistingRecord = '538';
  static const String MianMomLevelView_fly_jumpSu_nowRecord = '687';

  static const String MianMomLevelView_fly_jumpDu_level = 'A1';
  static const String MianMomLevelView_fly_jumpDu_ExistingRecord = '99';
  static const String MianMomLevelView_fly_jumpDu_nowRecord = '156';

  bool isexpansionTileShow = false;

  void expansionTileSelect(bool expanded) {
    isexpansionTileShow = expanded;
    update();
  }

  void BodyLevelDescriptionFind() {
    Get.dialog(
      BodyLevelDescriptionPopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class MainMomLevelView extends GetView<MainMomLevelViewController> {
  const MainMomLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainMomLevelViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'MoM LEVEL',
          isEnglishTitle: true,
          withMenu: false,
          withAction: true,
          onLeading: () {},
        ),
      ),
      drawer: MainMenuBarView(),
      body: GetBuilder<MainMomLevelViewController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                const SizedBox(height: 55),
                Row(
                  children: [
                    HeadlineLargeText(
                      text: '당신의 몸 레벨\n칭찬해!',
                      isEnglish: false,
                      letterSpacing: -2.4,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(width: 210),
                    Container(
                      width: 195,
                      height: 108,
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          controller.BodyLevelDescriptionFind();
                        },
                        child: Row(
                          children: [
                            Text(
                              '몸 레벨 알아보기',
                              style: TextStyle(
                                  color: colorScheme.shadow,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24,
                                  letterSpacing: -1.2),
                            ),
                            const SizedBox(width: 21),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 322),
                Row(
                  children: [
                    ViewContainer(
                      width: 322,
                      height: 188,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      color: const Color(0xfff9cc16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          DisplayMediumText(
                            text: MainMomLevelViewController
                                .MianMomLevelView_fly_momlevel,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelLargeText(
                            text: MainMomLevelViewController
                                .MianMomLevelView_fly_totallevel,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    ViewContainer(
                      width: 322,
                      height: 188,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      color: const Color(0xff96da45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          DisplayMediumText(
                            text: MainMomLevelViewController
                                .MianMomLevelView_air_momlevel,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelLargeText(
                            text: MainMomLevelViewController
                                .MianMomLevelView_air_lifetimelevel,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                HeadlineSmallText(
                  text: 'LEVEL CHART',
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),

                ///AIR 그래프
                ExpansionTile(
                  title: Row(
                    children: [
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 22),
                          Container(
                            width: 55,
                            height: 69,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 6),
                          HeadlineLargeText(
                            text: 'AIR',
                            color: colorScheme.shadow,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '지치지 않는 몸',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w300,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ],
                  ),
                  trailing: Image(
                    image: controller.isexpansionTileShow
                        ? AssetImage('assets/icons/ExpansionTile_up.png')
                        : AssetImage('assets/icons/ExpansionTile_duwn.png'),
                  ),
                  onExpansionChanged: (bool expanded) {
                    controller.expansionTileSelect(expanded);
                  },
                  backgroundColor: colorScheme.onBackground,
                  collapsedBackgroundColor: colorScheme.onBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const MomLevelDetailsCategoryView());
                      },
                      child: Container(
                        color: colorScheme.background,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                ///run 1km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run1km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run1km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run1km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///bike 1km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike1km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike1km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike1km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///jump rope su
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpSu_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpSu_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpSu_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 18),
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                ///run 5km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run5km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run5km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run5km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///bike 5km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike5km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike5km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike5km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///jump rope du
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpDu_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpDu_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpDu_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                ///FORCE 그래프
                ExpansionTile(
                  title: Row(
                    children: [
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 22),
                          Container(
                            width: 55,
                            height: 69,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 6),
                          HeadlineLargeText(
                            text: 'FORCE',
                            color: colorScheme.shadow,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '강인한 몸',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w300,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ],
                  ),
                  trailing: Image(
                    image: controller.isexpansionTileShow
                        ? AssetImage('assets/icons/ExpansionTile_up.png')
                        : AssetImage('assets/icons/ExpansionTile_duwn.png'),
                  ),
                  onExpansionChanged: (bool expanded) {
                    controller.expansionTileSelect(expanded);
                  },
                  backgroundColor: colorScheme.onBackground,
                  collapsedBackgroundColor: colorScheme.onBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const MomLevelDetailsCategoryView());
                      },
                      child: Container(
                        color: colorScheme.background,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                ///run 1km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_run1km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_run1km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_run1km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///bike 1km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_bike1km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_bike1km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_bike1km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///jump rope su
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_jumpSu_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_jumpSu_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpSu_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 18),
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                ///run 5km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_run5km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_run5km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_run5km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///bike 5km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_bike5km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_bike5km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_bike5km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///jump rope du
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_jumpDu_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_force_jumpDu_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_air_jumpDu_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                ///FLY 그래프
                ExpansionTile(
                  title: Row(
                    children: [
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 22),
                          Container(
                            width: 55,
                            height: 69,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 6),
                          HeadlineLargeText(
                            text: 'FLY',
                            color: colorScheme.shadow,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '균형잡힌 몸',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w300,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ],
                  ),
                  trailing: Image(
                    image: controller.isexpansionTileShow
                        ? AssetImage('assets/icons/ExpansionTile_up.png')
                        : AssetImage('assets/icons/ExpansionTile_duwn.png'),
                  ),
                  onExpansionChanged: (bool expanded) {
                    controller.expansionTileSelect(expanded);
                  },
                  backgroundColor: colorScheme.onBackground,
                  collapsedBackgroundColor: colorScheme.onBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const MomLevelDetailsCategoryView());
                      },
                      child: Container(
                        color: colorScheme.background,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                ///run 1km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_run1km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_run1km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_run1km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///bike 1km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_bike1km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_bike1km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_bike1km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///jump rope su
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_jumpSu_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_jumpSu_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_jumpSu_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 18),
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                ///run 5km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_run5km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_run5km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_run5km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///bike 5km
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_bike5km_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_bike5km_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_bike5km_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ///jump rope du
                                ViewContainer(
                                  width: 322,
                                  height: 152,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                  color: colorScheme.onBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          LabelSmallText(
                                            text: 'RUN 1KM',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 47),
                                          Text('RECENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          LabelSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_jumpDu_ExistingRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          HeadlineSmallText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_jumpDu_level,
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onTertiaryContainer,
                                          ),
                                          const SizedBox(height: 5),
                                          TitleSmallText(
                                            text: "PR",
                                            fontWeight: FontWeight.w500,
                                            color: colorScheme.error,
                                          ),
                                          HeadlineLargeText(
                                            text: MainMomLevelViewController.MianMomLevelView_fly_jumpDu_nowRecord,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 91),
              ],
            ),
          ),
        );
      }),
    );
  }
}

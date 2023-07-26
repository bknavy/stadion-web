import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover_camera.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/momster_view/popup/momster_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/mom_level_record_view/mom_level_record_view.dart';
import 'package:stadion_project/view/main/my_page_view/mtc_record_view/mtc_record_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/my_page_profile_view.dart';
import 'package:stadion_project/view/main/my_page_view/training_log_view/training_log_view.dart';
import 'package:stadion_project/view/main/my_page_view/wod_record_view/wod_record_view.dart';

import 'personal_best_view/personal_best_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainMyPageViewController extends GetxController {
  static const String MainMyPageView_id = 'stadion';
  static const String MainMyPageView_greetings =
      '저는 김스타입니다. 스타디온 너무 좋아요\n어플리케이션 운동 짱...~~~~';
  static const String MainMyPageView_follower = '1';
  static const String MainMyPageView_following = '999';
  static const String MainMyPageView_personal = 'BENCH SQUAT 250lb';
  static const String MainMyPageView_personal_data = '05.23.2023';
  static const String MainMyPageView_wod_record = '#56, MoM TRAINING';
  static const String MainMyPageView_wod_record_data = '05.21.2023';
  static const String MainMyPageView_mom_level = 'RUN 5KM, 30:15';
  static const String MainMyPageView_mom_level_data = '01.21.2023';
  static const String MainMyPageView_momster = '#15, BIKE 1KM';
  static const String MainMyPageView_momster_data = '03.21.2023';
  static const String MainMyPageView_training = 'PUSH UP, 129reps';
  static const String MainMyPageView_training_data = '10.21.2023';
}

class MainMyPageView extends GetView<MainMyPageViewController> {
  const MainMyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainMyPageViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'MY SYADION',
          isEnglishTitle: true,
          withMenu: false,
          withAction: true,
          onLeading: () {},
        ),
      ),
      drawer: MainMenuBarView(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            children: [
              const SizedBox(height: 50),

              ///인사말 및 이미지
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 500,
                        height: 48,
                        child: Row(
                          children: [
                            BodyMediumText(
                              text: MainMyPageViewController.MainMyPageView_id,
                              fontWeight: FontWeight.w600,
                            ),
                            BodyMediumText(
                              text: '님, 안녕하세요~',
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 17),
                      Container(
                        width: 500,
                        height: 70,
                        child: LabelLargeText(
                          text:
                              MainMyPageViewController.MainMyPageView_greetings,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -1.4,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child:
                              Image.asset('assets/icons/my_page_setting.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 55),

              ///밑줄
              Container(
                width: 662,
                height: 1,
                color: colorScheme.shadow,
              ),
              const SizedBox(height: 40),

              ///팔로워 수 및 프로필 수정 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 208,
                    height: 80,
                    child: Column(
                      children: [
                        HeadlineSmallText(
                          text:
                              MainMyPageViewController.MainMyPageView_follower,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 11),
                        LabelMediumText(
                          text: 'FOLLOWER',
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 208,
                    height: 80,
                    child: Column(
                      children: [
                        HeadlineSmallText(
                          text:
                              MainMyPageViewController.MainMyPageView_following,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 11),
                        LabelMediumText(
                          text: 'FOLLOWING',
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                  ButtonWithRolloverUnion(
                    width: 208,
                    height: 80,
                    onTap: () {
                      Get.to(const MyPageProfileView());
                    },
                    backgroundColor: colorScheme.onBackground,
                    highlightColor: Color(0xfff9cc16),
                    title: 'PROFILE',
                    isEnglish: false,
                    textColor: colorScheme.shadow,
                    changeTextColor: colorScheme.surfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 60),

              ///동영상
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: colorScheme.onBackground,
                    ),
                  ),
                  Container(
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: colorScheme.onBackground,
                    ),
                  ),
                  Container(
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: colorScheme.onBackground,
                    ),
                  ),
                  Container(
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              ///이번달 기록 그래프
              Column(
                children: [
                  Container(
                    width: 662,
                    height: 37,
                    child: HeadlineSmallText(
                      text: 'THIS MONTH',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 662,
                    height: 415,
                    color: colorScheme.onBackground,
                  ),
                ],
              ),
              const SizedBox(height: 60),

              ///personal best
              ViewContainer(
                width: 662,
                height: 120,
                padding: EdgeInsets.fromLTRB(30, 13, 20, 17),
                color: colorScheme.primary,
                child: Row(
                  children: [
                    Container(
                      width: 61,
                      height: 90,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 13),
                      child: Image.asset('assets/images/personal_best.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadlineSmallText(
                                text: 'PERSONAL BEST',
                                fontWeight: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const PersonalBestView());
                                },
                                child: Image.asset(
                                    'assets/icons/my_page_button.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      '최근: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                        letterSpacing: -1.3,
                                      ),
                                    ),
                                    Text(
                                      MainMyPageViewController
                                          .MainMyPageView_personal,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LabelMediumText(
                                text: MainMyPageViewController
                                    .MainMyPageView_personal_data,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.65,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              ///wod record
              ViewContainer(
                width: 662,
                height: 120,
                padding: EdgeInsets.fromLTRB(30, 13, 20, 17),
                color: colorScheme.onPrimary,
                child: Row(
                  children: [
                    Container(
                      width: 61,
                      height: 90,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 13),
                      child: Image.asset('assets/images/wod_record.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadlineSmallText(
                                text: 'WoD RECORD',
                                fontWeight: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const WodRecordView());
                                },
                                child: Image.asset(
                                    'assets/icons/my_page_button.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      '최근: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                        letterSpacing: -1.3,
                                      ),
                                    ),
                                    Text(
                                      MainMyPageViewController
                                          .MainMyPageView_wod_record,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LabelMediumText(
                                text: MainMyPageViewController
                                    .MainMyPageView_wod_record_data,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.65,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              ///mom level
              ViewContainer(
                width: 662,
                height: 120,
                padding: EdgeInsets.fromLTRB(30, 13, 20, 17),
                color: colorScheme.onSecondaryContainer,
                child: Row(
                  children: [
                    Container(
                      width: 61,
                      height: 90,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 13),
                      child: Image.asset('assets/images/mom_level.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadlineSmallText(
                                text: 'MoM LEVEL',
                                fontWeight: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const MomLevelRecordView());
                                },
                                child: Image.asset(
                                    'assets/icons/my_page_button.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      '최근: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                        letterSpacing: -1.3,
                                      ),
                                    ),
                                    Text(
                                      MainMyPageViewController
                                          .MainMyPageView_mom_level,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LabelMediumText(
                                text: MainMyPageViewController
                                    .MainMyPageView_mom_level_data,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.65,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              ///momster the challenge
              ViewContainer(
                width: 662,
                height: 120,
                padding: EdgeInsets.fromLTRB(30, 13, 20, 17),
                color: colorScheme.tertiary,
                child: Row(
                  children: [
                    Container(
                      width: 61,
                      height: 90,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 13),
                      child: Image.asset('assets/icons/momster.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadlineSmallText(
                                text: 'MoMSTER THE CHALLENGE',
                                fontWeight: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const MtcRecordView());
                                },
                                child: Image.asset(
                                    'assets/icons/my_page_button.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      '최근: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                        letterSpacing: -1.3,
                                      ),
                                    ),
                                    Text(
                                      MainMyPageViewController
                                          .MainMyPageView_momster,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LabelMediumText(
                                text: MainMyPageViewController
                                    .MainMyPageView_momster_data,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.65,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              ///training log
              ViewContainer(
                width: 662,
                height: 120,
                padding: EdgeInsets.fromLTRB(30, 13, 20, 17),
                color: colorScheme.onTertiary,
                child: Row(
                  children: [
                    Container(
                      width: 61,
                      height: 90,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 13),
                      child: Image.asset('assets/images/training_log.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadlineSmallText(
                                text: 'TRAINING LOG',
                                fontWeight: FontWeight.w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const TrainingLogView());
                                },
                                child: Image.asset(
                                    'assets/icons/my_page_button.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 551,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      '최근: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                        letterSpacing: -1.3,
                                      ),
                                    ),
                                    Text(
                                      MainMyPageViewController
                                          .MainMyPageView_training,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LabelMediumText(
                                text: MainMyPageViewController
                                    .MainMyPageView_training_data,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -0.65,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

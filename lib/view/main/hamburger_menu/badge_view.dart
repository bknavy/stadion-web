import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class BadgeViewController extends GetxController {}

class BadgeView extends GetView<BadgeViewController> {
  const BadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BadgeViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'BADGE',
          isEnglishTitle: true,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.off(const MainScreenView());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 55),
            MainTitle(
              width: 662,
              text: '운동 목표를 완수하여\n배지를 획득하세요!',
            ),
            const SizedBox(height: 60),

            ///WoD BADGE
            HeadlineSmallText(
              text: 'WoD BADGE',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        width: 160,
                        height: 202.2,
                        child: Image(
                          image: AssetImage('assets/images/badge_days.png'),
                        ),
                      ),
                      LabelSmallText(
                        isEnglish: false,
                        text: '5일 연속\n예약 달성',
                        letterSpacing: -1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(width: 71),
                  Column(
                    children: [
                      Container(
                        width: 160,
                        height: 202.2,
                        child: Image(
                          image: AssetImage('assets/images/badge_times.png'),
                        ),
                      ),
                      LabelSmallText(
                        isEnglish: false,
                        text: '기록 10회\n입력 달성',
                        letterSpacing: -1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(width: 71),
                  Column(
                    children: [
                      Container(
                        width: 160,
                        height: 202.2,
                        child: Image(
                          image: AssetImage('assets/images/badge_zero.png'),
                        ),
                      ),
                      LabelSmallText(
                        isEnglish: true,
                        text: 'NO SHOW\nZERO',
                        letterSpacing: -1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 59),

            ///MoM LEVEL BADGE
            HeadlineSmallText(
              text: 'MoM LEVEL BADGE',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image: AssetImage('assets/images/badge_air.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: 'AIR 6가지\n기록 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(width: 71),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image:
                                  AssetImage('assets/images/badge_force.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: 'FORCE 6가지\n기록 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(width: 71),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image: AssetImage('assets/images/badge_fly.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: 'FLY 6가지\n기록 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image:
                                  AssetImage('assets/images/badge_media.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '미디어 업로드\n달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 58),

            ///MY PAGE BADGE
            HeadlineSmallText(
              text: 'MY PAGE BADGE',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image:
                                  AssetImage('assets/images/badge_image.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '프로필 사진\n업로드 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(width: 71),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image:
                                  AssetImage('assets/images/badge_screen.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '초기화면\n변경 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(width: 71),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image:
                                  AssetImage('assets/images/badge_follow.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: '친구 5명\nFOLLOW 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Container(
                            width: 160,
                            height: 202.2,
                            child: Image(
                              image:
                                  AssetImage('assets/images/badge_record.png'),
                            ),
                          ),
                          LabelSmallText(
                            isEnglish: false,
                            text: 'TRAINING LOG\n첫 기록 입력 달성',
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 57),

            ///TIMER CAM BADGE
            HeadlineSmallText(
              text: 'TIMER CAM BADGE',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        width: 160,
                        height: 202.2,
                        child: Image(
                          image: AssetImage('assets/images/badge_timer_cam.png'),
                        ),
                      ),
                      LabelSmallText(
                        isEnglish: false,
                        text: 'TIMER CAM으로\n영상 녹화 달성',
                        letterSpacing: -1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 57),

            ///SPECIAL BADGE
            HeadlineSmallText(
              text: 'SPECIAL BADGE',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        width: 160,
                        height: 202.2,
                        child: Image(
                          image: AssetImage('assets/images/badge_special.png'),
                        ),
                      ),
                      LabelSmallText(
                        isEnglish: false,
                        text: '모든 미션 달성',
                        letterSpacing: -1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

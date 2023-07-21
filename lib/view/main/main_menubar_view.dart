import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/main/hamburger_menu/badge_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/boxpass_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/chatting_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/faq_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/feed_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/free_trial_request_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/movement_guide_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/notice_event_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/main_timer_cam_view.dart';
import 'package:stadion_project/view/main/home_view/main_home_view.dart';

import '../../style_config/text_theme.dart';
import '../login/login_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainMenuBarViewController extends GetxController {
  static const String MainMenuBarView_use_id = 'stadion';
}

class MainMenuBarView extends GetView<MainMenuBarViewController> {
  const MainMenuBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainMenuBarViewController());
    return Container(
      width: 656,
      height: 1462,
      child: Drawer(
        child: Column(
          children: [
            ///MainMenuBarHeader
            Container(
              height: 310,
              color: colorScheme.primary,
              padding: EdgeInsets.only(left: 44, top: 100, right: 44),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: const Image(
                            image: AssetImage('assets/icons/close.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 348),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            Get.off(const MainHomeView());
                          },
                          child: const Image(
                            image:
                                AssetImage('assets/icons/home_hamburger.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const ChattingView());
                          },
                          child: const Image(
                            image: AssetImage('assets/icons/bubble.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: const Image(
                            image: AssetImage('assets/icons/setting.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      SizedBox(
                        width: 78,
                        height: 78,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.circle,
                            size: 78,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 468,
                        height: 39,
                        child: Text(
                          MainMenuBarViewController.MainMenuBarView_use_id,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ///리스트 항목
            Container(
              height: 1100,
              padding: EdgeInsets.only(left: 44, top: 70, right: 44),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/icons/smile.png'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 210,
                        height: 36,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const FreeTrialRequestView());
                          },
                          child: Text(
                            '무료 체험 신청하기',
                            style: TextStyle(
                              letterSpacing: -1.5,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const FreeTrialRequestView());
                          },
                          child: Image(
                            image: AssetImage('assets/icons/application.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 27.5),
                  Container(
                    width: 568,
                    height: 2,
                    color: colorScheme.shadow,
                  ),
                  buildGestureDetectorThick(
                    onTap: () {
                      Get.to(const MainTimerCamView());
                    },
                    text: 'TIMER CAM',
                  ),
                  buildGestureDetectorthin(
                    onTap: () {
                      Get.to(const MovementGuideView());
                    },
                    text: 'MOVEMENT GUIDE',
                  ),
                  buildGestureDetectorThick(
                    onTap: () {
                      Get.to(const NoticeEventView(isEvent: true));
                    },
                    text: 'NOTICE',
                  ),
                  buildGestureDetectorthin(
                    onTap: () {
                      Get.to(const NoticeEventView(isEvent: false));
                    },
                    text: 'EVENT',
                  ),
                  buildGestureDetectorthin(
                    onTap: () {
                      Get.to(const BadgeView());
                    },
                    text: 'BADGE',
                  ),
                  buildGestureDetectorThick(
                    onTap: () {
                      Get.to(const FeedView());
                    },
                    text: 'FEED',
                  ),
                  buildGestureDetectorthin(
                    onTap: () {
                      Get.to(const BoxPassView());
                    },
                    text: 'PASS',
                  ),
                  buildGestureDetectorthin(
                    onTap: () {
                      Get.to(const FaqView());
                    },
                    text: 'FAQ',
                  ),
                  Container(
                    width: 568,
                    height: 2,
                    color: colorScheme.shadow,
                  ),
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.offAll(() => LoginView()),
                        child: Container(
                          width: 310,
                          height: 66,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'LOG OUT',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 66,
                        height: 66,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage('assets/icons/instagram.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      SizedBox(
                        width: 66,
                        height: 66,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage('assets/icons/facebook.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      SizedBox(
                        width: 66,
                        height: 66,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage('assets/icons/youtube.png'),
                          ),
                        ),
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

class buildGestureDetectorthin extends StatelessWidget {
  const buildGestureDetectorthin({
    this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 568,
        height: 99,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorScheme.onSurface)),
        ),
        child: Text(
          text,
          style:
              textThemeKo.headlineSmall!.copyWith(fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class buildGestureDetectorThick extends StatelessWidget {
  const buildGestureDetectorThick({
    this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 568,
        height: 99,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorScheme.onSurface)),
        ),
        child: Text(
          text,
          style:
              textThemeKo.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

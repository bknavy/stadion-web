import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/hamburger_menu/notice_event_view.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/mom_level_view/main_mom_level_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:stadion_project/view/main/momster_view/main_momster_view.dart';

import 'popup/home_gym_reservation_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainHomeViewController extends GetxController {
  var date = DateTime.now();

  static const String MianHomeView_appbar_user = '안녕하세요~회원님';

  static const String MianHomeView_attendance_name = '오운완!';
  static const int MianHomeView_attend_number = 9;
  static const int MianHomeView_absent_number = 04;

  static const String MianHomeView_first_reservation = 'MoM(몸) 16:00';
  static const String MianHomeView_second_reservation = 'MoM(몸) 16:00';

  static const String MianHomeView_notice = '<공지> 판교점 주말특별...';
  static const String MianHomeView_event = '<이벤트> 판교점 주말......';

  static const String MianHomeView_air_level = 'I2';

  static const String MianHomeView_force_level = 'A2';

  static const String MianHomeView_fly_level = 'N3';

  var gymTimeController = TextEditingController();

  String isTime = '';
  String isGym = '';

  void applyGymTime(String valueTime, String valueGym) {
    isTime = valueTime;
    isGym = valueGym;
    gymTimeController.text = '${isGym} ${isTime}';
    update();
  }

  void GymTimeFind() {
    Get.dialog(
      HomeGymReservationPopupView(applyGymTimeAtSub: applyGymTime),
      barrierColor: Colors.transparent,
    );
  }

  bool withAction = false;
}

class MainHomeView extends GetView<MainHomeViewController> {
  const MainHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainHomeViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: MainHomeViewController.MianHomeView_appbar_user,
          isEnglishTitle: false,
          withMenu: false,
          withAction: true,
          onLeading: () {},
        ),
      ),
      drawer: MainMenuBarView(),
      body: GetBuilder<MainHomeViewController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    Column(
                      children: [
                        ///출석 현황
                        ViewContainer(
                          width: 322,
                          height: 350,
                          padding: EdgeInsets.all(20),
                          color: colorScheme.primary,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeadlineMediumText(
                                    isEnglish: false,
                                    text: MainHomeViewController
                                        .MianHomeView_attendance_name,
                                    letterSpacing: -2.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  Text(
                                    DateFormat('MM월').format(controller.date),
                                    style: textThemeKo.labelLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 76),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 55),
                                    child: LabelLargeText(
                                      isEnglish: false,
                                      text: '참석',
                                      letterSpacing: -1.4,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  DisplayMediumText(
                                    isEnglish: false,
                                    text: MainHomeViewController
                                        .MianHomeView_attend_number.toString(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              Container(
                                width: 282,
                                height: 2,
                                color: colorScheme.shadow,
                              ),
                              const SizedBox(height: 13),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: LabelLargeText(
                                      isEnglish: false,
                                      text: '불참',
                                      letterSpacing: -1.4,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  HeadlineLargeText(
                                    isEnglish: false,
                                    text: MainHomeViewController
                                        .MianHomeView_absent_number.toString(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),

                        ///MoMster로 넘어가기
                        ViewContainer(
                          width: 322,
                          height: 72,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          color: colorScheme.onPrimary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              HeadlineMediumText(
                                isEnglish: true,
                                text: 'MtC',
                                fontWeight: FontWeight.w400,
                              ),
                              Image(
                                image: AssetImage('assets/icons/momster.png'),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 322,
                              height: 296,
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.asset('assets/images/1MtC1.png');
                                },
                                itemCount: 3,
                                control: SwiperControl(
                                  color: colorScheme.shadow,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 216,
                              left: 128,
                              right: 134,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const MainMomsterView());
                                },
                                child:
                                    Image.asset('assets/icons/mtc_button.png'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 18),
                    Column(
                      children: [
                        ///운동 예약
                        ViewContainer(
                          width: 322,
                          height: 204,
                          padding: EdgeInsets.all(20),
                          color: colorScheme.onTertiary,
                          child: Column(
                            children: [
                              HeadlineMediumText(
                                isEnglish: false,
                                text: '오늘도 운동해요!',
                                letterSpacing: -2.0,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 54),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.GymTimeFind();
                                  },
                                  child: const Image(
                                    image:
                                        AssetImage('assets/icons/button.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),

                        ///예약 확인
                        ViewContainer(
                          width: 322,
                          height: 248,
                          padding: EdgeInsets.all(20),
                          color: colorScheme.onTertiary,
                          child: Column(
                            children: [
                              HeadlineMediumText(
                                isEnglish: false,
                                text: '내일도 같은 시간?',
                                letterSpacing: -2.0,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 8),
                              LabelLargeText(
                                text: MainHomeViewController
                                    .MianHomeView_first_reservation,
                                letterSpacing: -1.4,
                                fontWeight: FontWeight.w300,
                              ),
                              LabelLargeText(
                                text: MainHomeViewController
                                    .MianHomeView_second_reservation,
                                letterSpacing: -1.4,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Image(
                                    image:
                                        AssetImage('assets/icons/button.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),

                        ///공지 이벤트
                        ViewContainer(
                          width: 322,
                          height: 248,
                          padding: EdgeInsets.all(20),
                          color: colorScheme.onSecondary,
                          child: Column(
                            children: [
                              HeadlineMediumText(
                                isEnglish: false,
                                text: '지금 스타디온은?',
                                letterSpacing: -2.0,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 6),
                              LabelLargeText(
                                isEnglish: false,
                                text:
                                    MainHomeViewController.MianHomeView_notice,
                                letterSpacing: -1.4,
                                fontWeight: FontWeight.w300,
                              ),
                              LabelLargeText(
                                isEnglish: false,
                                text: MainHomeViewController.MianHomeView_event,
                                letterSpacing: -1.4,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(const NoticeEventView(
                                      isEvent: true,
                                    ));
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/icons/noticebutton.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 60),

                ///몸레벨 타이틀
                Container(
                  alignment: Alignment.centerLeft,
                  child: HeadlineMediumText(
                    isEnglish: false,
                    text: '당신의 몸 레벨\n칭찬해!',
                    letterSpacing: -2.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 30),

                ///AIR 그래프
                GestureDetector(
                  onTap: () {
                    Get.to(const MainMomLevelView());
                  },
                  child: ViewContainer(
                    width: 662,
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    color: colorScheme.onBackground,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
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
                            const SizedBox(height: 37),
                            HeadlineLargeText(
                              text:
                                  MainHomeViewController.MianHomeView_air_level,
                              color: colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                ///FORCE 그래프
                ViewContainer(
                  width: 662,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: colorScheme.onBackground,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
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
                          const SizedBox(height: 37),
                          HeadlineLargeText(
                            text:
                                MainHomeViewController.MianHomeView_force_level,
                            color: colorScheme.tertiary,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                ///FLY 그래프
                ViewContainer(
                  width: 662,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: colorScheme.onBackground,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
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
                          const SizedBox(height: 37),
                          HeadlineLargeText(
                            text: MainHomeViewController.MianHomeView_fly_level,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 232),
              ],
            ),
          ),
        );
      }),
    );
  }
}

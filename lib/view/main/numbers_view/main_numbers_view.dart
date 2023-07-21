import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_challenge_explanation_popup_view.dart';
import 'package:stadion_project/view/main/numbers_view/popup/numbers_record_popup_view.dart';
import 'package:table_calendar/table_calendar.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainNumbersViewController extends GetxController {
  static const String MainNumbersView_activity_percent = '71%';
  static const String MainNumbersView_activity_attend_number = '22';

  static const String MainNumbersView_noshow_percent = '71%';
  static const String MainNumbersView_noshow_absent_number = '4';

  static const String MainNumbersView_Participation = '5';
  static const String MainNumbersView_rank = '20';
  static const String MainNumbersView_average = '15';

  static const String MainNumbersView_mtc_month_record = '10월 Mtc';
  static const String MainNumbersView_mtc_record = 'FORCE OQ1';
  static const String MainNumbersView_mtc_person = '123';
  static const String MainNumbersView_mtc_badge = '23';
  static const String MainNumbersView_mtc_clock = '2:41:58';
  static const String MainNumbersView_mtc_graph = '9:41:58';

  static const String MainNumbersView_personal_1rm_title = 'OVERHEAD\nSQUAT';
  static const String MainNumbersView_personal_1rm_date = '2023.2.17';
  static const String MainNumbersView_personal_1rm_rm = '1RM';
  static const String MainNumbersView_personal_1rm_lb = '410 lb';
  static const String MainNumbersView_personal_1rm_number = '150회';

  static const String MainNumbersView_personal_3rm_title = 'AIR\nSQUAT';
  static const String MainNumbersView_personal_3rm_date = '2023.5.17';
  static const String MainNumbersView_personal_3rm_rm = '3RM';
  static const String MainNumbersView_personal_3rm_lb = '710 lb';
  static const String MainNumbersView_personal_3rm_number = '450회';

  static const String MainNumbersView_personal_5rm_title = 'FORCE\nSQUAT';
  static const String MainNumbersView_personal_5rm_date = '2023.8.17';
  static const String MainNumbersView_personal_5rm_rm = '5RM';
  static const String MainNumbersView_personal_5rm_lb = '910 lb';
  static const String MainNumbersView_personal_5rm_number = '950회';

  static const String MainNumbersView_1000pound_total_lb = '960';
  static const String MainNumbersView_1000pound_deadlift_lb = '40';
  static const String MainNumbersView_1000pound_backsquat_lb = '350';
  static const String MainNumbersView_1000pound_benchpress_lb = '200';
  static const String MainNumbersView_1000pound_1000pound_lb = '99';
  static const String MainNumbersView_1000pound_Phrases = '얼마 안 남았어요!\n화이팅!';

  static const String MainNumbersView_man_rank = '1';
  static const String MainNumbersView_man_momster = 'idorname';
  static const String MainNumbersView_man_daedlift = '355 lb';
  static const String MainNumbersView_man_backsquat = '305 lb';
  static const String MainNumbersView_man_banchpress = '2,355 lb';
  static const String MainNumbersView_man_total = '2,955 lb';

  static const String MainNumbersView_woman_rank = '1';
  static const String MainNumbersView_woman_momster = 'idorname';
  static const String MainNumbersView_woman_daedlift = '455 lb';
  static const String MainNumbersView_woman_backsquat = '405 lb';
  static const String MainNumbersView_woman_banchpress = '4,355 lb';
  static const String MainNumbersView_woman_total = '4,955 lb';

  static const String MainNumbersView_top_event = 'AIR SQUAT';
  static const String MainNumbersView_top_total_number = '160회';
  static const String MainNumbersView_top_usr = 'USER NAME';
  static const String MainNumbersView_top_usr_number = '150회';

  var date = DateTime.now();

  bool isMonth = true;
  bool isYear = false;

  void selectMonth(bool isMonth) {
    this.isMonth = isMonth;
    update();
  }

  void selectYear(bool isYear) {
    this.isYear = isYear;
    update();
  }

  bool is1rm = true;
  bool is3rm = false;

  void select1rm(bool is1rm) {
    this.is1rm = is1rm;
    update();
  }

  void select3rm(bool is3rm) {
    this.is3rm = is3rm;
    update();
  }

  bool isReach = true;

  void selectReach(bool isReach) {
    this.isReach = isReach;
    update();
  }

  bool isMan = true;

  void selectMan(bool isMan) {
    this.isMan = isMan;
    update();
  }

  void NumbersFind() {
    Get.dialog(
      MomsterChallengePopupView(),
      barrierColor: Colors.transparent,
    );
  }

  void NumbersRecordFind() {
    Get.dialog(
      NumbersRecordPopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class MainNumbersView extends GetView<MainNumbersViewController> {
  const MainNumbersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainNumbersViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'NUMBERS',
          isEnglishTitle: true,
          withMenu: false,
          withAction: true,
          onLeading: () {},
        ),
      ),
      drawer: MainMenuBarView(),
      body: GetBuilder<MainNumbersViewController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                const SizedBox(height: 55),

                ///월별, 년도, 모두 선택 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.selectMonth(true);
                        controller.selectYear(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.isMonth
                          ? colorScheme.primary
                          : controller.isYear
                              ? colorScheme.onBackground
                              : colorScheme.onBackground,
                      text: 'MONTH',
                      isSelected: controller.isMonth
                          ? true
                          : controller.isYear
                              ? false
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.selectMonth(false);
                        controller.selectYear(true);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.isMonth
                          ? colorScheme.onBackground
                          : controller.isYear
                              ? colorScheme.primary
                              : colorScheme.onBackground,
                      text: 'YEAR',
                      isSelected: controller.isMonth
                          ? false
                          : controller.isYear
                              ? true
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.selectMonth(false);
                        controller.selectYear(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.isMonth
                          ? colorScheme.onBackground
                          : controller.isYear
                              ? colorScheme.onBackground
                              : colorScheme.primary,
                      text: 'ALL',
                      isSelected: controller.isMonth
                          ? false
                          : controller.isYear
                              ? false
                              : true,
                    ),
                  ],
                ),
                const SizedBox(height: 69),

                ///날짜
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('y년 M월').format(controller.date),
                      style: textThemeKo.labelSmall!
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                ///참석 불참 현황
                Row(
                  children: [
                    ViewContainer(
                      width: 322,
                      height: 228,
                      padding: EdgeInsets.fromLTRB(20, 26, 20, 7),
                      color: colorScheme.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LabelLargeText(
                                text: 'ACTIVITY',
                                fontWeight: FontWeight.w500,
                              ),
                              TitleMediumText(
                                text: MainNumbersViewController
                                    .MainNumbersView_activity_percent,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DisplayMediumText(
                                text: MainNumbersViewController
                                    .MainNumbersView_activity_attend_number,
                                fontWeight: FontWeight.w600,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                  ),
                                  LabelLargeText(
                                    text: '참석',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: -1.4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    ViewContainer(
                      width: 322,
                      height: 228,
                      padding: EdgeInsets.fromLTRB(20, 26, 20, 7),
                      color: colorScheme.onPrimary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LabelLargeText(
                                text: 'NO SHOW',
                                fontWeight: FontWeight.w500,
                              ),
                              TitleMediumText(
                                text: MainNumbersViewController
                                    .MainNumbersView_noshow_percent,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DisplayMediumText(
                                text: MainNumbersViewController
                                    .MainNumbersView_noshow_absent_number,
                                fontWeight: FontWeight.w600,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.NumbersFind();
                                    },
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/icons/numbers_i.png'),
                                      ),
                                    ),
                                  ),
                                  LabelLargeText(
                                    text: '불참',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: -1.4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38), // spaces

                if (controller.isMonth)
                  TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2023, 01, 01),
                    lastDay: DateTime.utc(2123, 12, 31),
                    locale: 'ko_KR',
                    daysOfWeekHeight: 60,
                    rowHeight: 60,
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      isTodayHighlighted: false,
                      tableBorder: TableBorder(
                        top: BorderSide(color: colorScheme.shadow),
                        bottom: BorderSide(color: colorScheme.shadow),
                      ),
                      defaultTextStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 26,
                      ),
                      weekendTextStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 26,
                        color: colorScheme.error,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: colorScheme.shadow,
                        size: 35,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: colorScheme.shadow,
                        size: 35,
                      ),
                      titleTextFormatter: (date, locale) =>
                          DateFormat.M(locale).format(date),
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 26,
                      ),
                    ),
                    calendarBuilders:
                        CalendarBuilders(dowBuilder: (context, day) {
                      switch (day.weekday) {
                        case 1:
                          return buildCalendarBuilders(
                            text: '월',
                            color: colorScheme.shadow,
                          );
                        case 2:
                          return buildCalendarBuilders(
                            text: '화',
                            color: colorScheme.shadow,
                          );
                        case 3:
                          return buildCalendarBuilders(
                            text: '수',
                            color: colorScheme.shadow,
                          );
                        case 4:
                          return buildCalendarBuilders(
                            text: '목',
                            color: colorScheme.shadow,
                          );
                        case 5:
                          return buildCalendarBuilders(
                            text: '금',
                            color: colorScheme.shadow,
                          );
                        case 6:
                          return buildCalendarBuilders(
                            text: '토',
                            color: colorScheme.error,
                          );
                        case 7:
                          return buildCalendarBuilders(
                            text: '일',
                            color: colorScheme.error,
                          );
                      }
                    }),
                  ),

                if (controller.isYear)
                  Column(
                    children: [
                      Container(
                        height: 400,
                        color: colorScheme.onBackground,
                      ),
                      const SizedBox(height: 65),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadlineSmallText(
                            text: 'TOP 10 MOVEMENTS OF THE MONTH',
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.NumbersFind();
                            },
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image(
                                image: AssetImage('assets/icons/numbers_i.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 38),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ViewContainer(
                              width: 280,
                              height: 266,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              color: colorScheme.onBackground,
                              child: Column(
                                children: [
                                  LabelLargeText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_event,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 40),
                                  LabelSmallText(
                                    text: 'ALL',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_total_number,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(height: 20),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_usr,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_usr_number,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            ViewContainer(
                              width: 280,
                              height: 266,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              color: colorScheme.onBackground,
                              child: Column(
                                children: [
                                  LabelLargeText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_event,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 40),
                                  LabelSmallText(
                                    text: 'ALL',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_total_number,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(height: 20),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_usr,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_usr_number,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            ViewContainer(
                              width: 280,
                              height: 266,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              color: colorScheme.onBackground,
                              child: Column(
                                children: [
                                  LabelLargeText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_event,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 40),
                                  LabelSmallText(
                                    text: 'ALL',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_total_number,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(height: 20),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_usr,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  LabelSmallText(
                                    text: MainNumbersViewController
                                        .MainNumbersView_top_usr_number,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                if(!controller.isMonth && !controller.isYear)
                  Container(
                    height: 500,
                    color: colorScheme.onBackground,
                  ),

                  const SizedBox(height: 66),
                ///몬스터 첼린지 타이틀
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadlineSmallText(
                      text: 'MoMSTER THE CHALLENGE',
                      fontWeight: FontWeight.w600,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.NumbersFind();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/icons/numbers_i.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    ViewContainer(
                      width: 208,
                      height: 208,
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 20),
                      color: Color(0xfff7cf2a),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DisplayMediumText(
                            text: MainNumbersViewController
                                .MainNumbersView_Participation,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelLargeText(
                            text: '참여/회',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 19),
                    ViewContainer(
                      width: 208,
                      height: 208,
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 20),
                      color: colorScheme.secondaryContainer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DisplayMediumText(
                            text:
                                MainNumbersViewController.MainNumbersView_rank,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelLargeText(
                            text: 'Rank/평균',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 19),
                    ViewContainer(
                      width: 208,
                      height: 208,
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 20),
                      color: colorScheme.onTertiary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DisplayMediumText(
                            text: MainNumbersViewController
                                .MainNumbersView_average,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelLargeText(
                            text: '평균/회',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('y').format(controller.date),
                      style: textThemeKo.labelSmall!
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ViewContainer(
                        width: 280,
                        height: 393,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: colorScheme.onBackground,
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/icons/momster.png'),
                            ),
                            const SizedBox(height: 20),
                            LabelLargeText(
                              text: MainNumbersViewController
                                  .MainNumbersView_mtc_month_record,
                              fontWeight: FontWeight.w600,
                            ),
                            LabelLargeText(
                              text: MainNumbersViewController
                                  .MainNumbersView_mtc_record,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/person.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_person,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/clock.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_clock,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 21),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/graph.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_graph,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/badge.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_badge,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      ViewContainer(
                        width: 280,
                        height: 393,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: colorScheme.onBackground,
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/momster.png'),
                            ),
                            const SizedBox(height: 20),
                            const LabelLargeText(
                              text: MainNumbersViewController
                                  .MainNumbersView_mtc_month_record,
                              fontWeight: FontWeight.w600,
                            ),
                            const LabelLargeText(
                              text: MainNumbersViewController
                                  .MainNumbersView_mtc_record,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/person.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_person,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Image(
                                      image:
                                          AssetImage('assets/images/clock.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_clock,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 21),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: const [
                                    Image(
                                      image:
                                          AssetImage('assets/images/graph.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_graph,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Image(
                                      image:
                                          AssetImage('assets/images/badge.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_badge,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      ViewContainer(
                        width: 280,
                        height: 393,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: colorScheme.onBackground,
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/icons/momster.png'),
                            ),
                            SizedBox(height: 20),
                            LabelLargeText(
                              text: MainNumbersViewController
                                  .MainNumbersView_mtc_month_record,
                              fontWeight: FontWeight.w600,
                            ),
                            LabelLargeText(
                              text: MainNumbersViewController
                                  .MainNumbersView_mtc_record,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/person.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_person,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/clock.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_clock,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 21),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/graph.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_graph,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/badge.png'),
                                    ),
                                    LabelSmallText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_mtc_badge,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 67),

                ///최고 기록
                Row(
                  children: [
                    HeadlineSmallText(
                      text: 'PERSONAL BEST',
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 312),
                    GestureDetector(
                      onTap: () {
                        controller.NumbersRecordFind();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/icons/pencil.png'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.NumbersFind();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/icons/numbers_i.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.select1rm(true);
                        controller.select3rm(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.is1rm
                          ? colorScheme.primary
                          : controller.is3rm
                              ? colorScheme.onBackground
                              : colorScheme.onBackground,
                      text: '1RM',
                      isSelected: controller.is1rm
                          ? true
                          : controller.is3rm
                              ? false
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.select1rm(false);
                        controller.select3rm(true);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.is1rm
                          ? colorScheme.onBackground
                          : controller.is3rm
                              ? colorScheme.primary
                              : colorScheme.onBackground,
                      text: '3RM',
                      isSelected: controller.is1rm
                          ? false
                          : controller.is3rm
                              ? true
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.select1rm(false);
                        controller.select3rm(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: true,
                      color: controller.is1rm
                          ? colorScheme.onBackground
                          : controller.is3rm
                              ? colorScheme.onBackground
                              : colorScheme.primary,
                      text: '5RM',
                      isSelected: controller.is1rm
                          ? false
                          : controller.is3rm
                              ? false
                              : true,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (controller.is1rm)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_1rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_1rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_rm,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_1rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_1rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: '1RM',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_1rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_1rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: '1RM',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_1rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (controller.is3rm)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: const LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_3rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_3rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: const [
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_rm,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_3rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_3rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: '1RM',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_3rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_3rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: '1RM',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_3rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!controller.is1rm && !controller.is3rm)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_5rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_5rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_rm,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_5rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_5rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: '1RM',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        ViewContainer(
                          width: 280,
                          height: 283,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          color: colorScheme.onBackground,
                          child: Column(
                            children: [
                              Container(
                                height: 68,
                                alignment: Alignment.topCenter,
                                child: LabelLargeText(
                                  textAlign: TextAlign.center,
                                  text: MainNumbersViewController
                                      .MainNumbersView_personal_5rm_title,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LabelSmallText(
                                text: MainNumbersViewController
                                    .MainNumbersView_personal_5rm_date,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      LabelSmallText(
                                        text: '1RM',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_lb,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/images/set.png'),
                                      ),
                                      const SizedBox(height: 15),
                                      LabelSmallText(
                                        text: MainNumbersViewController
                                            .MainNumbersView_personal_5rm_number,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 65),

                ///스타디온 1000파운드 클럽
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadlineSmallText(
                      text: 'STADION "1000-POUND CLUB"',
                      fontWeight: FontWeight.w600,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.NumbersFind();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/icons/numbers_i.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Column(
                  children: [
                    ViewContainer(
                      width: 662,
                      height: 218,
                      color: colorScheme.primary,
                      padding: EdgeInsets.fromLTRB(0, 42, 0, 20),
                      child: Column(
                        children: [
                          DisplayMediumText(
                            text: MainNumbersViewController
                                .MainNumbersView_1000pound_total_lb,
                            fontWeight: FontWeight.w600,
                          ),
                          LabelLargeText(
                            text: 'TOTAL lb',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        ViewContainer(
                          width: 208,
                          height: 218,
                          padding: EdgeInsets.fromLTRB(24, 46, 24, 18),
                          color: colorScheme.secondaryContainer,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 73,
                                    alignment: Alignment.bottomRight,
                                    child: BodyLargeText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_1000pound_deadlift_lb,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 30,
                                    height: 73,
                                    alignment: Alignment.bottomRight,
                                    child: HeadlineSmallText(
                                      text: 'lb',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 13),
                              Container(
                                height: 68,
                                alignment: Alignment.center,
                                child: LabelLargeText(
                                  text: 'DEADLIFT',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 19),
                        ViewContainer(
                          width: 208,
                          height: 218,
                          padding: EdgeInsets.fromLTRB(24, 46, 24, 18),
                          color: colorScheme.tertiary,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 73,
                                    alignment: Alignment.bottomRight,
                                    child: BodyLargeText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_1000pound_backsquat_lb,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 30,
                                    height: 73,
                                    alignment: Alignment.bottomRight,
                                    child: HeadlineSmallText(
                                      text: 'lb',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 13),
                              Container(
                                height: 68,
                                alignment: Alignment.center,
                                child: LabelLargeText(
                                  text: 'BACK\nSQUAT',
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 19),
                        ViewContainer(
                          width: 208,
                          height: 218,
                          padding: EdgeInsets.fromLTRB(24, 46, 24, 18),
                          color: colorScheme.onTertiary,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 73,
                                    alignment: Alignment.bottomRight,
                                    child: BodyLargeText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_1000pound_benchpress_lb,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 30,
                                    height: 73,
                                    alignment: Alignment.bottomRight,
                                    child: HeadlineSmallText(
                                      text: 'lb',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 13),
                              Container(
                                height: 68,
                                alignment: Alignment.center,
                                child: LabelLargeText(
                                  text: 'BENCH\nPRESS',
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        ViewContainer(
                          width: 322,
                          height: 218,
                          padding: EdgeInsets.only(top: 30),
                          color: colorScheme.onPrimary,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 220,
                                    height: 105,
                                    alignment: Alignment.bottomRight,
                                    child: DisplayMediumText(
                                      text: MainNumbersViewController
                                          .MainNumbersView_1000pound_1000pound_lb,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 100,
                                    alignment: Alignment.bottomRight,
                                    child: LabelLargeText(
                                      text: '%',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 68,
                                alignment: Alignment.center,
                                child: LabelLargeText(
                                  text: '1,000 파운드 대비',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 17),
                        ViewContainer(
                          width: 322,
                          height: 218,
                          color: colorScheme.secondary,
                          child: Center(
                            child: HeadlineMediumText(
                              text: MainNumbersViewController
                                  .MainNumbersView_1000pound_Phrases,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.selectReach(true);
                      },
                      width: 322,
                      height: 70,
                      isEnglish: true,
                      color: controller.isReach
                          ? colorScheme.primary
                          : colorScheme.onBackground,
                      text: 'REACH',
                      isSelected: controller.isReach ? true : false,
                    ),
                    const SizedBox(width: 18),
                    TextTapButton(
                      onTap: () {
                        controller.selectReach(false);
                      },
                      width: 322,
                      height: 70,
                      isEnglish: true,
                      color: controller.isReach
                          ? colorScheme.onBackground
                          : colorScheme.primary,
                      text: 'HISTORY',
                      isSelected: controller.isReach ? false : true,
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                if (controller.isReach)
                  Container(
                    height: 330,
                    color: colorScheme.primary,
                  ),
                if (!controller.isReach)
                  Container(
                    height: 330,
                    color: colorScheme.onBackground,
                  ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.selectMan(true);
                      },
                      width: 322,
                      height: 70,
                      isEnglish: true,
                      color: controller.isMan
                          ? colorScheme.primary
                          : colorScheme.onBackground,
                      text: 'MAN',
                      isSelected: controller.isMan ? true : false,
                    ),
                    const SizedBox(width: 18),
                    TextTapButton(
                      onTap: () {
                        controller.selectMan(false);
                      },
                      width: 322,
                      height: 70,
                      isEnglish: true,
                      color: controller.isMan
                          ? colorScheme.onBackground
                          : colorScheme.primary,
                      text: 'WOMAN',
                      isSelected: controller.isMan ? false : true,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (controller.isMan)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 74,
                            child: LabelSmallText(
                              text: 'RANK\n',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 122,
                            child: LabelSmallText(
                              text: 'MoMSTER\n',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'DEAD\nLIFT',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'BACK\nSQUAT',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'BENCH\nPRESS',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'TOTAL\n',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_man_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!controller.isMan)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 74,
                            child: LabelSmallText(
                              text: 'RANK\n',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 122,
                            child: LabelSmallText(
                              text: 'MoMSTER\n',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'DEAD\nLIFT',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'BACK\nSQUAT',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'BENCH\nPRESS',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(width: 11),
                          SizedBox(
                            width: 100,
                            child: LabelSmallText(
                              text: 'TOTAL\n',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ViewContainer(
                        height: 60,
                        color: colorScheme.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 74,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_rank,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 122,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_momster,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_daedlift,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 1),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_backsquat,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_banchpress,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(width: 11),
                              SizedBox(
                                width: 100,
                                child: LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_woman_total,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 66),

                if (controller.isMonth || !controller.isMonth && !controller.isYear)
                ///TOP 10 MOVEMENTS
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadlineSmallText(
                          text: 'TOP 10 MOVEMENTS OF THE MONTH',
                          fontWeight: FontWeight.w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.NumbersFind();
                          },
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(
                              image: AssetImage('assets/icons/numbers_i.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 38),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ViewContainer(
                            width: 280,
                            height: 266,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            color: colorScheme.onBackground,
                            child: Column(
                              children: [
                                LabelLargeText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_event,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 40),
                                LabelSmallText(
                                  text: 'ALL',
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 6),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_total_number,
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(height: 20),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_usr,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 6),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_usr_number,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          ViewContainer(
                            width: 280,
                            height: 266,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            color: colorScheme.onBackground,
                            child: Column(
                              children: [
                                LabelLargeText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_event,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 40),
                                LabelSmallText(
                                  text: 'ALL',
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 6),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_total_number,
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(height: 20),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_usr,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 6),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_usr_number,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          ViewContainer(
                            width: 280,
                            height: 266,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            color: colorScheme.onBackground,
                            child: Column(
                              children: [
                                LabelLargeText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_event,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 40),
                                LabelSmallText(
                                  text: 'ALL',
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 6),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_total_number,
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(height: 20),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_usr,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 6),
                                LabelSmallText(
                                  text: MainNumbersViewController
                                      .MainNumbersView_top_usr_number,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 175),
                  ],
                ),

              ],
            ),
          ),
        );
      }),
    );
  }
}

class buildCalendarBuilders extends StatelessWidget {
  const buildCalendarBuilders({
    this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 15),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 26,
              color: color,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 86,
            height: 1,
            color: colorScheme.shadow,
          ),
        ],
      ),
    );
  }
}

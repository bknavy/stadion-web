import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/hamburger_menu/movement_guide_view.dart';
import 'package:stadion_project/view/main/mom_level_view/popup/mom_level_media_popup_view.dart';
import 'package:stadion_project/view/main/mom_level_view/popup/mom_level_record_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MomLevelDetailsCategoryViewController extends GetxController {
  static const String MomLevelDetailsCategoryView_category = 'FORCE';
  static const String MomLevelDetailsCategoryView_explanation = '   지치지 않는 몸';
  static const String MomLevelDetailsCategoryView_jumpRopeDu =
      'JUMP ROPE DU 5:00 MAX';

  static const String MomLevelDetailsCategoryView_i_recent = 'RECENT';
  static const String MomLevelDetailsCategoryView_i_data = '01.25.2023';
  static const String MomLevelDetailsCategoryView_i = 'I3';
  static const String MomLevelDetailsCategoryView_i_time = '3:51';

  static const String MomLevelDetailsCategoryView_e_recent = 'PERSONAL BEST';
  static const String MomLevelDetailsCategoryView_e_data = '01.25.2023';
  static const String MomLevelDetailsCategoryView_e = 'E';
  static const String MomLevelDetailsCategoryView_e_time = '2:56';

  static const String MomLevelDetailsCategoryView_a_recent = '2023 BEST';
  static const String MomLevelDetailsCategoryView_a_data = '01.25.2023';
  static const String MomLevelDetailsCategoryView_a = 'A3';
  static const String MomLevelDetailsCategoryView_a_time = '5:51';

  var date = DateTime.now();

  void RecordFind() {
    Get.dialog(
      MomLevelRecordPopupView(),
      barrierColor: Colors.transparent,
    );
  }

  void MediaFind() {
    Get.dialog(
      MomLevelMediaPopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class MomLevelDetailsCategoryView
    extends GetView<MomLevelDetailsCategoryViewController> {
  const MomLevelDetailsCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MomLevelDetailsCategoryViewController());
    return GetBuilder<MomLevelDetailsCategoryViewController>(
        builder: (controller) {
      return Scaffold(
        backgroundColor: colorScheme.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'MoM LEVEL',
                  style: TextStyle(
                    color: colorScheme.shadow,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
                centerTitle: true,
                iconTheme: IconThemeData(
                  color: colorScheme.shadow,
                  size: 50,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 50,
                    ),
                    color: colorScheme.shadow,
                  ),
                  //SizedBox(width: 18),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image_outlined,
                      size: 50,
                    ),
                    color: colorScheme.shadow,
                  ),
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                const SizedBox(height: 55),

                ///레벨마크 및 년도
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 544,
                          child: Row(
                            children: [
                              Text(
                                DateFormat('y').format(controller.date),
                                style: textThemeEn.headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              HeadlineSmallText(
                                text: ' LEVEL',
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 544,
                          child: Row(
                            children: [
                              LabelLargeText(
                                text: MomLevelDetailsCategoryViewController
                                    .MomLevelDetailsCategoryView_category,
                                fontWeight: FontWeight.w600,
                              ),
                              LabelSmallText(
                                text: MomLevelDetailsCategoryViewController
                                    .MomLevelDetailsCategoryView_explanation,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -1.2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 36),
                    Container(
                      width: 76,
                      height: 96,
                      color: colorScheme.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                ///무브먼트 보기
                Row(
                  children: [
                    SizedBox(
                      width: 419,
                      child: LabelLargeText(
                        text: MomLevelDetailsCategoryViewController
                            .MomLevelDetailsCategoryView_jumpRopeDu,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(const MovementGuideView());
                      },
                      child: Row(
                        children: [
                          LabelSmallText(
                            text: '무브먼트 설명보기',
                          ),
                          const SizedBox(width: 20),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                ///recent 그래프
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          height: 34,
                          child: LabelLargeText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_i_recent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 390,
                          height: 2,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          child: LabelSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_i_data,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: HeadlineSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_i,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        SizedBox(
                          width: 86,
                          child: HeadlineSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_i_time,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 201),
                        GestureDetector(
                          onTap: () {
                            controller.MediaFind();
                          },
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                ///personal 그래프
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          height: 34,
                          child: LabelLargeText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_e_recent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 390,
                          height: 2,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          child: LabelSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_e_data,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: HeadlineSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_e,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onTertiaryContainer,
                          ),
                        ),
                        SizedBox(
                          width: 86,
                          child: HeadlineSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_e_time,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 150),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 35,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                ///년도best 그래프
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          height: 34,
                          child: LabelLargeText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_a_recent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 390,
                          height: 2,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          child: LabelSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_a_data,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: HeadlineSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_a,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary,
                          ),
                        ),
                        SizedBox(
                          width: 86,
                          child: HeadlineSmallText(
                            text: MomLevelDetailsCategoryViewController
                                .MomLevelDetailsCategoryView_a_time,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 150),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 35,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                ///기록 그래프
                Column(
                  children: [
                    SizedBox(
                      width: 662,
                      child: LabelLargeText(
                        text: 'RECORD',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 662,
                      height: 218,
                      color: colorScheme.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                ///기록 작성하기
                Column(
                  children: [
                    HeadlineSmallText(
                      text: 'ALL RECORDS',
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const SizedBox(width: 31),
                        LabelSmallText(
                          text: 'DATE',
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(width: 108),
                        LabelSmallText(
                          text: 'SACLE',
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(width: 108),
                        LabelSmallText(
                          text: 'TIME',
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ViewContainer(
                      width: 661,
                      height: 60,
                      padding: EdgeInsets.fromLTRB(20, 15, 24, 15),
                      color: colorScheme.onBackground,
                      child: Row(
                        children: [
                          LabelSmallText(text: '2012. 01. 25'),
                          const SizedBox(width: 90),
                          HeadlineSmallText(
                            text: 'I2',
                            fontWeight: FontWeight.w600,
                            color: colorScheme.tertiary,
                          ),
                          const SizedBox(width: 130),
                          LabelSmallText(text: '6:55'),
                          const SizedBox(width: 140),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add_box_outlined,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 98),
                    ButtonWithRollover(
                      onTap: () {
                        controller.RecordFind();
                      },
                      backgroundColor: colorScheme.onBackground,
                      child: Center(
                        child: Text(
                          '기록하기',
                          style: textThemeKo.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.surfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/wod_view/popup/wod_box_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamViewController extends GetxController {}

class TimerCamView extends GetView<TimerCamViewController> {
  const TimerCamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      drawer: MainMenuBarView(),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/timer_cam.png',
            width: 750,
            height: 1462,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/timer_cam_black.png',
            width: 750,
            height: 1462,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.8),
          ),
          PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text('TIMER CAM',
                    style: TextStyle(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: colorScheme.background,
                    size: 50,
                  ),
                  actions: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search,
                        size: 50,
                      ),
                      color: colorScheme.background,
                    ),
                    //SizedBox(width: 18),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.image_outlined,
                        size: 50,
                      ),
                      color: colorScheme.background,
                    ),
                  ]
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 94),
              child: Column(
                children: [
                  SizedBox(
                    width: 562,
                    child: HeadlineSmallText(
                      text: 'STADION VIDEO TIMER',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.background,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ViewContainer(
                          width: 272,
                          height: 272,
                          color: colorScheme.primary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/timer_cam_amrap.png',
                              ),
                              const SizedBox(height: 13),
                              HeadlineMediumText(
                                text: 'AMRAP',
                                fontWeight: FontWeight.w700,
                                color: colorScheme.background,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: () {},
                        child: ViewContainer(
                          width: 272,
                          height: 272,
                          color: colorScheme.secondary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/timer_cam_tabata.png',
                              ),
                              const SizedBox(height: 13),
                              HeadlineMediumText(
                                text: 'TABATA',
                                fontWeight: FontWeight.w700,
                                color: colorScheme.background,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ViewContainer(
                          width: 272,
                          height: 272,
                          color: Color(0xff96da45),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/timer_cam_for_time.png',
                              ),
                              const SizedBox(height: 13),
                              HeadlineMediumText(
                                text: 'FOR TIME',
                                fontWeight: FontWeight.w700,
                                color: colorScheme.background,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: () {},
                        child: ViewContainer(
                          width: 272,
                          height: 272,
                          color: colorScheme.tertiary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/timer_cam_emom.png',
                              ),
                              const SizedBox(height: 13),
                              HeadlineMediumText(
                                text: 'EMOM',
                                fontWeight: FontWeight.w700,
                                color: colorScheme.background,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () {},
                    child: ViewContainer(
                      width: 562,
                      height: 135,
                      color: colorScheme.onError,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/timer_cam_stopwatch.png',
                          ),
                          const SizedBox(width: 15),
                          HeadlineMediumText(
                            text: 'STOPWATCH',
                            fontWeight: FontWeight.w700,
                            color: colorScheme.background,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 290),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: colorScheme.background
                          ),
                          child: Image.asset(
                            'assets/icons/timer_cam_video.png',
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: colorScheme.primary
                          ),
                          child: Image.asset(
                            'assets/icons/setting.png',
                          ),
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

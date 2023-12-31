import 'package:flutter/cupertino.dart';
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
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/delete_my_account_view/Application_membership_withdrawal_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/popup/address_change_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/popup/call_change_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/popup/greeting_change_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/popup/password_change_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/popup/profile_change_media_popup_view.dart';
import 'package:stadion_project/view/main/my_page_view/training_log_view/training_log_view.dart';
import 'package:stadion_project/view/main/my_page_view/wod_record_view/wod_record_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MyPageProfileViewController extends GetxController {
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var passwordController = TextEditingController();
  var nicknameController = TextEditingController();
  var callController = TextEditingController();
  var addressController = TextEditingController();
  var addressDetailController = TextEditingController();

  bool isProfile = true;
  bool isGreeting = true;
  bool isBasic = true;
  bool isInjury = false;
  bool isSwitched = false;
  bool passwordShow = true;

  void selectBasic(bool isBasic) {
    this.isBasic = isBasic;
    update();
  }

  void selectInjury(bool isInjury) {
    this.isInjury = isInjury;
    update();
  }

  int? defaultChoiceIndex;
  final List<String> _choicesList = ['MAIN', 'FEED', 'TIMER CAM', 'MoM LEVEL', 'MoMSTER', 'NUMBERS'];

  void selectIndex(index, value) {
    defaultChoiceIndex = value ? index : null;
    update();
  }

  int? informationChoiceIndex;
  final List<String> _informationList = ['이메일', 'SMS', '푸쉬알림'];

  void informationSelectIndex(index, value) {
    informationChoiceIndex = value ? index : null;
    update();
  }

  void ProfileChangeMediaFind() {
    Get.dialog(
      ProfileChangeMediaPopupView(),
      barrierColor: Colors.transparent,
    );
  }

  void GreetingChangeMediaFind() {
    Get.dialog(
      GreetingChangePopupView(),
      barrierColor: Colors.transparent,
    );
  }

  void PasswordChangeMediaFind() {
    Get.dialog(
      PasswordChangePopupView(),
      barrierColor: Colors.transparent,
    );
  }

  void CallChangeMediaFind() {
    Get.dialog(
      CallChangePopupView(),
      barrierColor: Colors.transparent,
    );
  }

  void AddressChangeMediaFind() {
    Get.dialog(
      AddressChangePopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class MyPageProfileView extends GetView<MyPageProfileViewController> {
  const MyPageProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MyPageProfileViewController());
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
      body: GetBuilder<MyPageProfileViewController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                const SizedBox(height: 50),

                ///이미지 및 변경버튼
                Container(
                  width: 662,
                  height: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ButtonWithRolloverUnion(
                            width: 208,
                            height: 70,
                            onTap: () {
                              controller.ProfileChangeMediaFind();
                            },
                            isRadius: false,
                            backgroundColor: colorScheme.onBackground,
                            highlightColor: colorScheme.shadow,
                            title: '프로필 사진 변경',
                            textColor: colorScheme.background,
                            changeTextColor: colorScheme.surfaceVariant,
                          ),
                          const SizedBox(height: 20),
                          ButtonWithRolloverUnion(
                            width: 208,
                            height: 70,
                            onTap: () {
                              controller.GreetingChangeMediaFind();
                            },
                            isRadius: false,
                            backgroundColor: colorScheme.onBackground,
                            highlightColor: colorScheme.shadow,
                            title: '인사말 변경',
                            textColor: colorScheme.background,
                            changeTextColor: colorScheme.surfaceVariant,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextTapButton(
                      onTap: () {
                        controller.selectBasic(true);
                        controller.selectInjury(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: false,
                      color: controller.isBasic
                          ? colorScheme.primary
                          : controller.isInjury
                              ? colorScheme.onBackground
                              : colorScheme.onBackground,
                      text: '기본',
                      textColor: controller.isBasic
                          ? colorScheme.shadow
                          : controller.isInjury
                              ? colorScheme.surfaceVariant
                              : colorScheme.surfaceVariant,
                      isSelected: controller.isBasic
                          ? true
                          : controller.isInjury
                              ? false
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.selectBasic(false);
                        controller.selectInjury(true);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: false,
                      color: controller.isBasic
                          ? colorScheme.onBackground
                          : controller.isInjury
                              ? colorScheme.primary
                              : colorScheme.onBackground,
                      text: '운동',
                      textColor: controller.isBasic
                          ? colorScheme.surfaceVariant
                          : controller.isInjury
                              ? colorScheme.shadow
                              : colorScheme.surfaceVariant,
                      isSelected: controller.isBasic
                          ? false
                          : controller.isInjury
                              ? true
                              : false,
                    ),
                    const SizedBox(width: 19),
                    TextTapButton(
                      onTap: () {
                        controller.selectBasic(false);
                        controller.selectInjury(false);
                      },
                      width: 208,
                      height: 70,
                      isEnglish: false,
                      color: controller.isBasic
                          ? colorScheme.onBackground
                          : controller.isInjury
                              ? colorScheme.onBackground
                              : colorScheme.primary,
                      text: '부상',
                      textColor: controller.isBasic
                          ? colorScheme.surfaceVariant
                          : controller.isInjury
                              ? colorScheme.surfaceVariant
                              : colorScheme.shadow,
                      isSelected: controller.isBasic
                          ? false
                          : controller.isInjury
                              ? false
                              : true,
                    ),
                  ],
                ),
                const SizedBox(height: 60),

                ///기본 페이지
                if (controller.isBasic)
                  Column(
                    children: [
                      ///설정 문구
                      SizedBox(
                        width: 662,
                        child: HeadlineSmallText(
                          text: '설정',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5,
                        ),
                      ),
                      const SizedBox(height: 21),
                      Container(
                        width: 662,
                        height: 2,
                        color: colorScheme.shadow,
                      ),
                      const SizedBox(height: 39),

                      ///초기화면 선택 버튼
                      Row(
                        children: [
                          SizedBox(
                            width: 227,
                            height: 248,
                            child: LabelLargeText(
                              text: '초기화면 선택',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -1.4,
                            ),
                          ),
                          Container(
                            width: 435,
                            child: Wrap(
                              spacing: 19,
                              runSpacing: 19,
                              children: List.generate(
                                  controller._choicesList.length, (index) {
                                return ChoiceChip(
                                  label: Container(
                                    width: 180,
                                    height: 60,
                                    alignment: Alignment.center,
                                    child: LabelLargeText(
                                      text: controller._choicesList[index],
                                      fontWeight:
                                          controller.defaultChoiceIndex == index
                                              ? FontWeight.w600
                                              : FontWeight.w300,
                                      color:
                                          controller.defaultChoiceIndex == index
                                              ? colorScheme.background
                                              : colorScheme.onSurface,
                                    ),
                                  ),
                                  selected:
                                      controller.defaultChoiceIndex == index,
                                  selectedColor: colorScheme.shadow,
                                  backgroundColor: colorScheme.background,
                                  side: BorderSide(
                                      color:
                                          controller.defaultChoiceIndex == index
                                              ? colorScheme.shadow
                                              : colorScheme.onSurface),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  onSelected: (value) {
                                    controller.selectIndex(index, value);
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: 662,
                        height: 1,
                        color: colorScheme.onSurface,
                      ),
                      const SizedBox(height: 9),
                      SizedBox(
                        width: 662,
                        child: LabelSmallText(
                          text: '초기 화면으로 사용할 페이지를 설정할 수 있습니다.',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.onSurface,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 40),

                      ///코치마크 선택 버튼
                      Row(
                        children: [
                          SizedBox(
                            width: 310,
                            child: LabelLargeText(
                              text: '코치마크',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -1.4,
                            ),
                          ),
                          Container(
                            width: 116,
                            height: 60,
                            color: colorScheme.onBackground,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: 662,
                        height: 1,
                        color: colorScheme.onSurface,
                      ),
                      const SizedBox(height: 9),
                      SizedBox(
                        width: 662,
                        child: LabelSmallText(
                          text: '앱 사용법을 안내하는 기능을 설정할 수 있습니다.',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.onSurface,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 100),

                      ///기본정보
                      SizedBox(
                        width: 662,
                        child: HeadlineSmallText(
                          text: '기본정보(필수)',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5,
                        ),
                      ),
                      const SizedBox(height: 21),
                      Container(
                        width: 662,
                        height: 2,
                        color: colorScheme.shadow,
                      ),
                      const SizedBox(height: 9),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.nameController,
                        prefixIcon: Container(
                          width: 150,
                          height: 34,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '이름',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      SizedBox(
                        width: 662,
                        child: LabelSmallText(
                          text: '이름은 변경할 수 없습니다.',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.onSurface,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.idController,
                        prefixIcon: Container(
                          width: 150,
                          height: 34,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '아이디',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 662,
                        child: LabelSmallText(
                          text: '아이디(이메일)은 변경할 수 없습니다.',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.onSurface,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.passwordController,
                        prefixIcon: Container(
                          width: 150,
                          height: 34,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '비밀번호',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        suffixIcon: ButtonWithRolloverUnion(
                          width: 180,
                          height: 50,
                          onTap: () {
                            controller.PasswordChangeMediaFind();
                          },
                          backgroundColor: colorScheme.onBackground,
                          highlightColor: colorScheme.shadow,
                          title: '비밀번호 변경',
                          textColor: colorScheme.background,
                          changeTextColor: colorScheme.surfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.nicknameController,
                        prefixIcon: Container(
                          width: 150,
                          height: 34,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '닉네임',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),

                      ///연락처
                      SizedBox(
                        width: 662,
                        child: HeadlineSmallText(
                          text: '연락처(필수)',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5,
                        ),
                      ),
                      const SizedBox(height: 21),
                      Container(
                        width: 662,
                        height: 2,
                        color: colorScheme.shadow,
                      ),
                      const SizedBox(height: 25),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.passwordController,
                        prefixIcon: Container(
                          width: 150,
                          height: 34,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '휴대폰 번호',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        suffixIcon: ButtonWithRolloverUnion(
                          width: 180,
                          height: 50,
                          onTap: () {
                            controller.CallChangeMediaFind();
                          },
                          backgroundColor: colorScheme.onBackground,
                          highlightColor: colorScheme.shadow,
                          title: '전화번호 변경',
                          textColor: colorScheme.background,
                          changeTextColor: colorScheme.surfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 14),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.passwordController,
                        prefixIcon: Container(
                          width: 150,
                          height: 34,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '주소',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        suffixIcon: ButtonWithRolloverUnion(
                          width: 180,
                          height: 50,
                          onTap: () {
                            controller.AddressChangeMediaFind();
                          },
                          backgroundColor: colorScheme.onBackground,
                          highlightColor: colorScheme.shadow,
                          title: '주소 변경',
                          textColor: colorScheme.background,
                          changeTextColor: colorScheme.surfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 14),
                      MembershipTextFormField(
                        onChanged: (value) {},
                        controller: controller.nameController,
                        prefixIcon: SizedBox(
                          width: 150,
                          height: 34,
                        ),
                      ),
                      const SizedBox(height: 100),

                      ///정보수신동의
                      SizedBox(
                        width: 662,
                        child: HeadlineSmallText(
                          text: '정보수신동의',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5,
                        ),
                      ),
                      const SizedBox(height: 21),
                      Container(
                        width: 662,
                        height: 2,
                        color: colorScheme.shadow,
                      ),
                      const SizedBox(height: 35),
                      Wrap(
                        spacing: 19,
                        runSpacing: 19,
                        children: List.generate(
                            controller._informationList.length, (index) {
                          return ChoiceChip(
                            label: Container(
                              width: 180,
                              height: 60,
                              alignment: Alignment.center,
                              child: LabelLargeText(
                                text: controller._informationList[index],
                                fontWeight:
                                    controller.informationChoiceIndex == index
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                color:
                                    controller.informationChoiceIndex == index
                                        ? colorScheme.background
                                        : colorScheme.onSurface,
                              ),
                            ),
                            selected:
                                controller.informationChoiceIndex == index,
                            selectedColor: colorScheme.shadow,
                            backgroundColor: colorScheme.background,
                            side: BorderSide(
                                color:
                                    controller.informationChoiceIndex == index
                                        ? colorScheme.shadow
                                        : colorScheme.onSurface),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onSelected: (value) {
                              controller.informationSelectIndex(index, value);
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 662,
                        child: LabelSmallText(
                          text:
                              '스타디온 각 지점에서 발신하는 개별 이메일, SMS 및 기타 연락에 대한\n동의가 아닌 스타디온 앱의 전용 메시지에 대한 동의 건입니다.',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.onSurface,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        width: 662,
                        alignment: Alignment.centerRight,
                        child: ButtonWithRolloverUnion(
                          width: 208,
                          height: 70,
                          onTap: () {
                            Get.to(const ApplicationMembershipWithdrawalView());
                          },
                          isBorder: false,
                          backgroundColor: Colors.transparent,
                          highlightColor: colorScheme.shadow,
                          title: '회원탈퇴',
                          textColor: colorScheme.background,
                          changeTextColor: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 100),
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

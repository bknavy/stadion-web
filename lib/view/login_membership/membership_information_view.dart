import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/login_membership/popup/address_popup_view.dart';
import 'package:stadion_project/view/login_membership/popup/birthday_popup_view.dart';
import 'package:stadion_project/view/login_membership/popup/complete_popup_view.dart';
import 'package:stadion_project/view/login_membership/popup/height_weight_popup_view.dart';
import 'package:stadion_project/view/login_membership/popup/sex_popup_view.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_text.dart';
import 'membership_password_input_view.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

//로그인 뷰에서 사용될 Get X controller.
class MembershipInformationViewController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var callController = TextEditingController();
  var addressController = TextEditingController();
  var addressDetailController = TextEditingController();
  var sexController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var birthdayController = TextEditingController();
  var eventController = TextEditingController();
  var careerController = TextEditingController();

  bool nameShow = true;
  bool emailShow = true;
  bool callShow = true;
  bool addressShow = true;
  bool addressDetailShow = true;
  bool addressSearchShow = true;
  bool sexShow = true;
  bool heightShow = true;
  bool weightShow = true;
  bool birthdayShow = true;

  String isAddress = '';
  String isAddressDetail = '';
  String isPost = '';
  bool isMale = true;
  String isHeight = '';
  String isWeight = '';
  String isYear = '';
  String isMonth = '';
  String isDay = '';

  void nameField(bool nameShow) {
    this.nameShow = nameShow;
    update();
  }

  void emailField(bool emailShow) {
    this.emailShow = emailShow;
    update();
  }

  void callField(bool callShow) {
    this.callShow = callShow;
    update();
  }

  void addressSearchField(bool addressShow, bool addressSearchShow) {
    this.addressShow = addressShow;
    this.addressSearchShow = addressSearchShow;
    update();
  }

  void addressDetailField(bool addressDetailShow) {
    this.addressDetailShow = addressDetailShow;
    update();
  }

  void sexField(bool sexShow) {
    this.sexShow = sexShow;
    update();
  }

  void heightField(bool heightShow) {
    this.heightShow = heightShow;
    update();
  }

  void weightField(bool weightShow) {
    this.weightShow = weightShow;
    update();
  }

  void birthdayField(bool birthdayShow) {
    this.birthdayShow = birthdayShow;
    update();
  }

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void applyAddress(String value) {
    isAddress = value;
    addressController.text = '${isAddress}';
    update();
  }

  void applyAddressDetail(String valueAddressDetail, String valuePost) {
    isAddressDetail = valueAddressDetail;
    isPost = valuePost;
    addressDetailController.text = '${isAddressDetail} (우)${isPost}';
    update();
  }

  void applySex(bool value) {
    isMale = value;
    sexController.text = isMale ? "남자" : "여자";
    update();
  }

  void applyHeight(String value) {
    isHeight = value;
    heightController.text = '${isHeight} cm';
    update();
  }

  void applyWeight(String value) {
    isWeight = value;
    weightController.text = '${isWeight} kg';
    update();
  }

  void applyBirthday(String valueYear, String valueMonth, String valueDay) {
    isYear = valueYear;
    isMonth = valueMonth;
    isDay = valueDay;
    birthdayController.text = '${isYear}. ${isMonth}. ${isDay}';
    update();
  }

  void AddressFind() {
    Get.dialog(
      AddressPopupView(
          applyAddressAtSub: applyAddress,
          applyAddressDetailAtSub: applyAddressDetail),
      barrierColor: Colors.transparent,
    );
  }

  void SexFind() {
    Get.dialog(
      SexPopupView(applySexAtSub: applySex),
      barrierColor: Colors.transparent,
    );
  }

  void HeightWeightFind() {
    Get.dialog(
      HeightWeightPopupView(
          applyHeightAtSub: applyHeight, applyWeightAtSub: applyWeight),
      barrierColor: Colors.transparent,
    );
  }

  void BirthdayFind() {
    Get.dialog(
      BirthdayPopupView(applyBirthdayAtSub: applyBirthday),
      barrierColor: Colors.transparent,
    );
  }

  void CompleteFind() {
    Get.dialog(
      CompletePopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class MembershipInformationView
    extends GetView<MembershipInformationViewController> {
  const MembershipInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MembershipInformationViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: '회원가입',
          isEnglishTitle: false,
          withMenu: true,
          withAction: false,
          onLeading: () {
            Get.off(const MembershipPasswordInputView());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            LoginTitle(
              text: '스타디온 앱에서 사용할\n추가 정보를 입력해 주세요.',
            ),
            const SizedBox(height: 86),

            ///연락처
            buildContactField(),
            const SizedBox(height: 101),

            ///신체정보
            buildBodyField(),
            const SizedBox(height: 101),

            ///운동선호도
            buildSportsField(),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                controller._addItem();
              },
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
            const SizedBox(height: 90),
            GetBuilder<MembershipInformationViewController>(
                builder: (controller) {
              return ButtonWithRollover(
                onTap: () {
                  controller.CompleteFind();
                },
                backgroundColor: controller.nameShow &&
                        controller.emailShow &&
                        controller.callShow &&
                        controller.addressShow &&
                        controller.addressDetailShow &&
                        controller.sexShow &&
                        controller.heightShow &&
                        controller.weightShow &&
                        controller.birthdayShow
                    ? colorScheme.primary
                    : colorScheme.onBackground,
                child: Center(
                  child: Text(
                    '완료',
                    style: textThemeKo.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.nameShow &&
                              controller.emailShow &&
                              controller.callShow &&
                              controller.addressShow &&
                              controller.addressDetailShow &&
                              controller.sexShow &&
                              controller.heightShow &&
                              controller.weightShow &&
                              controller.birthdayShow
                          ? colorScheme.shadow
                          : colorScheme.surfaceVariant,
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 232),
          ],
        ),
      ),
    );
  }

  ///연락처 입력
  Column buildContactField() {
    return Column(
      children: [
        GetBuilder<MembershipInformationViewController>(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 94),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '기본정보(필수)',
                      style: textThemeKo.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 21.5),
                    Container(
                      width: 562,
                      height: 2,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    const SizedBox(height: 9.5),
                  ],
                ),
              ),

              ///이름 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.nameField(true);
                  } else {
                    controller.nameField(false);
                  }
                },
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
              const SizedBox(height: 10),

              ///이메일 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.emailField(true);
                  } else {
                    controller.emailField(false);
                  }
                },
                controller: controller.emailController,
                prefixIcon: Container(
                  width: 150,
                  height: 34,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '이메일',
                    style: textThemeKo.labelLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              ///휴대폰 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.callField(true);
                  } else {
                    controller.callField(false);
                  }
                },
                controller: controller.callController,
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
              ),
              const SizedBox(height: 10),

              ///주소 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.addressSearchField(true, false);
                  } else {
                    controller.addressSearchField(false, true);
                  }
                },
                controller: controller.addressController,
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
                suffixIcon: controller.addressSearchShow
                    ? GestureDetector(
                        onTap: () {
                          controller.AddressFind();
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: colorScheme.onBackground,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '검색하기',
                            style: textThemeKo.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 10),

              ///상세주소 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.addressDetailField(true);
                  } else {
                    controller.addressDetailField(false);
                  }
                },
                controller: controller.addressDetailController,
                prefixIcon: Container(
                  width: 150,
                  height: 34,
                  alignment: Alignment.centerLeft,
                  child: Text(''),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  ///신체정보 입력
  Column buildBodyField() {
    return Column(
      children: [
        GetBuilder<MembershipInformationViewController>(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 94),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '신체정보(필수)',
                      style: textThemeKo.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 21.5),
                    Container(
                      width: 562,
                      height: 2,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    const SizedBox(height: 9.5),
                  ],
                ),
              ),

              ///성별 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.sexField(true);
                  } else {
                    controller.sexField(false);
                  }
                },
                onTap: () {
                  controller.SexFind();
                },
                controller: controller.sexController,
                prefixIcon: Container(
                  width: 120,
                  height: 34,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '성별',
                    style: textThemeKo.labelLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.SexFind();
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),

              ///신장 체중 입력창
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 94),
                child: Row(
                  children: [
                    MembershipTextFormSmallField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.heightField(true);
                        } else {
                          controller.heightField(false);
                        }
                      },
                      onTap: () {
                        controller.HeightWeightFind();
                      },
                      controller: controller.heightController,
                      prefixIcon: Container(
                        width: 120,
                        height: 34,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '신장',
                          style: textThemeKo.labelLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.HeightWeightFind();
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    MembershipTextFormSmallField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.weightField(true);
                        } else {
                          controller.weightField(false);
                        }
                      },
                      onTap: () {
                        controller.HeightWeightFind();
                      },
                      controller: controller.weightController,
                      prefixIcon: Container(
                        width: 120,
                        height: 34,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '체중',
                          style: textThemeKo.labelLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.HeightWeightFind();
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              ///생년월일 입력창
              MembershipTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.birthdayField(true);
                  } else {
                    controller.birthdayField(false);
                  }
                },
                onTap: () {
                  controller.BirthdayFind();
                },
                controller: controller.birthdayController,
                prefixIcon: Container(
                  width: 120,
                  height: 34,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '생년월일',
                    style: textThemeKo.labelLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.BirthdayFind();
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        }),
      ],
    );
  }

  ///운동선호도 입력
  Column buildSportsField() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '운동선호도(선택)',
              style: textThemeKo.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 21.5),
            Container(
              width: 562,
              height: 2,
              decoration: BoxDecoration(color: Colors.black),
            ),
            const SizedBox(height: 9.5),
          ],
        ),

        ///종목 경력 입력창
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 94),
          child: AnimatedList(
              key: controller._key,
              initialItemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          MembershipTextFormSmallField(
                            controller: controller.eventController,
                            prefixIcon: Container(
                              width: 150,
                              height: 34,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '종목',
                                style: textThemeKo.labelLarge!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          MembershipTextFormSmallField(
                            controller: controller.careerController,
                            prefixIcon: Container(
                              width: 150,
                              height: 34,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '경력',
                                style: textThemeKo.labelLarge!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

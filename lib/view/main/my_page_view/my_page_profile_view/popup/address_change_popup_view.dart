import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';

import 'package:remedi_kopo/remedi_kopo.dart';

//로그인 뷰에서 사용될 Get X controller.
class AddressChangePopupViewController extends GetxController {
  bool addressShow = false;
  bool addressDetailShow = false;
  bool postShow = false;

  var addressController = TextEditingController();
  var addressDetailController = TextEditingController();
  var postController = TextEditingController();

  void addressField(bool addressShow) {
    this.addressShow = addressShow;
    update();
  }

  void addressDetailField(bool addressDetailShow) {
    this.addressDetailShow = addressDetailShow;
    update();
  }

  void postField(bool postShow) {
    this.postShow = postShow;
    update();
  }

  String _selectedAddress = '';
  String _selectedAddressDetail = '';
  String _selectedPost = '';
}

class AddressChangePopupView extends GetView<AddressChangePopupViewController> {
  const AddressChangePopupView(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressChangePopupViewController());
    return GetBuilder<AddressChangePopupViewController>(builder: (controller) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: const Alignment(0.0, -0.75),
        shadowColor: colorScheme.shadow.withOpacity(0.1),
        content: Stack(
          children: [
            ///바탕 스타일
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  width: 662,
                  height: 740,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.onSurface.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1a000000),
                        offset: Offset(6, 6),
                        blurRadius: 6,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///popup 스타일
            Container(
              width: 662,
              height: 740,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.close,
                            size: 50,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 30),
                  PopupText(text: '주소검색'),
                  const SizedBox(height: 34),

                  ///우편번호찾기
                  Row(
                    children: [
                      const SizedBox(width: 50),
                      MembershipPopupTextFormField(
                        width: 342,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.postField(true);
                          } else {
                            controller.postField(false);
                          }
                        },
                        controller: controller.postController,
                        hintText: '우편번호',
                      ),
                      //우편번호 입력창
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          KopoModel model = await Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => RemediKopo()),
                          );
                          controller.postController.text = '${model.zonecode!}';
                          controller.addressController.text =
                          '${model.address!} ${model.buildingName!}';
                        },
                        child: Container(
                          width: 200,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorScheme.background,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '우편번호 찾기',
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xff949393),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  ///주소 첫번째 입력창
                  MembershipPopupTextFormField(
                    width: 562,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.addressField(true);
                      } else {
                        controller.addressField(false);
                      }
                    },
                    controller: controller.addressController,
                    hintText: '도로명주소',
                  ),
                  const SizedBox(height: 20),

                  ///주소 두번째 입력창
                  MembershipPopupTextFormField(
                    width: 562,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.addressDetailField(true);
                      } else {
                        controller.addressDetailField(false);
                      }
                    },
                    controller: controller.addressDetailController,
                    hintText: '상세주소',
                  ),
                  const SizedBox(height: 140),
                  GetBuilder<AddressChangePopupViewController>(builder: (controller) {
                    return ButtonWithRollover(
                      onTap: () {
                        Get.back();
                      },
                      backgroundColor: controller.postShow &&
                          controller.addressShow &&
                          controller.addressDetailShow
                          ? colorScheme.shadow
                          : colorScheme.background,
                      child: Center(
                        child: Text(
                          '저장하기',
                          style: textThemeKo.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: controller.postShow &&
                                controller.addressShow &&
                                controller.addressDetailShow
                                ? colorScheme.background
                                : colorScheme.surfaceVariant,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

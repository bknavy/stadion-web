import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/home_view/main_home_view.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';
import 'package:stadion_project/view/main/mom_level_view/main_mom_level_view.dart';
import 'package:stadion_project/view/main/momster_view/main_momster_view.dart';
import 'package:stadion_project/view/main/my_page_view/my_page_profile_view/my_page_profile_view.dart';
import 'package:stadion_project/view/main/numbers_view/main_numbers_view.dart';
import 'package:stadion_project/view/main/wod_view/main_wod_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class ApplicationMembershipWithdrawalViewController extends GetxController {}

class ApplicationMembershipWithdrawalView
    extends GetView<ApplicationMembershipWithdrawalViewController> {
  const ApplicationMembershipWithdrawalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ApplicationMembershipWithdrawalViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'MY STADION',
          isEnglishTitle: true,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.off(const MyPageProfileView());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 94),
        child: Column(
          children: [
            const SizedBox(height: 55),
            SizedBox(
              width: 562,
              child: HeadlineLargeText(
                text: '회원 탈퇴를 신청하시기 전에\n안내 사항을 확인해 주세요.',
                fontWeight: FontWeight.w300,
                letterSpacing: -2.4,
              ),
            ),
            const SizedBox(height: 86),
            Row(
              children: [
                Icon(
                  Icons.check,
                  size: 28,
                  color: colorScheme.primary,
                ),
                LabelLargeText(
                  text: ' 아이디',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.4,
                ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 562,
              child: LabelLargeText(
                text: '사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가\n불가하오니 신중하게 선택하시기 바랍니다.',
                fontWeight: FontWeight.w300,
                letterSpacing: -1.4,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Icon(
                  Icons.check,
                  size: 28,
                  color: colorScheme.primary,
                ),
                LabelLargeText(
                  text: ' 회원정보 및 서비스 이용기록',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.4,
                ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 562,
              child: LabelLargeText(
                text: '탈퇴 후 회원정보 및 개인 서비스 이용기록은 모두\n삭제되며, 삭제된 데이터는 복구되지 않습니다.\n삭제되는 내용을 확인하시고 필요한 데이터는 미리\n백업을 해 주세요.',
                fontWeight: FontWeight.w300,
                letterSpacing: -1.4,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 562,
              child: LabelLargeText(
                text: '계정 및 프로필 정보 삭제\n박스이용권 삭제\n몸레벨 삭제\n게시물 삭제\n저장된 파일(이미지, 영상) 삭제',
                fontWeight: FontWeight.w500,
                letterSpacing: -1.4,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 562,
              child: LabelLargeText(
                text: '※ 박스이용권 잔여기간이 남은 경우 반드시 해당 박스\n    매니저와 협의를 한 후에 탈퇴를 진행해 주시기\n    바랍니다.',
                fontWeight: FontWeight.w300,
                letterSpacing: -1.4,
              ),
            ),
            const SizedBox(height: 120),
            ButtonWithRollover(
              onTap: () {
                //Get.to(const MainScreenView());
              },
              backgroundColor: colorScheme.onBackground,
              child: Center(
                child: Text(
                  '확인',
                  style: textThemeKo.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.surfaceVariant,
                  ),
                ),
              ),
            ),
          ],
        ),
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

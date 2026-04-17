import 'package:flipit/view/screen/auth/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/custom_animated_row.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';
import '../../custom/my_textfeild.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    viewInsets.bottom + 16,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: CommonImageView(imagePath: Assets.imagesBackArrowWhite,height: 48,)),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: ShapeDecoration(
                            color: kQuaternaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: "Verify Code",
                                size: 27,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(height: 2),
                              MyText(
                                text:
                                "Enter code to reset your password",
                                size: 15,
                                weight: FontWeight.w400,
                                color: kTextColor,
                              ),
                              const SizedBox(height: 15),
                              AnimatedRow(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Pinput(
                                    length: 6,
                                    // controller: otpController,
                                    defaultPinTheme: PinTheme(
                                      width: 40,
                                      height: 45,
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFonts.outfit,
                                        color: kBlueColor,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kQuaternaryColor, // Center color
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: kBorderColor, width: 1),
                                      ),
                                      //margin: EdgeInsets.only(left: 8),
                                    ),
                                    focusedPinTheme: PinTheme(
                                      width: 40,
                                      height: 45,
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFonts.outfit,
                                        color: kBlueColor,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0x190DACE8),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: kBlueColor, width: 1),
                                      ),
                                      // margin: EdgeInsets.only(left: 8),
                                    ),
                                    submittedPinTheme: PinTheme(
                                      width: 40,
                                      height: 45,
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppFonts.outfit,
                                        color: kBlueColor,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0x190DACE8),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: kBlueColor, width: 1),
                                      ),
                                      // margin: EdgeInsets.only(left: 8),
                                    ),
                                    onCompleted: (pin) {},

                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),

                              MyButton(
                                onTap: () {
                                  showCodeVerifiedSnackbar();
                                  ///Get.to(()=>ResetPasswordScreen());
                                },
                                buttonText: "Verify Code",
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



void showCodeVerifiedSnackbar() {
  Get.rawSnackbar(
    isDismissible: false,
    backgroundColor: Colors.transparent,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(16),
    padding: EdgeInsets.zero,
    duration: const Duration(seconds: 3),
    messageText: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
             CommonImageView(imagePath: Assets.imagesCv,height: 55,),
              const SizedBox(width: 12),
               Expanded(
                child: MyText(
                  text: "Code Verified!",
                  size: 27,
                  weight: FontWeight.w600,

                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          MyText(
            text:  "Entered code was verified. Please change your password "
                "to protect your account from unwanted access",
            size: 15,
            weight: FontWeight.w500,
            color: kTextColor,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFE2E2E2),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF9A9A9A),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>ResetPasswordScreen());
                    // navigate to change password screen
                  },
                  child: Container(
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF11C5E8),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
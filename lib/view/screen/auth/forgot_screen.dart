import 'package:flipit/view/screen/auth/verify_email_screen.dart';
import 'package:flipit/view/screen/auth/verify_phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';

enum RecoveryMethod { email, phone }

class ForgotController extends GetxController {
  Rx<RecoveryMethod> selectedMethod = RecoveryMethod.email.obs;

  void selectMethod(RecoveryMethod method) {
    selectedMethod.value = method;
  }
}

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  final ForgotController controller = Get.put(ForgotController());

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
                          child: Obx(
                                () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Forgot Password",
                                  size: 27,
                                  weight: FontWeight.w600,
                                ),
                                const SizedBox(height: 6),
                                MyText(
                                  text:
                                  "How would you like to receive the code to recover your account?",
                                  size: 15,
                                  weight: FontWeight.w400,
                                  color: kTextColor,
                                ),
                                const SizedBox(height: 18),

                                RecoveryOptionTile(
                                  icon: Assets.svgEmail,
                                  title: "Send code to email",
                                  isSelected:
                                  controller.selectedMethod.value ==
                                      RecoveryMethod.email,
                                  onTap: () => controller.selectMethod(
                                    RecoveryMethod.email,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                RecoveryOptionTile(
                                  icon: Assets.svgPhoneNumber,
                                  title: "Send code to phone number",
                                  isSelected:
                                  controller.selectedMethod.value ==
                                      RecoveryMethod.phone,
                                  onTap: () => controller.selectMethod(
                                    RecoveryMethod.phone,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                MyButton(
                                  onTap: () {
                                    final method =
                                        controller.selectedMethod.value;

                                    if (method == RecoveryMethod.email) {
                                      Get.to(()=>VerifyEmailScreen());
                                    } else {
                                      Get.to(()=>VerifyPhoneNumberScreen());
                                    }
                                  },
                                  buttonText: "Send Code",
                                ),
                              ],
                            ),
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

class RecoveryOptionTile extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const RecoveryOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? kBlueColor : const Color(0xFFD9D9D9),
              width: 1.4,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            CommonImageView(svgPath: icon,),
            const SizedBox(width: 14),
            Expanded(
              child: MyText(
                text: title,
                size: 15,
                weight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
           CommonImageView(svgPath: Assets.svgForward,)
          ],
        ),
      ),
    );
  }
}
import 'package:flipit/view/screen/auth/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';
import '../../custom/my_textfeild.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
                                text: "Verify Email",
                                size: 27,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(height: 2),
                              MyText(
                                text:
                                "Enter your email to send code for verification",
                                size: 15,
                                weight: FontWeight.w400,
                                color: kTextColor,
                              ),
                              const SizedBox(height: 15),

                              MyTextField(
                                label: "Email",
                                hint: "example@email.com",
                              ),

                              MyButton(
                                onTap: () {
                                  Get.to(()=>VerifyCodeScreen());
                                },
                                buttonText: "Verify Email",
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
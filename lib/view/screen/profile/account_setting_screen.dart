import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_button.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_text_widget.dart';



class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Account Settings",
      ),
      body: Column(
        children: [

          SizedBox(height: 30,),
          CommonImageView(
            imagePath: Assets.imagesPpf,
            height: 80,
          ),
          SizedBox(height: 10,),
          MyText(
            text: "Change Photo",
            size: 16,
            weight: FontWeight.w600,
            color: kBlueColor,
            decorationColor: kBlueColor,
            decoration: TextDecoration.underline,
          ),
          SizedBox(height: 20,),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  MyTextField(
                    label: "Username",
                    hint: "jhon Doe",
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Email",
                        size: 17,
                        weight: FontWeight.w600 ,
                      ),
                      MyText(
                        text: "example@email.com",
                        size: 17,
                        weight: FontWeight.w500 ,
                        color: kText2Color,
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(thickness: 0.5,),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Password",
                        size: 17,
                        weight: FontWeight.w600 ,
                      ),
                      MyText(
                        text: "Change Password",
                        size: 17,
                        weight: FontWeight.w500 ,
                        color: kText2Color,
                        decorationColor: kText2Color,
                        decoration: TextDecoration.underline,
                      ),
                    ],
                  ),
                  Spacer(),
                  MyButton(onTap: (){}, buttonText: "Save")
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

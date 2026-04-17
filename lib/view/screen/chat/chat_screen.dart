import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/screen/chat/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_textfeild.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: "Messages",
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                prefix: Padding(
                  padding: const EdgeInsets.all(12),
                  child: CommonImageView(svgPath: Assets.svgSearchorder,),
                ),
                hint: "Search......",
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    spacing: 5,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(()=>MessageScreen());
                        },
                        child: Row(
                          spacing: 10,
                          children: [
                            CommonImageView(imagePath: Assets.imagesPpf1,height: 48,radius: 8,),
                            Expanded(
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "John Doe",
                                    size: 15,
                                    weight: FontWeight.w600,
                                  ),
                                  MyText(
                                    text: "Hello there!",
                                    size: 12,
                                    weight: FontWeight.w500,
                                    color: kTextColor,
                                  ),

                                ],
                              ),
                            ),
                            Column(
                              spacing: 3,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyText(
                                  text: "12:00 PM",
                                  size: 10,
                                  weight: FontWeight.w500,
                                  color: kText2Color,
                                ),
                                if(index <= 1)
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: ShapeDecoration(
                                      color: kBlueColor,
                                      shape: CircleBorder()
                                  ),
                                  child: MyText(
                                    text: "1",
                                    size: 10,
                                    weight: FontWeight.w400,
                                    color: kQuaternaryColor,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 0.5,)
                    ],
                  ),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}

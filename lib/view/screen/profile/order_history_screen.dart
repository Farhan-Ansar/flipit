import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flipit/view/screen/profile/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';



class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order History",
        actions: [
          CommonImageView(imagePath: Assets.imagesFilter,height: 40,),
          SizedBox(width: 20,)
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        width: double.infinity,
        padding: AppSizes.DEFAULT,
        decoration: ShapeDecoration(
          color: kQuaternaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: MyTextField(
                      prefix: Padding(
                        padding: const EdgeInsets.all(12),
                        child: CommonImageView(svgPath: Assets.svgSearchorder,),
                      ),
                      hint: "Search",
                      marginBottom: 0,
                    ),
                  ),
                  CommonImageView(svgPath: Assets.svgSort,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 6),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          ),
                          child: CommonImageView(svgPath: Assets.svgRowViewFilled,),
                        ),CommonImageView(svgPath: Assets.svgCardViewFilled,),
                      ],
                    ),
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>OrdersScreen());
                    },
                    child: Row(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesShirt2,height: 70,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 2, left: 2, right: 7, bottom: 2),
                                decoration: ShapeDecoration(
                                  color: Colors.black.withValues(alpha: 0.03),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CommonImageView(imagePath: Assets.imagesPpf,height: 18,),
                                    MyText(
                                      text: "John Doe",
                                      size: 10,
                                      weight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ),
                              MyText(
                                text: "Hotel T-shirt",
                                size: 12,
                                weight: FontWeight.w600,
                                color: kBlackColor,
                              ),
                              MyText(
                                text: "M",
                                size: 10,
                                weight: FontWeight.w400,
                                color: kText2Color,
                              )
                            ],
                          ),
                        ),
                        MyText(
                          text: "\$10.00",
                          size: 15,
                          weight: FontWeight.w600,
                          color: kBlueColor,
                        )

                      ],
                    ),
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

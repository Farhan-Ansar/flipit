import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';



class SearchCardViewScreen extends StatelessWidget {
  const SearchCardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        actions: [
          SizedBox(width: 20,),
          CommonImageView(imagePath: Assets.imagesBackArrow,height: 48,),
          SizedBox(width: 10,),
          Expanded(
            child: MyTextField2(
              height: 50,
              prefix: Padding(
                padding: const EdgeInsets.all(12),
                child: CommonImageView(svgPath: Assets.svgSearch,),
              ),
              marginBottom: 0,
            ),
          ),
          SizedBox(width: 10,),
          CommonImageView(imagePath: Assets.imagesFilter2,height: 48,),
          SizedBox(width: 20,),
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
          physics: BouncingScrollPhysics(),
          child: Column(
            //spacing: 10,
            children: [
              Row(
                spacing: 10,
                children: [
                 MyText(
                   text: "Search Results",
                   size: 22,
                   weight: FontWeight.w600,
                 ),
                  Spacer(),
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
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0x0C00C4E4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    MyText(
                      text: "150+ results for Hotel T-shirt found",
                      size: 12,
                      weight: FontWeight.w600,
                      color: kBlueColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.89,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CommonImageView(imagePath: Assets.imagesShirt4,height: 100,radius: 10,),
                          Positioned(
                            top:15,
                            right:15,
                            child: CommonImageView(
                              imagePath: Assets.imagesLike123,
                              height: 32,
                          ),
                          ),
                        ],
                      ),
                      MyText(
                        text: "Hotel T-shirt",
                        size: 12,
                        weight: FontWeight.w600,
                      ),
                      MyText(
                        text: "\$15.00",
                        size: 12,
                        weight: FontWeight.w600,
                        color: kText2Color,
                      ),
                      Row(
                        children: [
                          MyText(
                            text: "\$10.00",
                            size: 15,
                            weight: FontWeight.w600,
                            color: kBlueColor,
                          ),
                          MyText(
                            text: " incl.",
                            size: 15,
                            weight: FontWeight.w600,
                            color: kBlueColor,
                          ),
                          CommonImageView(svgPath: Assets.svgProtectedFilled,),
                          Spacer(),
                          CommonImageView(imagePath: Assets.imagesCartBlue,height: 32,)
                        ],
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

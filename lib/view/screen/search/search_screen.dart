import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_textfeild.dart';



class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});


  final List<String> tags = [
    "T-shirts",
    "Denim",
    "Canon aiii7",
    "Hollister Shirts",
    "Nike Mercurial",
    "Adidas Campus",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSizes.VERTICAL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextField2(
                        hint: "Search......",
                        marginBottom: 0,
                        prefix: Padding(
                          padding: const EdgeInsets.all(10),
                          child: CommonImageView(svgPath: Assets.svgSearch),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CommonImageView(
                      imagePath: Assets.imagesSearch,
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(thickness: 0.5,),
              SizedBox(height: 20),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyText(
                  text: "Trending Searches",
                  size: 22,
                  weight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: ShapeDecoration(
                        color: kQuaternaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: MyText(
                        text: tag,
                        size: 12,
                        weight: FontWeight.w500,
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Divider(thickness: 0.5,),
              SizedBox(height: 20),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyText(
                  text: "Liked Brands",
                  size: 22,
                  weight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesNike,height: 90,),
                        MyText(
                          text: "Nike",
                          size: 15,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesAdidas,height: 90,),
                        MyText(
                          text: "Adidas",
                          size: 15,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesFila,height: 90,),
                        MyText(
                          text: "Fila",
                          size: 15,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),

                  ],
                )
              ),
              SizedBox(height: 10),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesOlympus,height: 90,),
                        MyText(
                          text: "Olympus",
                          size: 15,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesConverse,height: 90,),
                        MyText(
                          text: "Converse",
                          size: 15,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        CommonImageView(imagePath: Assets.imagesTimberland,height: 90,),
                        MyText(
                          text: "Timberland",
                          size: 15,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),

                  ],
                )
              ),


            ],
          ),
        ),
      ),
    );
  }
}

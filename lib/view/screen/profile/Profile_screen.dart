import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: AppSizes.DEFAULT,
            decoration: ShapeDecoration(
              color: kQuaternaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  CommonImageView(
                    imagePath: Assets.imagesPpf,
                    height: 80,
                  ),
                  SizedBox(height: 10,),
                  MyText(
                    text: "Jhon Doe",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: ShapeDecoration(
                      color: const Color(0x1900C4E4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child:MyText(
                      text: "Jhon Doe",
                      size: 12,
                      weight: FontWeight.w400,
                      color: kBlueColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: kQuaternaryColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: kBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              CommonImageView(svgPath: Assets.svgOrders,),
                              MyText(
                                text: "Orders",
                                size: 15,
                                weight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 135,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: kQuaternaryColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            CommonImageView(svgPath: Assets.svgLikedProducts,),
                            MyText(
                              text: "Liked Products",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: kQuaternaryColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: kBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              CommonImageView(svgPath: Assets.svgWishlist,),
                              MyText(
                                text: "Wishlist",
                                size: 15,
                                weight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  MyText(text: "Seller Profile"),
                  Spacer(),
                  Switch(
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                    value: true, onChanged:(value) {

                  },),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: AppSizes.DEFAULT,
            decoration: ShapeDecoration(
              color: kQuaternaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "Account Settings",
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                    CommonImageView(svgPath: Assets.svgForward1,)
                  ],
                ),
                Divider(thickness: 0.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "Order History",
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                    CommonImageView(svgPath: Assets.svgForward1,)
                  ],
                ),
                Divider(thickness: 0.5,),
                Row(
                  spacing: 10,
                  children: [
                    MyText(
                      text: "Payment Methods",
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                    Spacer(),
                    CommonImageView(svgPath: Assets.svgMaster,),
                    CommonImageView(svgPath: Assets.svgForward1,)
                  ],
                ),
                Divider(thickness: 0.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "Log Out",
                      size: 15,
                      weight: FontWeight.w600,
                      color: Colors.pink,
                    ),

                    CommonImageView(svgPath: Assets.svgRedForward,)
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

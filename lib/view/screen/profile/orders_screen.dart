import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../generated/assets.dart';



class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Orders",
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
                itemCount: 5,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: kBorderColor
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
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
                        _buildTrackingTimeline(0),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: ShapeDecoration(
                            color: const Color(0x1100C4E4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: "Track Order",
                                size: 12,
                                weight: FontWeight.w600,
                                color: kBlueColor,
                              ),
                              CommonImageView(svgPath: Assets.svgBlueForward,)
                            ],
                          ),
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

Widget _buildTrackingTimeline(int currentStep) {
  final List<String> steps = [
    'Order\nConfirmed',
    'Order\nPlaced',
    'In Transit',
    'Reached\nDestination',
    'Delivered',
  ];

  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          final lineIndex = index ~/ 2;
          final isActive = lineIndex < currentStep;

          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              height: 1.5,
              color: isActive
                  ? kBlueColor.withValues(alpha: 0.35)
                  : const Color(0xFFD3D3D3),
            ),
          );
        }

        final stepIndex = index ~/ 2;
        final isActive = stepIndex <= currentStep;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: kQuaternaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive ? kBlueColor : const Color(0xFF9E9E9E),
                  width: 1.3,
                ),
              ),
              child: Center(
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isActive ? kBlueColor : const Color(0xFF9E9E9E),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: 55,
              child: Text(
                steps[stepIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.outfit,
                  color: const Color(0xFF6E6E6E),
                  height: 1.25,
                ),
              ),
            ),
          ],
        );
      }),
    ),
  );
}
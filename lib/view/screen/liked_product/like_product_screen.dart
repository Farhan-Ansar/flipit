import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/my_text_widget.dart';



class LikeProductScreen extends StatelessWidget {
  const LikeProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Liked Products",),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         spacing: 5,
                         children: [
                           CommonImageView(imagePath: Assets.imagesShirt2,height: 65,),
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               spacing: 3,
                               children: [
                                 MyText(
                                   text: "Hotel T-shirt",
                                   size: 12,
                                   weight: FontWeight.w600,
                                 ),
                                 MyText(
                                   text: "S-M-L-XL",
                                   size: 12,
                                   weight: FontWeight.w600,
                                   color: kTextColor,
                                 ),
                                 MyText(
                                   text: "\$15.00",
                                   size: 12,
                                   weight: FontWeight.w600,
                                   color: kText2Color,
                                 ),
                                 Row(
                                   spacing: 5,
                                   children: [
                                     CommonImageView(svgPath: Assets.svgCheck,),
                                     MyText(
                                       text: "\$10.00",
                                       size: 15,
                                       weight: FontWeight.w600,
                                       color: kBlueColor,
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           Row(spacing: 10,
                             children: [
                               Container(
                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.50),
                                 decoration: ShapeDecoration(
                                   color: const Color(0xFF00C4E4),
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                 ),
                                 child: Row(
                                   spacing: 10,
                                   children: [
                                     MyText(
                                       text: "Add to Cart",
                                       size: 12,
                                       weight: FontWeight.w600,
                                       color: kQuaternaryColor,
                                     ),
                                     CommonImageView(svgPath: Assets.svgCart,)
                                   ],
                                 ),
                               ),
                               CommonImageView(imagePath: Assets.imagesLikeFilled,height: 30,)
                             ],
                           )
                         ],
                       ),
                        SizedBox(height: 10,),
                        Divider(thickness: 0.5,)

                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

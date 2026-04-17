import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';



class FeedWithoutAdScreen extends StatelessWidget {
  const FeedWithoutAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          CommonImageView(imagePath: Assets.imagesPpf,height: 24,),
                          Expanded(
                            child: MyText(
                              text: "John Doe",
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.more_vert_outlined),
                        ],
                      ),
                      SizedBox(height: 10,),
                      CommonImageView(
                        imagePath: Assets.imagesShirt,

                      ),
                      SizedBox(height: 10,),
                      Row(
                        spacing: 10,
                        children: [
                          CommonImageView(imagePath:Assets.imagesLike,height: 32,),
                          CommonImageView(imagePath:Assets.imagesSave,height: 32,),
                          CommonImageView(imagePath:Assets.imagesCart,height: 32,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      MyText(
                        text: "Available in stores now",
                        size: 15,
                        weight: FontWeight.w400,
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

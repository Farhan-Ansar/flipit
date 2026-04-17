import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../custom/custom_appbar.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Categories",),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MyText(
                    text: "Categories",
                    size: 17,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(height: 10,),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      const spacing = 10.0;
                      final itemWidth = (constraints.maxWidth - (spacing * 3)) / 4;

                      final categories = [
                        {"image": Assets.imagesTshirt, "title": "T-Shirts"},
                        {"image": Assets.imagesHoodies, "title": "Hoodies"},
                        {"image": Assets.imagesJeans, "title": "Jeans"},
                        {"image": Assets.imagesJackets, "title": "Jackets"},
                        {"image": Assets.imagesWatches, "title": "Watches"},
                        {"image": Assets.imagesCamera, "title": "Cameras"},
                        {"image": Assets.imagesLaptops, "title": "Laptops"},
                        {"image": Assets.imagesMakeup, "title": "Makeup"},
                        {"image": Assets.imagesSneakers, "title": "Sneakers"},
                        {"image": Assets.imagesBooks, "title": "Books"},
                        {"image": Assets.imagesHoodies, "title": "Hoodies"},
                        {"image": Assets.imagesTshirt, "title": "T-Shirts"},
                        {"image": Assets.imagesHoodies, "title": "Hoodies"},
                        {"image": Assets.imagesJeans, "title": "Jeans"},
                        {"image": Assets.imagesJackets, "title": "Jackets"},
                        {"image": Assets.imagesWatches, "title": "Watches"},
                        {"image": Assets.imagesCamera, "title": "Cameras"},
                        {"image": Assets.imagesLaptops, "title": "Laptops"},
                        {"image": Assets.imagesMakeup, "title": "Makeup"},
                        {"image": Assets.imagesSneakers, "title": "Sneakers"},
                        {"image": Assets.imagesBooks, "title": "Books"},
                        {"image": Assets.imagesHoodies, "title": "Hoodies"},
                        {"image": Assets.imagesBooks, "title": "Books"},
                        {"image": Assets.imagesHoodies, "title": "Hoodies"},
                      ];

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: categories.map((item) {
                          return SizedBox(
                            width: itemWidth,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonImageView(
                                  imagePath: item["image"] as String,
                                  height: 80,
                                  width: 80,
                                ),
                                const SizedBox(height: 6),
                                MyText(
                                  text: item["title"] as String,
                                  size: 15,
                                  weight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

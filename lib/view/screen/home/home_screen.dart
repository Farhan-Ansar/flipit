import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(CategoryController());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          decoration: BoxDecoration(
                            color: kQuaternaryColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: kBorderColor,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesPpf,
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyText(
                                    text: "Jhon Doe",
                                    size: 12,
                                    weight: FontWeight.w500,
                                  ),
                                  MyText(
                                    text: "Buyer",
                                    size: 10,
                                    weight: FontWeight.w500,
                                    color: kBlueColor,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 22,
                                color: Color(0xFF3A3A3A),
                              ),
                            ],
                          ),
                        ),
                        CommonImageView(
                          imagePath: Assets.imagesCirCart,
                          height: 45,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextField2(
                            hint: "Search",
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
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        CommonImageView(imagePath: Assets.imagesDiscount),
                        Positioned(
                          left: 20,
                          bottom: 20,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFF383C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: MyText(
                              text: "Shop Now",
                              size: 12,
                              weight: FontWeight.w600,
                              color: kQuaternaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 35,
              child: Obx(() {
                final selectedIndex = controller.selectedIndex.value;

                return ListView.builder(
                  padding: AppSizes.HORIZONTAL,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16, ),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF12C7E8) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: MyText(
                            text: controller.categories[index],
                            size: 15,
                            weight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              })
            ),
            SizedBox(height: 20),
            Padding(
          padding: AppSizes.HORIZONTAL,
          child: Container(

            width: double.infinity,
            padding: AppSizes.VERTICAL,
            decoration: ShapeDecoration(
              color: kQuaternaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    MyText(
                      text: "Categories",
                      size: 17,
                      weight: FontWeight.w600,

                    ),
                    MyText(
                      text: "Show All",
                      size: 17,
                      weight: FontWeight.w600,
                      color: kTextColor,
                    ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    itemCount: categories.length,
                    padding: AppSizes.HORIZONTAL,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonImageView(
                              imagePath: category["image"] as String,
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 70,
                              child: MyText(
                                text: category["title"] as String,
                                size: 15,
                                weight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
            SizedBox(height: 20),
            Container(

              width: double.infinity,
              padding: AppSizes.VERTICAL,
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      MyText(
                        text: "Trending Products",
                        size: 17,
                        weight: FontWeight.w600,

                      ),
                      MyText(
                        text: "Show All",
                        size: 17,
                        weight: FontWeight.w600,
                        color: kTextColor,
                      ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                   SizedBox(
                     height: 170,
                     child: ListView.builder(
                       itemCount: 10,
                       shrinkWrap: true,
                       padding: AppSizes.HORIZONTAL,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context, index) {
                     return  Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CommonImageView(imagePath: Assets.imagesShirt3,height: 100,),
                           MyText(
                             text: "Hotel T-shirt",
                             size: 12,
                             weight: FontWeight.w600,
                           ),
                           SizedBox(height: 5,),
                           MyText(
                             text: "\$15.00",
                             size: 12,
                             weight: FontWeight.w600,
                             color: kTextColor,
                           ),
                           Row(
                             spacing: 3,
                             children: [
                               MyText(
                                 text: "\$10.00",
                                 size: 15,
                                 weight: FontWeight.w600,
                                 color: kBlueColor,
                               ),
                               MyText(
                                 text: "incl",
                                 size: 15,
                                 weight: FontWeight.w600,
                                 color: kBlueColor,
                               ),
                               SizedBox(width: 70,),
                               CommonImageView(imagePath: Assets.imagesCartBlue,height: 32,)
                             ],
                           ),
                         ],
                       ),
                     );
                                      },),
                   ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "Trending Products",
                          size: 17,
                          weight: FontWeight.w600,

                        ),
                        MyText(
                          text: "Show All",
                          size: 17,
                          weight: FontWeight.w600,
                          color: kTextColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: AppSizes.HORIZONTAL,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonImageView(imagePath: Assets.imagesShirt3,height: 100,),
                              MyText(
                                text: "Hotel T-shirt",
                                size: 12,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(height: 5,),
                              MyText(
                                text: "\$15.00",
                                size: 12,
                                weight: FontWeight.w600,
                                color: kTextColor,
                              ),
                              SizedBox(height: 5,),
                              Row(
                                spacing: 3,
                                children: [
                                  MyText(
                                    text: "\$10.00",
                                    size: 15,
                                    weight: FontWeight.w600,
                                    color: kBlueColor,
                                  ),
                                  MyText(
                                    text: "incl",
                                    size: 15,
                                    weight: FontWeight.w600,
                                    color: kBlueColor,
                                  ),
                                  SizedBox(width: 70,),
                                  CommonImageView(imagePath: Assets.imagesCartBlue,height: 32,)
                                ],
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "Top Rated Stores",
                          size: 17,
                          weight: FontWeight.w600,

                        ),
                        MyText(
                          text: "Show All",
                          size: 17,
                          weight: FontWeight.w600,
                          color: kTextColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppSizes.DEFAULT,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesNike,
                              height: 70,
                            ),
                            MyText(
                              text: "Nike",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesAdidas,
                              height: 70,
                            ),
                            MyText(
                              text: "Adidas",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesCanon,
                              height: 70,
                            ),
                            MyText(
                              text: "Canon",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesFila,
                              height: 70,
                            ),
                            MyText(
                              text: "Fila",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "Popular Stores",
                          size: 17,
                          weight: FontWeight.w600,

                        ),
                        MyText(
                          text: "Show All",
                          size: 17,
                          weight: FontWeight.w600,
                          color: kTextColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppSizes.DEFAULT,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesNike,
                              height: 70,
                            ),
                            MyText(
                              text: "Nike",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesAdidas,
                              height: 70,
                            ),
                            MyText(
                              text: "Adidas",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesCanon,
                              height: 70,
                            ),
                            MyText(
                              text: "Canon",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                        Column(
                          spacing: 6,
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesFila,
                              height: 70,
                            ),
                            MyText(
                              text: "Fila",
                              size: 15,
                              weight: FontWeight.w600,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<String> categories = [
    "All",
    "Men",
    "Women",
    "Children",
    "Designer",
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';
import '../../custom/my_textfeild.dart';



class ProductViewScreen extends StatelessWidget {
   ProductViewScreen({super.key});

  final ProductViewController controller = Get.put(ProductViewController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        title: "Hotel T-shirt",
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Icon(Icons.favorite_border_rounded,size: 18,),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppSizes.DEFAULT,
                    child: CommonImageView(imagePath: Assets.imagesShirt5),
                  ),
                  SizedBox(
                    height: 82,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: AppSizes.HORIZONTAL,
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          final isSelected =
                              controller.selectedImageIndex.value == index;
                          return GestureDetector(
                            onTap: () {
                              controller.selectedImageIndex.value = index;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: isSelected
                                          ? kBlueColor
                                          : Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CommonImageView(
                                    imagePath: controller.images[index],
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: AppSizes.DEFAULT,
                    child: Column(
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            CommonImageView(imagePath: Assets.imagesNike,height: 48,),
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Hotel T-shirt",
                                  size: 17,
                                  weight: FontWeight.w600,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                  decoration: ShapeDecoration(
                                    color: const Color(0x1934C759),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: MyText(
                                    text: "9.5/10",
                                    size: 12,
                                    weight: FontWeight.w500,
                                    color: kGreenColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        MyText(
                          text:  'Lorem ipsum dolor sit amet consectetur. Pellentesque venenatis turpis in eu. '
                            'Feugiat euismod morbi rhoncus ridiculus. Velit magna sit nibh ac fringilla nullam sagittis condimentum',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kText2Color,
                        ),
                        SizedBox(height: 10,),
                        Obx(
                              () => Row(
                            children: List.generate(controller.sizes.length, (index) {
                              final bool isSelected = controller.selectedSizeIndex.value == index;

                              return Padding(
                                padding: EdgeInsets.only(right: index == controller.sizes.length - 1 ? 0 : 12),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.selectedSizeIndex.value = index;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: ShapeDecoration(
                                      color: isSelected ? const Color(0xFFD9F3F8) : kQuaternaryColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: isSelected ? const Color(0xFF00C4E4) : kBorderColor,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: MyText(
                                      text: controller.sizes[index],
                                      size: 15,
                                      weight: FontWeight.w600,
                                      color: isSelected ? const Color(0xFF00C4E4) : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Obx(
                              () => Row(
                            children: List.generate(controller.colorOptions.length, (index) {
                              final bool isSelected = controller.selectedColorIndex.value == index;

                              return Padding(
                                padding: EdgeInsets.only(right: index == controller.colorOptions.length - 1 ? 0 : 8),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.selectedColorIndex.value = index;
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: isSelected
                                          ? Border.all(
                                        color: const Color(0xFF00C4E4),
                                        width: 1.5,
                                      )
                                          : null,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.colorOptions[index],
                                        border: Border.all(
                                          color: controller.colorOptions[index] == Colors.white
                                              ? Colors.grey.shade300
                                              : Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            MyText(
                              text: "Quantity",
                              size: 15,
                              weight: FontWeight.w600,
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical:4),
                              decoration: ShapeDecoration(
                                color: kQuaternaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: kBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                spacing: 3,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: controller.decrement,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: CommonImageView(svgPath: Assets.svgDelete),
                                    ),
                                  ),
                                  const SizedBox(width: 5),

                                  Obx(
                                        () => MyText(
                                      text: controller.quantity.value.toString(),
                                      size: 15,
                                      weight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(width: 5),

                                  GestureDetector(
                                    onTap: controller.increment,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: CommonImageView(svgPath: Assets.svgAdd),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            MyText(
                              text: "\$5.99",
                              size: 22,
                              weight: FontWeight.w600,
                              color: kBlueColor,
                            ),
                            SizedBox(width: 4,),
                            MyText(
                              text: "\$8.99",
                              size: 15,
                              weight: FontWeight.w400,
                              color: kText2Color,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          spacing: 5,
                          children: [
                            Expanded(child: MyButton(onTap: (){}, buttonText: "Buy Now")),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: kQuaternaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: kBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: CommonImageView(svgPath: Assets.svgWishlist1),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: kQuaternaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: kBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: CommonImageView(svgPath: Assets.svgCart1),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: MyBorderButton(
                                radius: 16,
                                borderColor: kBorderColor,
                                bgColor: Color(0xFFFBFBFB),
                                textColor: kText2Color,
                                buttonText: "Make an Offer",
                                onTap: () {},
                              ),
                            ),
                            Expanded(
                              child: MyBorderButton(
                                radius: 16,
                                borderColor: kBorderColor,
                                bgColor: Color(0xFFFBFBFB),
                                textColor: kText2Color,
                                buttonText: "Message Seller",
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Customer Reviews",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 16,),
                  ListView.builder(
                    itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: ShapeDecoration(
                              color: kQuaternaryColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: kBorderColor,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    CommonImageView(imagePath: Assets.imagesPpf,height: 32,),
                                    Expanded(
                                      child: Column(
                                        spacing: 3,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: "John Doe",
                                            size: 15,
                                            weight: FontWeight.w600,
                                          ),
                                          MyText(
                                            text: "2 Feb, 2026",
                                            size: 10,
                                            weight: FontWeight.w400,
                                            color: kText2Color,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                            (index) => const Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFF4C000),
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                MyText(
                                  text:  'Lorem ipsum dolor sit amet consectetur. Pellentesque venenatis turpis in eu.'
                                      ' Feugiat euismod morbi rhoncus ridiculus. Velit magna sit nibh ac fringilla nullam '
                                      'sagittis condimentum',
                                  size: 15,
                                  weight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: CommonImageView(
                                        imagePath: Assets.imagesShirt5,
                                        height: 100,
                                        radius: 20,
                                      ),
                                    ),
                                    Expanded(
                                      child: CommonImageView(
                                        imagePath: Assets.imagesShirt5,
                                        height: 100,
                                        radius: 20,
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      },
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      MyText(
                        text: "Show More(25)",
                        size: 17,
                        weight: FontWeight.w600,
                        color: kText2Color,
                      ),
                      CommonImageView(svgPath: Assets.svgDown,),
                    ],
                  )

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Similar Products",
                        size: 17,
                        weight: FontWeight.w600,
                      ),
                      MyText(
                        text: "Show All",
                        size: 15,
                        weight: FontWeight.w600,
                        color: kTextColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
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
                                top:10,
                                right:10,
                                child: CommonImageView(
                                  imagePath: Assets.imagesLike123,
                                  height: 25,
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
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Similar Stores",
                        size: 17,
                        weight: FontWeight.w600,
                      ),
                      MyText(
                        text: "Show All",
                        size: 15,
                        weight: FontWeight.w600,
                        color: kTextColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
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


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ProductViewController extends GetxController {
  RxInt selectedImageIndex = 0.obs;

  final List<String> images = [
    Assets.imagesHotel,
    Assets.imagesHotel,
    Assets.imagesHotel,
    Assets.imagesHotel,
    Assets.imagesHotel,
    Assets.imagesHotel,
    Assets.imagesHotel,
    Assets.imagesHotel,
  ];

  RxInt quantity = 1.obs;

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  final RxInt selectedSizeIndex = 1.obs;
  final List<String> sizes = ["S", "M", "L", "XL"];



  final RxInt selectedColorIndex = 0.obs;

  final List<Color> colorOptions = [
    Colors.white,
    const Color(0xFF232323),
    const Color(0xFF2A0B86),
    const Color(0xFFF2DC9B),
  ];


}
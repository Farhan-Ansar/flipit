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



class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: AppSizes.DEFAULT,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: "Select Your Bundle",
              size: 17,
              weight: FontWeight.w600,
            ),
            SizedBox(height: 10,),
            MyText(
              text: "Select all the products and price for the bundle offer",
              size: 12,
              weight: FontWeight.w400,
              color: kTextColor,
            ),
            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          CommonImageView(imagePath: Assets.imagesShirt2,height: 70,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      text: "Hotel T-shirt",
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: kBlackColor,
                                    ),
                                    MyText(
                                      text: "\$15.00",
                                      size: 10,
                                      weight: FontWeight.w400,
                                      color: kTextColor,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: "S-M-L-XL",
                                      size: 10,
                                      weight: FontWeight.w400,
                                      color: kTextColor,
                                    ),
                                    Spacer(),
                                    MyText(
                                      text: "\$10.00",
                                      size: 15,
                                      weight: FontWeight.w600,
                                      color: kBlueColor,
                                    ),
                                    CommonImageView(svgPath: Assets.svgCheck,),
                                  ],
                                ),
                                Row(
                                  spacing: 5,
                                  children: [
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
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.50),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF00C4E4),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: Row(
                                        spacing: 5,
                                        children: [
                                          MyText(
                                            text: "Add to Wishlist",
                                            size: 10,
                                            weight: FontWeight.w600,
                                            color: kQuaternaryColor,
                                          ),
                                          CommonImageView(svgPath: Assets.svgWishlist2,)
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: 8,),
                      Divider(thickness: 0.5,),
                    ],
                  ),
                );
              },),
            SizedBox(height: 20,),

            MyButton(onTap: (){}, buttonText: "Create Offer"),
          ],
        ),
      ),
    );
  }
}




class CartController extends GetxController {
  RxInt quantity = 1.obs;

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
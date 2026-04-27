import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/checkbox_widget.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';
import '../../custom/my_textfeild.dart';



class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  final CartController controller = Get.put(CartController());
   final RxBool rememberMe = false.obs;
   final RxBool showTotalDetails = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
      ),
      bottomNavigationBar: Container(
        padding: AppSizes.DEFAULT,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Total Amount",
                        size: 12,
                        weight: FontWeight.w600,
                      ),
                      MyText(
                        text: "\$25.55",
                        size: 22,
                        weight: FontWeight.w600,
                        color: kBlueColor ,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17.50),
                    decoration: ShapeDecoration(
                      color: kBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: MyText(
                      text: "Checkout",
                      size: 15,
                      weight: FontWeight.w600,
                      color: kQuaternaryColor,
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFFDEDEDE),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Obx(() {
                          return Row(
                            children: [
                              CheckBoxWidget(
                                isChecked: rememberMe.value,
                                onChanged: (value) {
                                  rememberMe.value = value ?? false;
                                },
                              ),
                            ],
                          );
                        }),
                        MyText(
                          text: "Products",
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                        Spacer(),
                        MyText(
                          text: "2 Products Selected",
                          size: 12,
                          weight: FontWeight.w600,
                          color: kBlueColor,
                        ),
                      ],
                    ),
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
                                Obx(() {
                                  return Row(
                                    children: [
                                      CheckBoxWidget(
                                        isChecked: rememberMe.value,
                                        onChanged: (value) {
                                          rememberMe.value = value ?? false;
                                        },
                                      ),
                                    ],
                                  );
                                }),
                                CommonImageView(imagePath: Assets.imagesShirt2,height: 60,),
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
                                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical:2),
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
                                                    padding: const EdgeInsets.all(2),
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
                                          ),
                                          CommonImageView(imagePath: Assets.imagesHeart2,height: 33,)

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

                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: AppSizes.DEFAULT,
              child: Row(
                children: [
                  MyText(
                    text: "Total",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                  Spacer(),
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        showTotalDetails.value = !showTotalDetails.value;
                      },
                      child: Icon(
                        showTotalDetails.value
                            ? Icons.arrow_drop_up_sharp
                            : Icons.arrow_drop_down_sharp,
                      ),
                    );
                  }),
                ],
              ),
            ),

            Obx((){
              if (!showTotalDetails.value) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: AppSizes.HORIZONTAL,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            spacing: 10,
                            children: [
                              MyText(
                                text: "x 1",
                                size: 15,
                                weight: FontWeight.w600,
                                color: kTextColor,
                              ),
                              CommonImageView(imagePath: Assets.imagesShirt2,height: 35,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: "Hotel T-Shirt",
                                      size: 12,
                                      weight: FontWeight.w600,
                                    ),
                                    MyText(
                                      text: "M",
                                      size: 10,
                                      weight: FontWeight.w600,
                                      color: kTextColor,
                                    ),

                                  ],
                                ),
                              ),
                              MyText(
                                text: "\$5.99",
                                size: 15,
                                weight: FontWeight.w600,
                                color: kBlueColor,
                              ),
                            ],
                          ),
                        );
                      },),
                    Divider(thickness: 0.5,),
                    SizedBox(height: 10,),
                    buildPriceRow(
                      title: "Subtotal",
                      price: "\$11.00",
                    ),
                    buildPriceRow(
                      title: "Discount",
                      price: "0%",
                    ),
                    buildPriceRow(
                      title: "Voucher/Coupon",
                      price: "\$00.00",
                    ),
                    buildPriceRow(
                      title: "Delivery Charges",
                      price: "\$11.00",
                    ),
                    buildPriceRow(
                      title: "VAT",
                      price: "\$11.00",
                    ),
                  ],
                ),
              );
            }),

            ///

          ],
        ),
      ),
    );
  }
   Widget buildPriceRow({
     required String title,
     required String price,
     Color? priceColor,
   }) {
     return Padding(
       padding: const EdgeInsets.only(bottom: 10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           MyText(
             text: title,
             size: 15,
             weight: FontWeight.w600,
           ),
           MyText(
             text: price,
             size: 15,
             weight: FontWeight.w600,
             color: priceColor ?? kTextColor,
           ),
         ],
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
import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_button.dart';
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
import '../../custom/common_image_view_widget.dart';



class BundleOfferScreen extends StatelessWidget {
   BundleOfferScreen({super.key});

  final CartBundleController controller = Get.put(CartBundleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Bundle Offer",
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
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
                                  MyText(
                                    text: "Hotel T-shirt",
                                    size: 12,
                                    weight: FontWeight.w600,
                                    color: kBlackColor,
                                  ),
                                  MyText(
                                    text: "S-M-L-XL",
                                    size: 10,
                                    weight: FontWeight.w400,
                                    color: kTextColor,
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
                                      MyText(
                                        text: "\$15.00",
                                        size: 10,
                                        weight: FontWeight.w400,
                                        color: kTextColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                            )

                          ],
                        ),
                        SizedBox(height: 8,),
                        Divider(thickness: 0.5,),
                      ],
                    ),
                  );
                },),
            ),
            SizedBox(height: 20,),
            MyTextField(hint: "Offer Price",),
            SizedBox(height: 20,),
            MyButton(onTap: (){}, buttonText: "Create Offer"),
          ],
        ),
      ),
    );
  }
}




class CartBundleController extends GetxController {
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
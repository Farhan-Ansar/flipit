import 'package:flipit/view/custom/my_button.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
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
import '../../custom/my_textfeild.dart';

class MakeOfferScreen extends StatelessWidget {
  MakeOfferScreen({super.key});
  final ProductController controller = Get.put(ProductController());
  final RxInt selectedMethod = 0.obs;

  final List<Map<String, dynamic>> paymentMethods = [
    {"title": "10 %", "subtitle": "\$2.55"},
    {"title": "30 %", "subtitle": "\$2.86"},
    {"title": "50 %", "subtitle": "\$2.45"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true, title: "Make Offer"),
      body: SingleChildScrollView(
        child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Hotel T-shirt",
                      size: 22,
                      weight: FontWeight.w600,
                    ),
                    MyText(
                      text:
                          "Lorem ipsum dolor sit amet consectetur. Pellentesque venenatis turpis in eu. Feugiat euismod morbi rhoncus ridiculus. Velit magna sit nibh ac fringilla nullam sagittis condimentum",
                      size: 12,
                      weight: FontWeight.w400,
                      color: kText2Color,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFBFBFB),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: kBorderColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Offer Your Price",
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => Column(
                              children: List.generate(paymentMethods.length, (
                                index,
                              ) {
                                final item = paymentMethods[index];

                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () => selectedMethod.value = index,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 2,
                                        ),
                                        child: Row(
                                          children: [
                                            Radio<int>(
                                              value: index,
                                              groupValue: selectedMethod.value,
                                              onChanged: (value) {
                                                selectedMethod.value = value!;
                                              },
                                              activeColor: kBlueColor,
                                              fillColor:
                                                  WidgetStateProperty.resolveWith<
                                                    Color?
                                                  >((states) {
                                                    if (states.contains(
                                                      WidgetState.selected,
                                                    )) {
                                                      return kBlueColor;
                                                    }
                                                    return Colors.grey.shade400;
                                                  }),
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              visualDensity:
                                                  VisualDensity.compact,
                                            ),
                                            const SizedBox(width: 8),

                                            MyText(
                                              text: item["title"],
                                              size: 15,
                                              weight: FontWeight.w600,
                                            ),
                                            Spacer(),
                                            MyText(
                                              text: item["subtitle"],
                                              size: 15,
                                              weight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: 10),
                          MyTextField(hint: "Custom Offer", marginBottom: 0),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: MyBorderButton(
                            radius: 16,
                            borderColor: kBorderColor,
                            bgColor: Color(0xFFFBFBFB),
                            textColor: kText2Color,
                            buttonText: "Make a bundle Offer",
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: MyButton(
                            onTap: () {},
                            buttonText: "Request Offer",
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
      ),
    );
  }
}

class ProductController extends GetxController {
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
}

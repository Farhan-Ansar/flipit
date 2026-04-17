import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_text_widget.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final RxInt selectedMethod = 0.obs;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      "title": "Debit/Credit Card",
      "subtitle": "*255",
      "icons": [Assets.svgVisa, Assets.svgMaster],
    },
    {
      "title": "EasyPaisa",
      "subtitle": "",
      "icons": [Assets.svgEasypaisa],
    },
    {
      "title": "Jazzcash",
      "subtitle": "",
      "icons": [Assets.svgMst],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Account Settings",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
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
              const SizedBox(height: 10),
              MyText(
                text: "Select Default Payment Method",
                size: 17,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 14),

              Expanded(
                child: Obx(
                      () => Column(
                    children: List.generate(paymentMethods.length, (index) {
                      final item = paymentMethods[index];
                      final List icons = item["icons"];

                      return Column(
                        children: [
                          InkWell(
                            onTap: () => selectedMethod.value = index,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: index,
                                    groupValue: selectedMethod.value,
                                    onChanged: (value) {
                                      selectedMethod.value = value!;
                                    },
                                    activeColor: kBlueColor,
                                    fillColor: WidgetStateProperty.resolveWith<Color?>(
                                          (states) {
                                        if (states.contains(WidgetState.selected)) {
                                          return kBlueColor;
                                        }
                                        return Colors.grey.shade400;
                                      },
                                    ),
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  const SizedBox(width: 8),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: item["title"],
                                          size: 15,
                                          weight: FontWeight.w600,
                                        ),
                                        if ((item["subtitle"] as String)
                                            .isNotEmpty) ...[
                                          const SizedBox(height: 3),
                                          MyText(
                                            text: item["subtitle"],
                                            size: 12,
                                            weight: FontWeight.w400,
                                            color: kText2Color,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ...List.generate(
                                        icons.length,
                                            (iconIndex) => Padding(
                                          padding: EdgeInsets.only(
                                            right: iconIndex == icons.length - 1
                                                ? 0
                                                : 10,
                                          ),
                                          child: Container(
                                            height: 36,
                                            width: 48,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            child: CommonImageView(
                                              svgPath: icons[iconIndex],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      CommonImageView(
                                        svgPath: Assets.svgForward1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          if (index != paymentMethods.length - 1)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey.shade300,
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              MyButton(
                onTap: () {
                  debugPrint(
                    "Selected payment method index: ${selectedMethod.value}",
                  );
                },
                buttonText: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
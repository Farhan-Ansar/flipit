import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_sizes.dart';



class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Checkout",
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
                  MyText(
                    text: "Billing Delivery Details",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 15,),
                  MyTextField(
                    label: "Recipient Name",
                    hint: "Jhon Doe",
                  ),
                  MyTextField(
                    label: "Email",
                    hint: "JhonDoe@gmail.com",
                  ),


                ],
              ),
            ),
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
                  MyText(
                    text: "Shipping Address",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 15,),
                  MyTextField(
                    label: "Adress Line #1",
                    hint: "Adress Line #1",
                  ),
                  MyTextField(
                    label: "Adress Line #2",
                    hint: "Adress Line #1",
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

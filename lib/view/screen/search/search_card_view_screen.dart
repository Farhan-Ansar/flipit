import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';



class SearchCardViewScreen extends StatelessWidget {
  const SearchCardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        actions: [
          SizedBox(width: 20,),
          CommonImageView(imagePath: Assets.imagesBackArrow,height: 48,),
          SizedBox(width: 10,),
          Expanded(
            child: MyTextField2(
              height: 50,
              prefix: Padding(
                padding: const EdgeInsets.all(12),
                child: CommonImageView(svgPath: Assets.svgSearch,),
              ),
              marginBottom: 0,
            ),
          ),
          SizedBox(width: 10,),
          CommonImageView(imagePath: Assets.imagesFilter2,height: 48,),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

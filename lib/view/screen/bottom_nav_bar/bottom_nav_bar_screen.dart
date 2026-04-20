import 'package:flipit/view/screen/chat/chat_screen.dart';
import 'package:flipit/view/screen/chat/message_screen.dart';
import 'package:flipit/view/screen/feed/feed_without_ad_screen.dart';
import 'package:flipit/view/screen/profile/Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_text_widget.dart';
import '../home/home_screen.dart';
import '../search/search_card_view_screen.dart';
import '../search/search_screen.dart';


class BottomNavBarScreen extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

  BottomNavBarScreen({super.key});

  final List<Map<String, dynamic>> items = [
   {
      'selected': Assets.imagesHome,
      'unselected': Assets.imagesHome,
      'label': 'Home',
    },
    {
      'selected':  Assets.imagesFeed,
      'unselected': Assets.imagesFeed,
      'label': 'Feed',
    },
    {
      'selected': Assets.imagesSearchb,
      'unselected': Assets.imagesSearchb,
      'label': 'Search',
    },
    {
      'selected': Assets.imagesMessages,
      'unselected': Assets.imagesMessages,
      'label': 'Messages',
    },
    {
      'selected': Assets.imagesProfile,
      'unselected': Assets.imagesProfile,
      'label': 'Profile',
    },

  ];

  final List<Widget> screens = [

    SearchCardViewScreen(),
    FeedWithoutAdScreen(),
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: screens[currentIndex.value],
        bottomNavigationBar: Container(
          //height: 80,
          decoration: const BoxDecoration(
            color: kQuaternaryColor,
            border: Border(
              top: BorderSide(
                color: kBorderColor,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex.value,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kPrimaryColor,
            onTap: (index) {
              currentIndex.value = index;

            },
            items: List.generate(items.length, (index) {
              final double iconSize =  27;

              return BottomNavigationBarItem(
                label: '',
                activeIcon: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset( items[index]['selected'],
                      width: iconSize,
                      color: kBlueColor,
                    ),
                      MyText(
                        text: items[index]['label'],
                        size: 12,
                        weight: FontWeight.w600,
                        color: kBlueColor,
                        fontFamily: AppFonts.outfit,
                      ),
                  ],
                ),
                icon: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(items[index]['unselected'], width: iconSize),
                      MyText(
                        text: items[index]['label'],
                        size: 12,
                        weight: FontWeight.w600,
                        color: kTextColor,
                        fontFamily: AppFonts.outfit,
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

import 'package:flipit/view/screen/auth/create_account_screen.dart';
import 'package:flipit/view/screen/auth/forgot_screen.dart';
import 'package:flipit/view/screen/auth/login_screen.dart';
import 'package:flipit/view/screen/auth/reset_password_screen.dart';
import 'package:flipit/view/screen/auth/select_login_screen.dart';
import 'package:flipit/view/screen/auth/verify_code_screen.dart';
import 'package:flipit/view/screen/auth/verify_email_screen.dart';
import 'package:flipit/view/screen/auth/verify_phone_number_screen.dart';
import 'package:flipit/view/screen/chat/chat_screen.dart';
import 'package:flipit/view/screen/chat/message_screen.dart';
import 'package:flipit/view/screen/feed/feed_without_ad_screen.dart';
import 'package:flipit/view/screen/home/categories_screen.dart';
import 'package:flipit/view/screen/home/home_screen.dart';
import 'package:flipit/view/screen/liked_product/like_product_screen.dart';
import 'package:flipit/view/screen/offers/bundle_offer_screen.dart';
import 'package:flipit/view/screen/profile/Profile_screen.dart';
import 'package:flipit/view/screen/profile/account_setting_screen.dart';
import 'package:flipit/view/screen/profile/order_history_screen.dart';
import 'package:flipit/view/screen/profile/orders_screen.dart';
import 'package:flipit/view/screen/profile/payment_screen.dart';
import 'package:flipit/view/splash_service/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'config/constants/app_colors.dart';
import 'config/constants/app_fonts.dart';
import 'controller/select_role_controller/select_role_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await UserSimplePreferences.init();
  // ✅ Set bottom navigation bar color globally
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Optional
      statusBarIconBrightness: Brightness.dark, // Optional
      systemNavigationBarColor: Colors.black, // Bottom nav bar color
      systemNavigationBarIconBrightness: Brightness.light, // Icons color
    ),
  );

  Get.put(SelectRoleController());
  runApp(MyApp());
}

final String dummyImage2 = 'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
final String dummyImage1 = 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face';
final String dummyImage = 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "FlipiT",
      theme: ThemeData(
        fontFamily: AppFonts.satoshi,
        useMaterial3: true,
        scaffoldBackgroundColor: kBackGroundColor,
        appBarTheme: AppBarTheme(backgroundColor: kBackGroundColor),
      ),
      home: BundleOfferScreen(),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

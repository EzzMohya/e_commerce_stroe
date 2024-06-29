import 'package:e_commerce_app/features/auth/presentation/views/ForgetPassword/ResetPassword.dart';
import 'package:e_commerce_app/features/auth/presentation/views/ForgetPassword/SuccsessReset.dart';
import 'package:e_commerce_app/features/auth/presentation/views/ForgetPassword/VerifyCode.dart';
import 'package:e_commerce_app/features/auth/presentation/views/SignUp.dart';
import 'package:e_commerce_app/features/auth/presentation/views/SuccessSignUp.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login.dart';
import 'package:e_commerce_app/features/auth/presentation/views/verifycodeSignUp.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout.dart';
import 'package:e_commerce_app/features/favorites/presentation/views/myFavorite.dart';
import 'package:e_commerce_app/features/home/presentation/views/HomeScreen.dart';
import 'package:e_commerce_app/features/languages/presentation/views/language.dart';
import 'package:e_commerce_app/features/onboarding/presentation/views/onborading.dart';
import 'package:e_commerce_app/features/orders/presentation/views/archive.dart';
import 'package:e_commerce_app/features/orders/presentation/views/details.dart';
import 'package:e_commerce_app/features/orders/presentation/views/pending.dart';
import 'package:e_commerce_app/features/orders/presentation/views/widgets/itemDetails.dart';
import 'package:e_commerce_app/features/products/presentation/views/items.dart';
import 'package:e_commerce_app/features/settings/presentation/views/personal_info.dart';
import 'package:e_commerce_app/features/settings/presentation/views/profile.dart';
import 'package:e_commerce_app/features/settings/presentation/views/setting.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/middleWare/middleWare.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart.dart';
import 'package:e_commerce_app/features/address/presentation/views/add_address.dart';
import 'package:e_commerce_app/features/address/presentation/views/view_address.dart';
import 'package:e_commerce_app/features/auth/presentation/views/ForgetPassword/ForgetPassword.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/',
      page: () => const LanguagePage(),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: Approuts.onboarding,
    page: () => const OnBoarding(),
  ),
  //Auth
  GetPage(
    name: Approuts.login,
    page: () => const loginPage(),
  ),
  GetPage(
    name: Approuts.signup,
    page: () => const SignupPage(),
  ),
  GetPage(
    name: Approuts.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: Approuts.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: Approuts.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: Approuts.successReset,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: Approuts.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: Approuts.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: Approuts.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: Approuts.profilePage,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: Approuts.items,
    page: () => const Items(),
  ),
  GetPage(
    name: Approuts.product,
    page: () => const ProductDetail(),
  ),
  GetPage(
    name: Approuts.myfavorite,
    page: () => const MyFavorite(),
  ),
  GetPage(
    name: Approuts.cart,
    page: () => const Cart(),
  ),
  //address
  GetPage(
    name: Approuts.addAddress,
    page: () => const AddAddress(),
  ),
  GetPage(
    name: Approuts.viewAddress,
    page: () => const ViewAddress(),
  ),
  GetPage(
    name: Approuts.checkout,
    page: () => const Checkout(),
  ),

  GetPage(
    name: Approuts.pendingOrder,
    page: () => const OrdersPending(),
  ),
  GetPage(
    name: Approuts.orderDetail,
    page: () => const OrderDetail(),
  ),
  GetPage(
    name: Approuts.orderArchive,
    page: () => const OrdersArchiveView(),
  ),

   GetPage(
    name: Approuts.personalInfo,
    page: () => const PersonalInfo(),
  ),
  GetPage(
    name: Approuts.setting,
    page: () =>  const SettingPage(),
  ),
];

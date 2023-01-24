import 'package:emraan/getx/bindings/app/payment_binding.dart';
import 'package:emraan/getx/bindings/app/products_details_binding.dart';
import 'package:emraan/getx/bindings/auth/change_password_binding.dart';
import 'package:emraan/screens/app/cart_screen.dart';
import 'package:emraan/screens/app/categories_screen.dart';
import 'package:emraan/screens/app/offers_screen.dart';
import 'package:emraan/screens/app/order_details_screen.dart';
import 'package:emraan/screens/app/payment/payment_screen.dart';
import 'package:emraan/screens/app/payment/payment_success_screen.dart';
import 'package:emraan/screens/app/product_details_screen.dart';
import 'package:emraan/screens/app/products_screen.dart';
import 'package:emraan/screens/app/profile/account_balance/account_balance_screen.dart';
import 'package:emraan/screens/app/profile/account_balance/add_payment_card_screen.dart';
import 'package:emraan/screens/app/profile/address_screen.dart';
import 'package:emraan/screens/app/profile/feedbacks/add_feedback_screen.dart';
import 'package:emraan/screens/app/profile/feedbacks/feedback_details_screen.dart';
import 'package:emraan/screens/app/profile/feedbacks/feedbacks_screen.dart';
import 'package:emraan/screens/app/profile/my_profile/change_password_screen.dart';
import 'package:emraan/screens/app/profile/my_profile/edit_my_profile_screen.dart';
import 'package:emraan/screens/app/profile/my_profile/my_profile_screen.dart';
import 'package:emraan/screens/app/profile/services_evaluations/edit_services_evaluation_screen.dart';
import 'package:emraan/screens/app/profile/services_evaluations/services_evaluation_screen.dart';
import 'package:emraan/screens/app/profile/settings/about_us_screen.dart';
import 'package:emraan/screens/app/profile/settings/languages_screen.dart';
import 'package:emraan/screens/app/profile/settings/our_address_screen.dart';
import 'package:emraan/screens/app/profile/settings/privacy_policy_screen.dart';
import 'package:emraan/screens/app/profile/settings/settings_screen.dart';
import 'package:emraan/screens/app/profile/wish_list_screen.dart';
import 'package:emraan/screens/app/store/store_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../getx/bindings/auth/verification_binding.dart';
import '../../screens/auth/verification_screen.dart';
import '../../screens/intro/welcome_screen.dart';
import '../../core/routes/routes_manager.dart';
import '../../getx/bindings/app/home_binding.dart';
import '../../getx/bindings/auth/reset_password_binding.dart';
import '../../getx/bindings/auth/forget_password_binding.dart';
import '../../getx/bindings/auth/sign_in_binding.dart';
import '../../getx/bindings/auth/sign_up_binding.dart';
import '../../screens/auth/reset_password_screen.dart';
import '../../screens/auth/forget_password_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/app/home_screen.dart';

final List<GetPage<dynamic>> getPages = [
  GetPage(
    name: RoutesManager.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  // Auth
  GetPage(
    name: RoutesManager.loginScreen,
    page: () => const LoginScreen(),
    transition: Transition.upToDown,
    binding: LoginBinding(),
  ),
  GetPage(
    name: RoutesManager.registerScreen,
    page: () => const RegisterScreen(),
    transition: Transition.downToUp,
    binding: RegisterBinding(),
  ),
  GetPage(
    name: RoutesManager.forgetPasswordScreen,
    page: () => const ForgetPasswordScreen(),
    binding: ForgetPasswordBinding(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesManager.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
    binding: ResetPasswordBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.verificationScreen,
    page: () => const VerificationScreen(),
    binding: VerificationBinding(),
    transition: Transition.fade,
  ),
  // App
  GetPage(
    name: RoutesManager.homeScreen,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutesManager.offersScreen,
    page: () => const OffersScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.categoriesScreen,
    page: () => const CategoriesScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.productsScreen,
    page: () => const ProductsScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.productDetailsScreen,
    page: () => const ProductDetailsScreen(),
    binding: ProductDetailsBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.orderDetailsScreen,
    page: () => const OrderDetailsScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.cartScreen,
    page: () => const CartScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.paymentScreen,
    page: () => const PaymentScreen(),
    binding: PaymentBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.paymentSuccessScreen,
    page: () => const PaymentSuccessScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.storeScreen,
    page: () => const StoreScreen(),
    transition: Transition.fade,
  ),
  // Profile
  GetPage(
    name: RoutesManager.myProfileScreen,
    page: () => const MyProfileScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: RoutesManager.editMyProfileScreen,
    page: () => const EditMyProfileScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: RoutesManager.changePasswordScreen,
    page: () => const ChangePasswordScreen(),
    binding: ChangePasswordBinding(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: RoutesManager.accountBalanceScreen,
    page: () => const AccountBalanceScreen(),
    binding: PaymentBinding(),
    transition: Transition.leftToRight,
    curve: Curves.easeIn,
  ),
  GetPage(
    name: RoutesManager.addPaymentCardScreen,
    page: () => const AddPaymentCardScreen(),
    binding: PaymentBinding(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.addressScreen,
    page: () => const AddressScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.servicesEvaluationScreen,
    page: () => const ServicesEvaluationScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.editServicesEvaluationScreen,
    page: () => const EditServicesEvaluationScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.feedbacksScreen,
    page: () => const FeedbacksScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.feedbackDetailsScreen,
    page: () => const FeedbackDetailsScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.addFeedbackScreen,
    page: () => const AddFeedbackScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: RoutesManager.wishListScreen,
    page: () => const WishListScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.settingsScreen,
    page: () => const SettingsScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.languagesScreen,
    page: () => const LanguagesScreen(),
    transition: Transition.size,
  ),
  GetPage(
    name: RoutesManager.aboutUsScreen,
    page: () => const AboutUsScreen(),
    transition: Transition.size,
  ),
  GetPage(
    name: RoutesManager.privacyPolicyScreen,
    page: () => const PrivacyPolicyScreen(),
    transition: Transition.size,
  ),
  GetPage(
    name: RoutesManager.ourAddressScreen,
    page: () => const OurAddressScreen(),
    transition: Transition.size,
  ),
];

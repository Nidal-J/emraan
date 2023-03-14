import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../screens/merchant/merchant_evaluation_screen.dart';
import '../screens/merchant/merchant_packages/merchant_package_details_screen.dart';
import '../getx/bindings/auth/change_password_binding.dart';
import '../getx/bindings/auth/forget_password_binding.dart';
import '../getx/bindings/auth/reset_password_binding.dart';
import '../getx/bindings/auth/sign_in_binding.dart';
import '../getx/bindings/auth/sign_up_binding.dart';
import '../getx/bindings/auth/verification_binding.dart';
import '../screens/auth/forget_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/reset_password_screen.dart';
import '../screens/auth/verification_screen.dart';
import '../getx/bindings/customer/customer_edit_profile_binding.dart';
import '../getx/bindings/customer/customer_feedback_binding.dart';
import '../getx/bindings/customer/customer_home_binding.dart';
import '../getx/bindings/customer/customer_notifications_binding.dart';
import '../getx/bindings/customer/customer_payment_binding.dart';
import '../getx/bindings/customer/customer_products_details_binding.dart';
import '../screens/customer/customer_cart_screen.dart';
import '../screens/customer/customer_categories_screen.dart';
import '../screens/customer/customer_notification/customer_notification_reject_screen.dart';
import '../screens/customer/customer_notification/customer_notifications_screen.dart';
import '../screens/customer/customer_offers_screen.dart';
import '../screens/customer/customer_order_details_screen.dart';
import '../screens/customer/customer_payment/customer_payment_screen.dart';
import '../screens/customer/customer_payment/customer_payment_success_screen.dart';
import '../screens/customer/customer_products/customer_product_details_screen.dart';
import '../screens/customer/customer_products/customer_products_screen.dart';
import '../screens/customer/customer_profile/customer_account_balance/customer_account_balance_screen.dart';
import '../screens/customer/customer_profile/customer_account_balance/customer_add_payment_card_screen.dart';
import '../screens/customer/customer_profile/customer_address_screen.dart';
import '../screens/customer/customer_profile/customer_feedbacks/customer_add_feedback_screen.dart';
import '../screens/customer/customer_profile/customer_feedbacks/customer_feedback_details_screen.dart';
import '../screens/customer/customer_profile/customer_feedbacks/customer_feedbacks_screen.dart';
import '../screens/customer/customer_profile/customer_my_profile/customer_change_password_screen.dart';
import '../screens/customer/customer_profile/customer_my_profile/customer_edit_my_profile_screen.dart';
import '../screens/customer/customer_profile/customer_my_profile/customer_my_profile_screen.dart';
import '../screens/customer/customer_profile/customer_services_evaluations/customer_edit_services_evaluation_screen.dart';
import '../screens/customer/customer_profile/customer_services_evaluations/customer_services_evaluation_screen.dart';
import '../screens/customer/customer_profile/customer_settings/customer_about_us_screen.dart';
import '../screens/customer/customer_profile/customer_settings/customer_languages_screen.dart';
import '../screens/customer/customer_profile/customer_settings/customer_our_address_screen.dart';
import '../screens/customer/customer_profile/customer_settings/customer_privacy_policy_screen.dart';
import '../screens/customer/customer_profile/customer_settings/customer_settings_screen.dart';
import '../screens/customer/customer_profile/customer_wish_list_screen.dart';
import '../screens/customer/customer_store_screen.dart';
import '../getx/bindings/merchant/merchant_home_binding.dart';
import '../getx/bindings/merchant/merchant_offers_binding.dart';
import '../getx/bindings/merchant/merchant_packages_binding.dart';
import '../getx/bindings/merchant/merchant_products_binding.dart';
import '../screens/merchant/merchant_home_screen.dart';
import '../screens/merchant/merchant_offers/merchant_add_offer_screen.dart';
import '../screens/merchant/merchant_offers/merchant_offer_details_screen.dart';
import '../screens/merchant/merchant_order_details_screen.dart';
import '../screens/merchant/merchant_packages/merchant_add_package_screen.dart';
import '../screens/merchant/merchant_products/merchant_add_product_screen.dart';
import '../screens/merchant/merchant_products/merchant_product_details_screen.dart';
import '../screens/customer/customer_notification/customer_notification_status_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/customer/customer_home_screen.dart';
import 'routes_manager.dart';

final List<GetPage<dynamic>> getPages = [
  GetPage(
    name: RoutesManager.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: RoutesManager.loginScreen,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: RoutesManager.registerScreen,
    page: () => const RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: RoutesManager.forgetPasswordScreen,
    page: () => const ForgetPasswordScreen(),
    binding: ForgetPasswordBinding(),
  ),
  GetPage(
    name: RoutesManager.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
    binding: ResetPasswordBinding(),
  ),
  GetPage(
    name: RoutesManager.verificationScreen,
    page: () => const VerificationScreen(),
    binding: VerificationBinding(),
  ),
  GetPage(
    name: RoutesManager.homeScreen,
    page: () => const CustomerHomeScreen(),
    binding: CustomerHomeBinding(),
  ),
  GetPage(
    name: RoutesManager.offersScreen,
    page: () => const CustomerOffersScreen(),
  ),
  GetPage(
    name: RoutesManager.categoriesScreen,
    page: () => const CustomerCategoriesScreen(),
  ),
  GetPage(
    name: RoutesManager.productsScreen,
    page: () => const CustomerProductsScreen(),
  ),
  GetPage(
    name: RoutesManager.productDetailsScreen,
    page: () => const CustomerProductDetailsScreen(),
    binding: CustomerProductDetailsBinding(),
  ),
  GetPage(
    name: RoutesManager.orderDetailsScreen,
    page: () => const CustomerOrderDetailsScreen(),
  ),
  GetPage(
    name: RoutesManager.cartScreen,
    page: () => const CustomerCartScreen(),
  ),
  GetPage(
    name: RoutesManager.paymentScreen,
    page: () => const CustomerPaymentScreen(),
    binding: CustomerPaymentBinding(),
  ),
  GetPage(
    name: RoutesManager.paymentSuccessScreen,
    page: () => const CustomerPaymentSuccessScreen(),
  ),
  GetPage(
    name: RoutesManager.storeScreen,
    page: () => const CustomerStoreScreen(),
  ),
  GetPage(
    name: RoutesManager.notificationsScreen,
    page: () => const CustomerNotificationsScreen(),
  ),
  GetPage(
    name: RoutesManager.notificationsStatusScreen,
    page: () => const CustomerNotificationStatusScreen(),
  ),
  GetPage(
    name: RoutesManager.notificationsRejectScreen,
    page: () => const CustomerNotificationRejectScreen(),
    binding: CustomerNotificationsBinding(),
  ),
  GetPage(
    name: RoutesManager.myProfileScreen,
    page: () => const CustomerMyProfileScreen(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: RoutesManager.editMyProfileScreen,
    page: () => const CustomerEditMyProfileScreen(),
    binding: CustomerEditProfileBinding(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: RoutesManager.changePasswordScreen,
    page: () => const CustomerChangePasswordScreen(),
    binding: ChangePasswordBinding(),
    transition: Transition.zoom,
  ),
  GetPage(
    name: RoutesManager.accountBalanceScreen,
    page: () => const CustomerAccountBalanceScreen(),
    binding: CustomerPaymentBinding(),
    transition: Transition.leftToRight,
    curve: Curves.easeIn,
  ),
  GetPage(
    name: RoutesManager.addPaymentCardScreen,
    page: () => const CustomerAddPaymentCardScreen(),
    binding: CustomerPaymentBinding(),
  ),
  GetPage(
    name: RoutesManager.addressScreen,
    page: () => const CustomerAddressScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.servicesEvaluationScreen,
    page: () => const CustomerServicesEvaluationScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.editServicesEvaluationScreen,
    page: () => const CustomerEditServicesEvaluationScreen(),
  ),
  GetPage(
    name: RoutesManager.feedbacksScreen,
    page: () => const CustomerFeedbacksScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.feedbackDetailsScreen,
    page: () => const CustomerFeedbackDetailsScreen(),
    binding: CustomerFeedbackBinding(),
  ),
  GetPage(
    name: RoutesManager.addFeedbackScreen,
    page: () => const CustomerAddFeedbackScreen(),
    binding: CustomerFeedbackBinding(),
  ),
  GetPage(
    name: RoutesManager.wishListScreen,
    page: () => const CustomerWishListScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.settingsScreen,
    page: () => const CustomerSettingsScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.languagesScreen,
    page: () => const CustomerLanguagesScreen(),
  ),
  GetPage(
    name: RoutesManager.aboutUsScreen,
    page: () => const CustomerAboutUsScreen(),
  ),
  GetPage(
    name: RoutesManager.privacyPolicyScreen,
    page: () => const CustomerPrivacyPolicyScreen(),
  ),
  GetPage(
    name: RoutesManager.ourAddressScreen,
    page: () => const CustomerOurAddressScreen(),
  ),
  GetPage(
    name: RoutesManager.merchantHomeScreen,
    page: () => const MerchantHomeScreen(),
    binding: MerchantHomeBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantOrderDetailsScreen,
    page: () => const MerchantOrderDetailsScreen(),
    binding: CustomerNotificationsBinding(),
  ),
  GetPage(
    name: RoutesManager.addProductScreen,
    page: () => const MerchantAddProductScreen(),
    binding: MerchantProductsBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantProductDetailsScreen,
    page: () => const MerchantProductDetailsScreen(),
    binding: MerchantProductsBinding(),
  ),
  GetPage(
    name: RoutesManager.addPackageScreen,
    page: () => const MerchantAddPackageScreen(),
    binding: MerchantPackagesBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantPackageDetailsScreen,
    page: () => const MerchantPackageDetailsScreen(),
    binding: MerchantPackagesBinding(),
  ),
  GetPage(
    name: RoutesManager.addOfferScreen,
    page: () => const MerchantAddOfferScreen(),
    binding: MerchantOffersBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantOfferDetailsScreen,
    page: () => const MerchantOfferDetailsScreen(),
    binding: MerchantOffersBinding(),
  ),
  GetPage(
    name: RoutesManager.customerEvaluationScreen,
    page: () => const MerchantEvaluationScreen(),
  ),
];

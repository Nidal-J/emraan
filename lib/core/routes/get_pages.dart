import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../merchant_app/screens/customer_evaluation_screen.dart';
import '../../merchant_app/screens/merchant_packages/merchant_package_details_screen.dart';
import '../../auth/getx/bindings/change_password_binding.dart';
import '../../auth/getx/bindings/forget_password_binding.dart';
import '../../auth/getx/bindings/reset_password_binding.dart';
import '../../auth/getx/bindings/sign_in_binding.dart';
import '../../auth/getx/bindings/sign_up_binding.dart';
import '../../auth/getx/bindings/verification_binding.dart';
import '../../auth/screens/forget_password_screen.dart';
import '../../auth/screens/login_screen.dart';
import '../../auth/screens/register_screen.dart';
import '../../auth/screens/reset_password_screen.dart';
import '../../auth/screens/verification_screen.dart';
import '../../customer_app/getx/bindings/edit_profile_binding.dart';
import '../../customer_app/getx/bindings/feedback_binding.dart';
import '../../customer_app/getx/bindings/home_binding.dart';
import '../../customer_app/getx/bindings/notifications_binding.dart';
import '../../customer_app/getx/bindings/payment_binding.dart';
import '../../customer_app/getx/bindings/products_details_binding.dart';
import '../../customer_app/screens/cart_screen.dart';
import '../../customer_app/screens/categories_screen.dart';
import '../../customer_app/screens/notification/notification_reject_screen.dart';
import '../../customer_app/screens/notification/notifications_screen.dart';
import '../../customer_app/screens/offers_screen.dart';
import '../../customer_app/screens/order_details_screen.dart';
import '../../customer_app/screens/payment/payment_screen.dart';
import '../../customer_app/screens/payment/payment_success_screen.dart';
import '../../customer_app/screens/products/product_details_screen.dart';
import '../../customer_app/screens/products/products_screen.dart';
import '../../customer_app/screens/profile/account_balance/account_balance_screen.dart';
import '../../customer_app/screens/profile/account_balance/add_payment_card_screen.dart';
import '../../customer_app/screens/profile/address_screen.dart';
import '../../customer_app/screens/profile/feedbacks/add_feedback_screen.dart';
import '../../customer_app/screens/profile/feedbacks/feedback_details_screen.dart';
import '../../customer_app/screens/profile/feedbacks/feedbacks_screen.dart';
import '../../customer_app/screens/profile/my_profile/change_password_screen.dart';
import '../../customer_app/screens/profile/my_profile/edit_my_profile_screen.dart';
import '../../customer_app/screens/profile/my_profile/my_profile_screen.dart';
import '../../customer_app/screens/profile/services_evaluations/edit_services_evaluation_screen.dart';
import '../../customer_app/screens/profile/services_evaluations/services_evaluation_screen.dart';
import '../../customer_app/screens/profile/settings/about_us_screen.dart';
import '../../customer_app/screens/profile/settings/languages_screen.dart';
import '../../customer_app/screens/profile/settings/our_address_screen.dart';
import '../../customer_app/screens/profile/settings/privacy_policy_screen.dart';
import '../../customer_app/screens/profile/settings/settings_screen.dart';
import '../../customer_app/screens/profile/wish_list_screen.dart';
import '../../customer_app/screens/store_screen.dart';
import '../../merchant_app/getx/bindings/merchant_home_binding.dart';
import '../../merchant_app/getx/bindings/merchant_offers_binding.dart';
import '../../merchant_app/getx/bindings/merchant_packages_binding.dart';
import '../../merchant_app/getx/bindings/merchant_products_binding.dart';
import '../../merchant_app/screens/merchant_home_screen.dart';
import '../../merchant_app/screens/merchant_offers/add_offer_screen.dart';
import '../../merchant_app/screens/merchant_offers/merchant_offer_details_screen.dart';
import '../../merchant_app/screens/merchant_order_details_screen.dart';
import '../../merchant_app/screens/merchant_packages/add_package_screen.dart';
import '../../merchant_app/screens/merchant_products/add_product_screen.dart';
import '../../merchant_app/screens/merchant_products/merchant_product_details_screen.dart';
import '../../customer_app/screens/notification/notification_status_screen.dart';
import '../../auth/screens/welcome_screen.dart';
import '../../core/routes/routes_manager.dart';
import '../../customer_app/screens/home_screen.dart';

final List<GetPage<dynamic>> getPages = [
  GetPage(
    name: RoutesManager.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  // Auth
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
  // App
  GetPage(
    name: RoutesManager.homeScreen,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutesManager.offersScreen,
    page: () => const OffersScreen(),
  ),
  GetPage(
    name: RoutesManager.categoriesScreen,
    page: () => const CategoriesScreen(),
  ),
  GetPage(
    name: RoutesManager.productsScreen,
    page: () => const ProductsScreen(),
  ),
  GetPage(
    name: RoutesManager.productDetailsScreen,
    page: () => const ProductDetailsScreen(),
    binding: ProductDetailsBinding(),
  ),
  GetPage(
    name: RoutesManager.orderDetailsScreen,
    page: () => const OrderDetailsScreen(),
  ),
  GetPage(
    name: RoutesManager.cartScreen,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: RoutesManager.paymentScreen,
    page: () => const PaymentScreen(),
    binding: PaymentBinding(),
  ),
  GetPage(
    name: RoutesManager.paymentSuccessScreen,
    page: () => const PaymentSuccessScreen(),
  ),
  GetPage(
    name: RoutesManager.storeScreen,
    page: () => const StoreScreen(),
  ),
  GetPage(
    name: RoutesManager.notificationsScreen,
    page: () => const NotificationsScreen(),
  ),
  GetPage(
    name: RoutesManager.notificationsStatusScreen,
    page: () => const NotificationStatusScreen(),
  ),
  GetPage(
    name: RoutesManager.notificationsRejectScreen,
    page: () => const NotificationRejectScreen(),
    binding: NotificationsBinding(),
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
    binding: EditProfileBinding(),
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
  ),
  GetPage(
    name: RoutesManager.feedbacksScreen,
    page: () => const FeedbacksScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: RoutesManager.feedbackDetailsScreen,
    page: () => const FeedbackDetailsScreen(),
    binding: FeedbackBinding(),
  ),
  GetPage(
    name: RoutesManager.addFeedbackScreen,
    page: () => const AddFeedbackScreen(),
    binding: FeedbackBinding(),
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
  ),
  GetPage(
    name: RoutesManager.aboutUsScreen,
    page: () => const AboutUsScreen(),
  ),
  GetPage(
    name: RoutesManager.privacyPolicyScreen,
    page: () => const PrivacyPolicyScreen(),
  ),
  GetPage(
    name: RoutesManager.ourAddressScreen,
    page: () => const OurAddressScreen(),
  ),
  // Merchant App
  GetPage(
    name: RoutesManager.merchantHomeScreen,
    page: () => const MerchantHomeScreen(),
    binding: MerchantHomeBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantOrderDetailsScreen,
    page: () => const MerchantOrderDetailsScreen(),
    binding: NotificationsBinding(),
  ),
  GetPage(
    name: RoutesManager.addProductScreen,
    page: () => const AddProductScreen(),
    binding: MerchantProductsBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantProductDetailsScreen,
    page: () => const MerchantProductDetailsScreen(),
    binding: MerchantProductsBinding(),
  ),
  GetPage(
    name: RoutesManager.addPackageScreen,
    page: () => const AddPackageScreen(),
    binding: MerchantPackagesBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantPackageDetailsScreen,
    page: () => const MerchantPackageDetailsScreen(),
    binding: MerchantPackagesBinding(),
  ),
  GetPage(
    name: RoutesManager.addOfferScreen,
    page: () => const AddOfferScreen(),
    binding: MerchantOffersBinding(),
  ),
  GetPage(
    name: RoutesManager.merchantOfferDetailsScreen,
    page: () => const MerchantOfferDetailsScreen(),
    binding: MerchantOffersBinding(),
  ),
  GetPage(
    name: RoutesManager.customerEvaluationScreen,
    page: () => const CustomerEvaluationScreen(),
  ),
];

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/routes/routes.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/store/store.dart';

class AppRoutes {
  static final pages = [
  GetPage (name: Routes.home, page: () => const HomeScreen()),
  GetPage (name: Routes.store, page: () => const StoreScreen()),
  GetPage (name: Routes.wishlist, page: () => const WishlistScreen()),
  GetPage (name: Routes.settings, page:  ()=> const SettingsScreen()),
  GetPage (name: Routes.productReviews, page: () => const ProductReviewsScreen()),
  GetPage (name: Routes.order, page: () => const OrderListScreen()),
  GetPage (name: Routes.checkout, page: () => const CheckoutScreen()),
  GetPage (name: Routes.cart, page: () => const CartScreen()),
  GetPage (name: Routes.userProfile, page: () => const ProfileScreen()),
  GetPage (name: Routes.userAddress, page:  ()=> const UserAddressScreen()),
  GetPage (name: Routes.signup, page: () => const SignupScreen()),
  GetPage (name: Routes. verifyEmail, page: () => const VerifyEmailScreen()),
  GetPage (name: Routes. signIn, page: () => const LoginScreen()),
  GetPage (name: Routes. forgetPassword, page: () => const ForgetPassword()),
  GetPage (name: Routes.onBoarding, page: () => const OnBoardingScreen()),
// Add more GetPage entries as needed
];
}
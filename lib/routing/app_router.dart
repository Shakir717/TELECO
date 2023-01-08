import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/common_data.dart';
import 'package:teleco/features/about_us/presentation/about_us_page.dart';
import 'package:teleco/features/authentications/forgot_password/presentation/forgot_password_page.dart';
import 'package:teleco/features/authentications/rese_password/presentation/reset_password.dart';
import 'package:teleco/features/authentications/set_password/presentation/set_password.dart';
import 'package:teleco/features/authentications/sign_in/presentation/sign_in_page.dart';
import 'package:teleco/features/authentications/sign_up/presentation/sign_up_page.dart';
import 'package:teleco/features/authentications/verificaton/presentation/verifications.dart';
import 'package:teleco/features/buy_new_sim/presentation/buy_new_sim.dart';
import 'package:teleco/features/help/presentation/help_page.dart';
import 'package:teleco/features/payment_recharge/presentation/payment_recharge.dart';
import 'package:teleco/features/product/presentation/product_details.dart';
import 'package:teleco/features/product/presentation/product_list_page.dart';
import '../features/bundles/presentation/bundles_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/splash/presentation/splash_page.dart';
import 'not_found_screen.dart';

enum AppRoute {
  home,
  signin,
  signup,
  splash,
  forgotpassword,
  verification,
  setpassword,
  resetpassword,
  buynewsimcard,
  bundles,
  productdetails,
  paymentandrecharge,
  aboutus,
  helppage,
  productlistpage,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        builder: (context, state) =>  HomePage(),
      ),

      GoRoute(
        path: '/signIn',
        name: AppRoute.signin.name,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: '/signUp',
        name: AppRoute.signup.name,
        builder: (context, state) =>  SignUpPage(),
      ),


      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) =>  HomePage(),
      ),

      GoRoute(
        path: '/verification',
        name: AppRoute.verification.name,
        builder: (context, state) =>  Verifications(),
      ),

      GoRoute(
        path: '/setpassword',
        name: AppRoute.setpassword.name,
        builder: (context, state) =>  SetPassword(),
      ),

      GoRoute(
        path: '/forgotpassword',
        name: AppRoute.forgotpassword.name,
        builder: (context, state) =>  ForgotPasswordPage(),
      ),

      GoRoute(
        path: '/resepassword',
        name: AppRoute.resetpassword.name,
        builder: (context, state) =>  ResetPasswordPage(),
      ),

      GoRoute(
        path: '/buynewsimcard',
        name: AppRoute.buynewsimcard.name,
        builder: (context, state) =>  BuyNewSimCardPage(),
      ),

      GoRoute(
        path: '/bundles',
        name: AppRoute.bundles.name,
        builder: (context, state) =>  BundlesPage(),
      ),


      GoRoute(
        path: '/productlistpage',
        name: AppRoute.productlistpage.name,
        builder: (context, state) =>  ProductListPage(),
      ),

      GoRoute(
        path: '/helppage',
        name: AppRoute.helppage.name,
        builder: (context, state) =>  HelpPage(),
      ),

      GoRoute(
        path: '/aboutus',
        name: AppRoute.aboutus.name,
        builder: (context, state) =>  AboutUSPage(),
      ),


      GoRoute(
        path: '/paymentandrecharge',
        name: AppRoute.paymentandrecharge.name,
        builder: (context, state) =>  PaymentAndRecharge(),
      ),

      GoRoute(
        path: '/productdetails',
        name: AppRoute.productdetails.name,
        builder: (context, state){
          final object=state.extra;
          if(object is ProductTagModel){
            return ProductDetails(product: object);
          }
          return ProductDetails(product: ProductTagModel());
        },
      ),

    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});

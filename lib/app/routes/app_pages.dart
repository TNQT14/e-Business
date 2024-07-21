import 'package:ebusiness/app/screens/main_view.dart';
import 'package:ebusiness/app/screens/other/about/about_screen.dart';
import 'package:ebusiness/app/screens/other/notification/notification_screen.dart';
import 'package:ebusiness/app/screens/other/orders/order_screen.dart';
import 'package:ebusiness/app/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/cart/cart_item.dart';
import '../domain/entities/product/product.dart';
import '../domain/entities/user/user.dart';
import '../logic/cubit/auth_cubit.dart';
import '../screens/delivery_info/delivery_info.dart';
import '../screens/forget_password/views/forget_screen.dart';
import '../screens/home/ui/filter/filter_screen.dart';
import '../screens/home/ui/home_screen.dart';
import '../screens/login/ui/login_screen.dart';
import '../screens/order_checkout_screen/order_checkout_screen.dart';
import '../screens/other/profile/profile_screen.dart';
import '../screens/other/settings/settings_view.dart';
import '../screens/sign_up/views/sign_up_sceen.dart';
import 'app_routes.dart';

class AppPages{
  late AuthCubit authCubit;

  AppPages() {
    authCubit = AuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ForgetScreen(),
          ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const HomeScreen(),
          ),
        );

      case AppRoutes.mainView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: MainView(),
          ),
        );

      case AppRoutes.productDetails:
        Product product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product));

      case AppRoutes.orderCheckout:
        List<CartItem> items = settings.arguments as List<CartItem>;
        return MaterialPageRoute(
            builder: (_) => OrderCheckoutScreen(
              items: items,
            ));

      case AppRoutes.deliveryDetails:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoScreen());
      //
      // case AppRoutes.createPassword:
      //   final arguments = settings.arguments;
      //   if (arguments is List) {
      //     return MaterialPageRoute(
      //       builder: (_) => BlocProvider.value(
      //         value: authCubit,
      //         child: CreatePassword(
      //           googleUser: arguments[0],
      //           credential: arguments[1],
      //         ),
      //       ),
      //     );
      //   }
      //
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const SignUpScreen(),
          ),
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const LoginScreen(),
          ),
        );

      case AppRoutes.userProfile:
        User user = settings.arguments as User;
        return MaterialPageRoute(
            builder: (_) => UserProfileScreen(
              user: user,
            ));

      case AppRoutes.productDetails:
        Product product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product));

      case AppRoutes.orders:
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case AppRoutes.about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case AppRoutes.filter:
        return MaterialPageRoute(builder: (_) => const FilterScreen());


    }
    return null;
  }

}
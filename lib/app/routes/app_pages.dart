import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/auth_cubit.dart';
import '../screens/home/ui/home_screen.dart';
import '../screens/login/ui/login_screen.dart';
import '../screens/sign_up/views/sign_up_sceen.dart';
import 'app_routes.dart';

class AppPages{
  late AuthCubit authCubit;

  AppPages() {
    authCubit = AuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.forgetScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: authCubit,
      //       child: const ForgetScreen(),
      //     ),
      //   );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const HomeScreen(),
          ),
        );
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
    }
    return null;
  }

}
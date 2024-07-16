import 'package:ebusiness/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app/blocs/filter/filter_cubit.dart';
import 'app/blocs/product/product_bloc.dart';
import 'app/blocs/user/user_bloc.dart';
import 'app/domain/use_case/product/get_product_usecase.dart';
import 'app/routes/app_pages.dart';
import 'app/screens/home/blocs/navbar_dart_cubit.dart';
import 'app/theme/app_colors.dart';
import 'firebase_options.dart';
import 'app/core/services/services_locator.dart' as di;
// import 'core/services/services_locator.dart' as di;

late String initialRoute;


Future<void> preloadSVGs(List<String> paths) async {
  for (final path in paths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
          () => loader.loadBytes(null),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    ScreenUtil.ensureScreenSize(),
    preloadSVGs(['assets/svgs/google_logo.svg'])
  ]);

  FirebaseAuth.instance.authStateChanges().listen(
        (user) {
      if (user == null || !user.emailVerified) {
        initialRoute = AppRoutes.loginScreen;
      } else {
        initialRoute = AppRoutes.mainView;
      }
    },
  );

  runApp(MyApp(router: AppPages()));
}

class MyApp extends StatelessWidget {
  final AppPages router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => di.sl<ProductBloc>()
            ..add(const GetProducts(FilterProductParams())),
        ),
        BlocProvider(
          create: (context) => di.sl<UserBloc>()..add(CheckUser()),
        ),
        BlocProvider(
          create: (context) => di.sl<UserBloc>()..add(CheckUser()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Login & Signup App',
            theme: ThemeData(
              useMaterial3: true,
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: ColorsManager.mainBlue,
                selectionColor: Color.fromARGB(188, 36, 124, 255),
                selectionHandleColor: ColorsManager.mainBlue,
              ),
            ),
            onGenerateRoute: router.generateRoute,
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
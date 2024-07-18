abstract class AppRoutes{
  AppRoutes._();

  static const String userProfile = _Paths.userProfile;
  static const String orders = _Paths.orders;
  static const String settings = _Paths.settings;
  static const String notifications = _Paths.notifications;
  static const String about = _Paths.about;
  static const String filter = _Paths.filter;

  static const String deliveryDetails = _Paths.deliveryDetails;
  static const String orderCheckout = _Paths.orderCheckout;
  static const String productDetails = _Paths.productDetails;
  static const String loginScreen = _Paths.loginScreen;
  static const String forgetScreen = _Paths.forgetScreen;
  static const String signupScreen = _Paths.signupScreen;
  static const String createPassword = _Paths.createPassword;
  static const String homeScreen = _Paths.homeScreen;
  static const String mainView = _Paths.mainView;
}

abstract class _Paths{
  static const String userProfile = '/userProfile';
  static const String orders = '/orders';
  static const String settings = '/settings';
  static const String notifications = '/notifications';
  static const String about = '/about';
  static const String filter = '/filter';

  static const String deliveryDetails = '/deliveryDetails';
  static const String orderCheckout = '/orderCheckout';
  static const String productDetails = '/productDetails';
  static const String loginScreen = "/loginScreen";
  static const String forgetScreen = "/forgetScreen";
  static const String signupScreen = "/signupScreen";
  static const String createPassword = "/createPassword";
  static const String homeScreen = "/homeScreen";
  static const String mainView = "/";
}
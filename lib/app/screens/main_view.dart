import 'package:ebusiness/app/helpers/extensions.dart';
import 'package:ebusiness/app/screens/category/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../routes/app_routes.dart';
import 'cart/cart_screen.dart';
import 'home/blocs/navbar_dart_cubit.dart';
import 'home/ui/home_screen.dart';
import 'other/other_screen.dart';

class MainView extends StatefulWidget {
  // const MainView({});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavbarCubit,int>(
              builder: (context,state){
                return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller:  context.read<NavbarCubit>().controller,
                    children: [
                      const HomeScreen(),
                      const CategoryScreen(),
                      const CartScreen(),
                      const OtherScreen(),
                    ],
                  )
                );
              }
          ),
          Positioned(
            bottom: 10,
            left: 18,
            right: 18,
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: BlocBuilder<NavbarCubit, int>(
                builder: (context, state){
                  return SnakeNavigationBar.color(
                    behaviour: SnakeBarBehaviour.floating,
                    snakeShape: SnakeShape.indicator,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(48)),
                    ),
                    backgroundColor: Colors.black87,
                    snakeViewColor: Colors.black87,
                    height: 68,
                    elevation: 4,
                    selectedItemColor: SnakeShape.circle == SnakeShape.indicator
                        ? Colors.black87
                        : null,
                    unselectedItemColor: Colors.white,
                    selectedLabelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                    showUnselectedLabels: false,
                    showSelectedLabels: true,
                    currentIndex: state,
                    onTap: (index) => setState(() {
                      context.read<NavbarCubit>().controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                      context.read<NavbarCubit>().update(index);
                    }),
                    items: const [
                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/home.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Trang chủ'),
                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/categories.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Danh mục'),
                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/shopping-cart.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Giỏ hàng'),
                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/user.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Khác'),
                      // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
                    ],
                  );
                },
              ),

            ),
          )
        ],
      ),
    );
  }
}

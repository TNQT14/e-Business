import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import '../../blocs/order/order_fetch/order_fetch_cubit.dart';
import '../../blocs/user/user_bloc.dart';
import '../../core/values/image_assets.dart';
import '../../data/models/user/user_model.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../../routes/app_routes.dart';
import 'package:izota_ekyc/card_recognition_interface.dart';
import '../../src/document/card_front_recognition_page.dart';
import '../../widgets/other_item_card.dart';


class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is LoginSuccess) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.userProfile,
                        arguments: state.user,
                      );
                    },
                    child: Row(
                      children: [
                        state.user.image != null
                            ? CachedNetworkImage(
                                imageUrl: state.user.image!,
                                imageBuilder: (context, image) => CircleAvatar(
                                  radius: 36.0,
                                  backgroundImage: image,
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            : const CircleAvatar(
                                radius: 36.0,
                                backgroundImage: AssetImage(ImageAssets.kUserAvatar),
                                backgroundColor: Colors.transparent,
                              ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.user.firstName} ${state.user.lastName}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(state.user.email)
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 36.0,
                          backgroundImage: AssetImage(ImageAssets.kUserAvatar),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Đăng nhập",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text("")
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }, listener: (context, state){
              if (state is LoginSuccess) {
              }
            },
            ),
          ),
          const SizedBox(height: 25),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              return OtherItemCard(
                onClick: () {
                  // print('Check state.user ${state.user}');

                  if (state is LoginSuccess) {


                    print('Check state.user ${state.user}');
                    Navigator.of(context).pushNamed(
                      AppRoutes.userProfile,
                      arguments: state.user,
                    );
                  } else {
                    Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                  }
                },
                title: "Thông tin cá nhân",
              );
            }, listener: (context, state) {
              if (state is LoginSuccess) {
                UserModel userModel = state.user;
          } },
          ),
          const SizedBox(height: 6),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              print('state $state');
             if(state is LoginSuccess && state.user.verify_account =='false'){
               return OtherItemCard(
                 onClick: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => CardFrontRecognitionPage(),
                     ),
                   );
                 },
                 title: "Xác thực tài khoản",
               );
             }
              if(state is LoginSuccess && state.user.verify_account =='true'){
                return OtherItemCard(
                  onClick: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => CardFrontRecognitionPage(),
                    //   ),
                    // );
                  },
                  title: "Tài khoản đã được xác thực",
                );
              }
             else{
               return Container();
             }
            }, listener: (context, state) {
            if (state is LoginSuccess) {
            } },
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLogged) {
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: OtherItemCard(
                    onClick: () {
                      Navigator.of(context).pushNamed(AppRoutes.orders);
                    },
                    title: "Đơn hàng",
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLogged) {
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: OtherItemCard(
                    onClick: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.deliveryDetails);
                    },
                    title: "Thông tin giao hàng",
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 6),
          OtherItemCard(
            onClick: () {
              Navigator.of(context).pushNamed(AppRoutes.settings);
            },
            title: "Cài đặt",
          ),
          const SizedBox(height: 6),
          OtherItemCard(
            onClick: () {
              Navigator.of(context).pushNamed(AppRoutes.notifications);
            },
            title: "Thông báo",
          ),
          const SizedBox(height: 6),
          OtherItemCard(
            onClick: () {
              Navigator.of(context).pushNamed(AppRoutes.about);
            },
            title: "Thông tin",
          ),
          const SizedBox(height: 6),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLogged) {
                return OtherItemCard(
                  onClick: () {
                    context.read<UserBloc>().add(SignOutUser());
                    context.read<CartBloc>().add(const ClearCart());
                    context
                        .read<DeliveryInfoFetchCubit>()
                        .clearLocalDeliveryInfo();
                    context.read<OrderFetchCubit>().clearLocalOrders();
                  },
                  title: "Đăng xuất",
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          SizedBox(height: (MediaQuery.of(context).padding.bottom + 50)),
        ],
      ),
    );
  }
}

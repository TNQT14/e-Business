import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import '../../blocs/order/order_fetch/order_fetch_cubit.dart';
import '../../blocs/user/user_bloc.dart';
import '../../core/values/image_assets.dart';
import '../../routes/app_routes.dart';
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
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLogged) {
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
                              "Login in your account",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text("")
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 25),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return OtherItemCard(
                onClick: () {
                  if (state is UserLogged) {
                    Navigator.of(context).pushNamed(
                      AppRoutes.userProfile,
                      arguments: state.user,
                    );
                  } else {
                    Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                  }
                },
                title: "Profile",
              );
            },
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
                    title: "Orders",
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
                    title: "Delivery Info",
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
            title: "Settings",
          ),
          const SizedBox(height: 6),
          OtherItemCard(
            onClick: () {
              Navigator.of(context).pushNamed(AppRoutes.notifications);
            },
            title: "Notifications",
          ),
          const SizedBox(height: 6),
          OtherItemCard(
            onClick: () {
              Navigator.of(context).pushNamed(AppRoutes.about);
            },
            title: "About",
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
                  title: "Sign Out",
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
import 'package:ebusiness/app/core/values/app_style_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/order/order_fetch/order_fetch_cubit.dart';
import '../../../widgets/order_info_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: BlocBuilder<OrderFetchCubit, OrderFetchState>(
        builder: (context, state) {
          if(state is! OrderFetchLoading && state.orders.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.kOrderDelivery),
                const Text("Orders are Empty!"),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height * 0.1,
                )
              ],
            );
          }
          if (state is OrderFetchSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.orders.length,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: (10 + MediaQuery.of(context).padding.bottom),
                top: 10,
              ),
              itemBuilder: (context, index) => OrderInfoCard(
                orderDetails: state.orders[index],
              ),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: (10 + MediaQuery.of(context).padding.bottom),
                top: 10,
              ),
              itemBuilder: (context, index) => const OrderInfoCard(),
            );
          }
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebusiness/app/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../../../app/core/services/services_locator.dart' as di;
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import '../../blocs/order/order_add/order_add_cubit.dart';
import '../../core/utils/strings.dart';
import '../../domain/entities/cart/cart_item.dart';
import '../../domain/entities/order/order_details.dart';
import '../../domain/entities/order/order_item.dart';
import '../../routes/app_routes.dart';
import '../../widgets/input_form_button.dart';
import '../../widgets/outline_label_card.dart';
import '../home/blocs/navbar_dart_cubit.dart';

class OrderCheckoutScreen extends StatelessWidget {
  final List<CartItem> items;
  const OrderCheckoutScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<OrderAddCubit>(),
      child: BlocListener<OrderAddCubit, OrderAddState>(
        listener: (context, state) {
          EasyLoading.dismiss();
          if (state is OrderAddLoading) {
            EasyLoading.show(status: 'Đang tải...');
          } else if (state is OrderAddSuccess) {
            context.read<NavbarCubit>().update(0);
            context.read<NavbarCubit>().controller.jumpToPage(0);
            context.read<CartBloc>().add(const ClearCart());
            Navigator.of(context).pop();
            EasyLoading.showSuccess("Đặt hàng thành công");
          } else if (state is OrderAddFail) {
            EasyLoading.showError("Lỗi");
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Thanh toán đơn hàng'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 12,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlineLabelCard(
                        title: 'Chi tiết giao hàng',
                        child: BlocBuilder<DeliveryInfoFetchCubit,
                            DeliveryInfoFetchState>(
                          builder: (context, state) {
                            if (state.deliveryInformation.isNotEmpty &&
                                state.selectedDeliveryInformation != null) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    top: 16, bottom: 12, left: 4, right: 10),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${state.selectedDeliveryInformation!.firstName.capitalize()} ${state.selectedDeliveryInformation!.lastName}, ${state.selectedDeliveryInformation!.contactNumber}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "${state.selectedDeliveryInformation!.addressLineOne}, ${state.selectedDeliveryInformation!.addressLineTwo}, ${state.selectedDeliveryInformation!.city}, ${state.selectedDeliveryInformation!.zipCode}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                              );
                            } else {
                              return Container(
                                height: 50,
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 8, left: 4),
                                child: const Text(
                                  "Vui lòng chọn thông tin giao hàng",
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      right: -4,
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.deliveryDetails);
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlineLabelCard(
                  title: 'Sản phẩm được chọn',
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 8),
                    child: Column(
                      children: items
                          .map((product) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 75,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl: '$baseUrlImage${product.product.images.first}?raw=true',
                                              ),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.product.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                              '\đ${NumberFormat('#,###').format(product.priceTag.price)}')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlineLabelCard(
                  title: 'Tổng kết đơn hàng',
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tổng số lượng"),
                            Text("x${items.length}")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tổng giá"),
                            Text(
                                "\đ${NumberFormat('#,###').format(items.fold(0.0, (previousValue, element) => (element.priceTag.price + previousValue)))}")
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Phí vận chuyển"), Text("Miễn phí")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tổng"),
                            Text(
                                "\đ${NumberFormat('#,###').format((items.fold(0.0, (previousValue, element) => (element.priceTag.price + previousValue))))}")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Builder(builder: (context) {
                return InputFormButton(
                  color: Colors.black87,
                  onClick: () {
                    if (context
                            .read<DeliveryInfoFetchCubit>()
                            .state
                            .selectedDeliveryInformation ==
                        null) {
                      EasyLoading.showError("Lỗi \nVui lòng chọn giao hàng thêm thông tin giao hàng của bạn");
                    } else {
                      context.read<OrderAddCubit>().addOrder(OrderDetails(
                          id: '',
                          orderItems: items
                              .map((item) => OrderItem(
                                    id: '',
                                    product: item.product,
                                    priceTag: item.priceTag,
                                    price: item.priceTag.price,
                                    quantity: 1,
                                  ))
                              .toList(),
                          deliveryInfo: context
                              .read<DeliveryInfoFetchCubit>()
                              .state
                              .selectedDeliveryInformation!,
                          discount: 0));
                    }
                  },
                  titleText: 'Xác nhận',
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

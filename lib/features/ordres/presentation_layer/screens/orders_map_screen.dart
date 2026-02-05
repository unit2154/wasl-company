import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/widgets/map.dart';
import 'package:wasl_company_app/core/widgets/search_bar.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/new_map_order_widget.dart';

class OrdersMapScreen extends StatelessWidget {
  const OrdersMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<OrdersCubit>()..getOrders(),
      child: Scaffold(
        appBar: AppBar(title: Text("الرئيسية")),
        drawer: SideMenu(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            return Center(
              child: BlocConsumer<OrdersCubit, OrdersState>(
                listener: (context, state) {
                  if (state is OrdersError) {
                    showDialog<Widget>(
                      context: context,
                      builder: (context) =>
                          const Center(child: Text("حدث خطأ")),
                    );
                  } else if (state is OrderUpdated) {
                    context.read<OrdersCubit>().getOrders();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("تم تحديث الطلب")),
                    );
                  }
                },

                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OrdersLoaded) {
                    List<OrderEntity> orders = state.ordersListEntity.orders!
                        .where((o) => o.status == "pending")
                        .toList();
                    return Column(
                      children: [
                        SearchInput(
                          controller: TextEditingController(),
                          height: height * 0.06,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            height: height * 0.4,
                            width: width * 0.95,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: MapWidget(),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          height: height * 0.48,
                          width: width * 0.95,
                          child: ListView.builder(
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return NewMapOrderWidget(
                                width: width,
                                height: height,
                                order: orders[index],
                                cubitContext: context,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (state is OrdersError) {
                    return const Center(child: Text("حدث خطأ"));
                  } else {
                    return const Center(child: Text("حدث خطأ"));
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

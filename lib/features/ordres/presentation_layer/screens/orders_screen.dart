import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/widgets/search_bar.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_card_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // number of tabs
      child: BlocProvider(
        create: (context) => getIt<OrdersCubit>()..getOrders(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('الطلبات'),
            bottom: TabBar(
              tabAlignment: TabAlignment.start,
              indicatorColor: AppColors.primary,
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: 'الكل'),
                Tab(text: 'جديدة'),
                Tab(text: 'تامة'),
                Tab(text: 'قيد المراجعة'),
                Tab(text: 'مرفوضة'),
              ],
            ),
          ),
          drawer: SideMenu(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return BlocConsumer<OrdersCubit, OrdersState>(
                listener: (context, state) {
                  switch (state) {
                    case OrdersLoading():
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Loading...')),
                      );
                      break;
                    case OrdersError():
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                      break;
                    case OrdersLoaded():
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم استلام الطلبات")),
                      );
                      break;
                    default:
                      break;
                  }
                },
                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is OrdersError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is OrdersLoaded) {
                    return TabBarView(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              SearchInput(
                                controller: TextEditingController(),
                                height: constraints.maxHeight * 0.065,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      state.ordersListEntity.orders!.length,
                                  itemBuilder: (context, index) => OrderCard(
                                    order:
                                        state.ordersListEntity.orders![index],
                                    constraints: constraints,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(child: Text('جديدة')),
                        Center(child: Text('تامة')),
                        Center(child: Text('قيد المراجعة')),
                        Center(child: Text('مرفوضة')),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

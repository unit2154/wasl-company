import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/widgets/text_input.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/order_item_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.height,
    required this.width,
    required this.order,
    required this.cubitContext,
    this.isEdit = false,
  });

  final BuildContext cubitContext;
  final bool isEdit;
  final double height;
  final double width;
  final OrderItemEntity order;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: order.orderedQuantity.toString(),
    );
    return GestureDetector(
      onTap: isEdit
          ? () {
              showDialog(
                context: context,
                builder: (context) => Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text("تفاصيل الطلب"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("المنتج:  ${order.item!.name}"),
                        SizedBox(height: height * .01),
                        Text("الكمية"),
                        TextInput(
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                            maxHeight: MediaQuery.of(context).size.height,
                          ),
                          controller: controller,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("الغاء"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            return;
                          }
                          order.orderedQuantity = int.parse(controller.text);
                          cubitContext.read<OrdersCubit>().updateOrderItem();
                          Navigator.pop(context);
                        },
                        child: Text("تعديل"),
                      ),
                    ],
                  ),
                ),
              );
            }
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * .005),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: ListTile(
          leading: Image.asset(
            "assets/images/item.png",
            width: width * .13,
            height: height * .13,
          ),
          title: Text(
            order.item!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12 * (height / 650),
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            order.item!.price,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12 * (height / 650),
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            "الكمية : ${order.orderedQuantity}",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 10 * (height / 650),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

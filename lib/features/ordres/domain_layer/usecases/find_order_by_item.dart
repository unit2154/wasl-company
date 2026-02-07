import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';

class FindOrderByItemUseCase {
  Future<List<OrderEntity>> call({
    required List<OrderEntity> orders,
    required String itemName,
  }) async {
    List<OrderEntity> foundOrders = [];
    for (var order in orders) {
      for (var itemm in order.orderItems!) {
        if (itemm.item != null &&
            itemm.item!.name.toLowerCase().contains(itemName.toLowerCase())) {
          foundOrders.add(order);
        }
      }
    }
    return foundOrders;
  }
}

import 'dart:convert';

import '../lib/features/ordres/data_layer/models/sub_models/commission_model.dart';
import '../lib/features/ordres/data_layer/models/sub_models/customer_model.dart';
import '../lib/features/ordres/data_layer/models/sub_models/order_item_model.dart';

final customerJson = {
  "id": 16,
  "user_id": 17,
  "type": "end_market",
  "name": "Reilly Inc Market",
  "description":
      "Qui doloremque rerum nihil molestiae. Dolorum accusantium ut rerum et ut natus deleniti. Accusantium quibusdam ea nam sunt optio.",
  "address": "6272 Upton Isle",
  "city": "South Erich",
  "country": "United States of America",
  "phone": "58655275689",
  "email": "xgrant@collier.com",
  "commission_settlement_type": "per_order",
  "commission_rate": "7.28",
  "is_active": true,
  "created_at": "2026-01-25T11:58:52.000000Z",
  "updated_at": "2026-01-25T11:58:52.000000Z",
  "deleted_at": null,
};
final orderItemJson = [
  {
    "id": 126,
    "order_id": 35,
    "item_id": 12,
    "ordered_quantity": 9,
    "confirmed_quantity": 9,
    "unit_price": "404.36",
    "subtotal": "3639.24",
    "notes":
        "Aperiam reiciendis occaecati in quibusdam qui possimus id architecto.",
    "created_at": "2026-01-25T11:58:55.000000Z",
    "updated_at": "2026-01-25T11:58:55.000000Z",
    "item": {
      "id": 12,
      "customer_id": 1,
      "name": "non soluta dolorum",
      "description":
          "Voluptatem quo unde voluptatem. Asperiores consequatur ea sint rerum natus necessitatibus illo minus. Qui et quas quos tempore eius tenetur incidunt dolores. Ea minima odio eius ut. Similique similique modi illo.",
      "sku": "SKU-1356-ucc",
      "price": "404.36",
      "stock_quantity": 3,
      "availability_status": "discontinued",
      "images": null,
      "unit": "box",
      "min_order_quantity": "1.01",
      "is_active": true,
      "created_at": "2026-01-25T11:58:52.000000Z",
      "updated_at": "2026-01-25T11:58:52.000000Z",
      "deleted_at": null,
    },
  },
];
void main() {
  // final customer = CustomerModel.fromJson(customerJson);
  final orderItems = (orderItemJson as List<Map<String, dynamic>>)
      .map((e) => OrderItemModel.fromJson(e))
      .toList();

  // print(customer);
  print(orderItems);
  // print(orderItemJson[0]['item']['name']);
}

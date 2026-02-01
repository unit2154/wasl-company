import 'package:wasl_company_app/features/products/data_layer/models/product_model.dart';
import 'package:wasl_company_app/features/products/data_layer/models/sub_models/link_model.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/products_list_entity.dart';

class ProductsListModel extends ProductsListEntity {
  ProductsListModel({
    required super.currentPage,
    required List<ProductModel> super.products,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required List<LinkModel> super.links,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory ProductsListModel.fromJson(Map<String, dynamic> json) {
    return ProductsListModel(
      currentPage: json['current_page'],
      products: (json['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List).map((e) => LinkModel.fromJson(e)).toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

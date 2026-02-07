import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/get_user.dart';
import 'package:wasl_company_app/features/ordres/data_layer/data_sources/orders_data_source.dart';
import 'package:wasl_company_app/features/ordres/data_layer/repository/orders_repo_impl.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/repository/orders_repo.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/get_orders.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/update_order_state.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source_impl.dart';
import 'package:wasl_company_app/features/products/data_layer/repository/products_reop_impl.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/add_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/delete_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/get_products.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/update_product.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';
import 'package:hive/hive.dart';
import 'package:wasl_company_app/core/constants/app_constants.dart';
import 'package:wasl_company_app/core/network/api_consumer.dart';
import 'package:wasl_company_app/features/auth/data_layer/data_sources/auth_data_source.dart';
import 'package:wasl_company_app/features/auth/data_layer/data_sources/auth_data_source_impl.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/token_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/repo_impl/auth_repo_impl.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/get_token.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/logout.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/send_otp.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/verify_otp.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
part 'auth_dependencies.dart';
part 'products_dependencies.dart';
part 'orders_dependencies.dart';
part 'db_dependencies.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  await dbDependencies();
  await authDependencies();
  await productsDependencies();
  await ordersDependencies();
}

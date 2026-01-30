import 'package:get_it/get_it.dart';
import 'package:wasl_company_app/core/dependencies/auth_dependencies.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  await authDependencies();
}

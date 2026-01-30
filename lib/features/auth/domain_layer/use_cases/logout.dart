import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';

class Logout {
  final AuthRepo authRepo;
  Logout({required this.authRepo});
  Future<Either<Failure, void>> call() async {
    return await authRepo.logout();
  }
}

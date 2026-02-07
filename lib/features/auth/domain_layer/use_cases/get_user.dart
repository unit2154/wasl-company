import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';

class GetUser {
  final AuthRepo authRepo;
  GetUser({required this.authRepo});
  Future<Either<Failure, UserEntity>> call() {
    return authRepo.getUser();
  }
}

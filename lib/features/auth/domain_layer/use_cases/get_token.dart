import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';

class GetToken {
  final AuthRepo authRepo;
  GetToken({required this.authRepo});
  Future<Either<Failure, TokenEntity>> call() async {
    return await authRepo.getToken();
  }
}

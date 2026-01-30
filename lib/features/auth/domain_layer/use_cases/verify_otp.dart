import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';

class VerifyOtp {
  final AuthRepo authRepo;
  VerifyOtp({required this.authRepo});
  Future<Either<Failure, TokenEntity>> call(String phone, String otp) async {
    return await authRepo.verifyOtp(phone, otp);
  }
}

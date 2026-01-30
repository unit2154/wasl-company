import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';

class SendOtp {
  final AuthRepo authRepo;
  SendOtp({required this.authRepo});
  Future<Either<Failure, Message>> call(String phone) async {
    return await authRepo.sendOtp(phone);
  }
}

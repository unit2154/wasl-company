import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/token_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/get_token.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/logout.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/send_otp.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/verify_otp.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SendOtp send_otp;
  final VerifyOtp verify_otp;
  final Logout log_out;
  final GetToken get_token;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  AuthCubit({
    required this.send_otp,
    required this.verify_otp,
    required this.log_out,
    required this.get_token,
  }) : super(AuthInitial());

  Future<void> checkLogin() async {
    emit(CheckAuth());
    Either<Failure, TokenEntity> result = await get_token();
    result.fold(
      (failure) {
        emit(AuthInitial());
      },
      (token) {
        emit(VerifyOtpSuccess(token: token.token));
      },
    );
  }

  Future<void> sendOtp() async {
    emit(Loading());
    Either<Failure, Message> result = await send_otp(phoneController.text);
    result.fold(
      (failure) {
        emit(SendOtpError(message: failure.message));
      },
      (message) {
        emit(SendOtpSuccess(message: message));
      },
    );
  }

  Future<void> verifyOtp() async {
    emit(Loading());
    Either<Failure, TokenEntity> result = await verify_otp(
      phoneController.text,
      otpController.text,
    );
    result.fold(
      (failure) {
        emit(VerifyOtpError(message: failure.message));
      },
      (token) {
        emit(VerifyOtpSuccess(token: token.token));
      },
    );
  }

  Future<void> logout() async {
    emit(Loading());
    Either<Failure, void> result = await log_out();
    result.fold(
      (failure) {
        emit(LogoutError(message: failure.message));
      },
      (r) {
        emit(LogoutSuccess());
      },
    );
  }
}

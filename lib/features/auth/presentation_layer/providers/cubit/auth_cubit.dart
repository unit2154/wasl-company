import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/token_model.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/get_token.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/get_user.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/logout.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/send_otp.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/verify_otp.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SendOtp send_otp;
  final VerifyOtp verify_otp;
  final Logout log_out;
  final GetToken get_token;
  final GetUser get_user;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  AuthCubit({
    required this.send_otp,
    required this.verify_otp,
    required this.log_out,
    required this.get_token,
    required this.get_user,
  }) : super(AuthInitial());

  Future<void> checkLogin() async {
    emit(CheckAuth());
    Either<Failure, UserEntity> result = await get_user();
    result.fold(
      (failure) {
        emit(AuthInitial());
      },
      (user) async {
        emit(VerifyOtpSuccess(user: user));
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
    Either<Failure, UserEntity> result = await verify_otp(
      phoneController.text,
      otpController.text,
    );
    result.fold(
      (failure) {
        emit(VerifyOtpError(message: failure.message));
      },
      (user) {
        emit(VerifyOtpSuccess(user: user));
      },
    );
  }

  Future<bool> logout() async {
    Either<Failure, void> result = await log_out();
    result.fold(
      (failure) {
        emit(LogoutError(message: failure.message));
        return false;
      },
      (r) {
        emit(LogoutSuccess());
        return true;
      },
    );
    return false;
  }
}

import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/features/auth/data_layer/data_sources/auth_data_source.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<Failure, Message>> sendOtp(String phone) async {
    try {
      Message message = await authDataSource.sendOtp(phone);
      return Right(message);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOtp(
    String phone,
    String otp,
  ) async {
    try {
      UserEntity user = await authDataSource.verifyOtp(phone, otp);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authDataSource.logout();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      UserEntity user = await authDataSource.getUser();
      return Right(user);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeUser() async {
    try {
      await authDataSource.removeUser();
      return Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenEntity>> getToken() async {
    try {
      TokenEntity token = await authDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeToken() async {
    try {
      await authDataSource.removeToken();
      return Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}

part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class CheckAuth extends AuthState {}

final class Loading extends AuthState {}

final class SendOtpSuccess extends AuthState {
  final Message message;
  SendOtpSuccess({required this.message});
}

final class SendOtpError extends AuthState {
  final String message;
  SendOtpError({required this.message});
}

final class VerifyOtpSuccess extends AuthState {
  final UserEntity user;
  VerifyOtpSuccess({required this.user});
}

final class VerifyOtpError extends AuthState {
  final String message;
  VerifyOtpError({required this.message});
}

final class LogoutSuccess extends AuthState {}

final class LogoutError extends AuthState {
  final String message;
  LogoutError({required this.message});
}

final class GetUserLoading extends AuthState {}

final class GetUserSuccess extends AuthState {
  final UserEntity user;
  GetUserSuccess({required this.user});
}

final class GetUserError extends AuthState {
  final String message;
  GetUserError({required this.message});
}

final class RemoveUserLoading extends AuthState {}

final class RemoveUserSuccess extends AuthState {}

final class RemoveUserError extends AuthState {
  final String message;
  RemoveUserError({required this.message});
}

final class GetTokenLoading extends AuthState {}

final class GetTokenSuccess extends AuthState {
  final TokenEntity token;
  GetTokenSuccess({required this.token});
}

final class GetTokenError extends AuthState {
  final String message;
  GetTokenError({required this.message});
}

final class RemoveTokenLoading extends AuthState {}

final class RemoveTokenSuccess extends AuthState {}

final class RemoveTokenError extends AuthState {
  final String message;
  RemoveTokenError({required this.message});
}

final class CacheProfileLoading extends AuthState {}

final class CacheProfileSuccess extends AuthState {
  final ProfileModel profile;
  CacheProfileSuccess({required this.profile});
}

final class CacheProfileError extends AuthState {
  final String message;
  CacheProfileError({required this.message});
}

final class CacheTokenLoading extends AuthState {}

final class CacheTokenSuccess extends AuthState {
  final TokenModel token;
  CacheTokenSuccess({required this.token});
}

final class CacheTokenError extends AuthState {
  final String message;
  CacheTokenError({required this.message});
}

final class CacheUserLoading extends AuthState {}

final class CacheUserSuccess extends AuthState {
  final UserEntity user;
  CacheUserSuccess({required this.user});
}

final class CacheUserError extends AuthState {
  final String message;
  CacheUserError({required this.message});
}

final class GetProfileLoading extends AuthState {}

final class GetProfileSuccess extends AuthState {
  final ProfileModel profile;
  GetProfileSuccess({required this.profile});
}

final class GetProfileError extends AuthState {
  final String message;
  GetProfileError({required this.message});
}

final class RemoveProfileLoading extends AuthState {}

final class RemoveProfileSuccess extends AuthState {}

final class RemoveProfileError extends AuthState {
  final String message;
  RemoveProfileError({required this.message});
}

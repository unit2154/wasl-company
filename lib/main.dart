import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/database/hive_db.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/screens/send_otp.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/screens/verify_otp.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppLifecycleListener(
      onStateChange: (state) {
        print(state);
      },
    );
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..checkLogin(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: AppColors.primary),
          fontFamily: 'Almarai',
        ),
        home: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
              case SendOtpSuccess():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('تم إرسال رمز التحقق')));
              case SendOtpError():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              case VerifyOtpError():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              case LogoutSuccess():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('تم تسجيل الخروج')));
              case LogoutError():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              default:
            }
          },
          buildWhen: (previous, current) {
            return current is! LogoutError ||
                current is! VerifyOtpError ||
                current is! SendOtpError;
          },
          builder: (context, state) {
            return state is SendOtpSuccess || state is VerifyOtpError
                ? VerifyOtpScreen()
                : state is CheckAuth
                ? Scaffold(body: Center(child: CircularProgressIndicator()))
                : state is Loading
                ? Scaffold(body: Center(child: CircularProgressIndicator()))
                : state is VerifyOtpSuccess
                ? DashboardScreen()
                : const SendOtpScreen();
          },
        ),
      ),
    );
  }
}

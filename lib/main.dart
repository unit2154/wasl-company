import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/database/hive_db.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Almarai',
      ),
      home: BlocProvider(
        create: (context) => getIt<AuthCubit>()..checkLogin(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
              case SendOtpSuccess():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message.message)));
              case SendOtpError():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              case VerifyOtpSuccess():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.token)));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                  (route) => false,
                );
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
          builder: (context, state) {
            return state is SendOtpSuccess ||
                    state is VerifyOtpSuccess ||
                    state is VerifyOtpError ||
                    state is Loading
                ? VerifyOtpScreen()
                : state is CheckAuth
                ? Scaffold(body: Center(child: CircularProgressIndicator()))
                : SendOtpScreen();
          },
        ),
      ),
    );
  }
}

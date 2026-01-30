import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('التحقق من الرمز')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                "التحقق من الرمز",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: context.read<AuthCubit>().otpController,
                decoration: InputDecoration(
                  labelText: 'الرمز',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().verifyOtp();
                },
                child: context.read<AuthCubit>().state is Loading
                    ? const CircularProgressIndicator()
                    : Text('التحقق من الرمز'),
              ),
              context.read<AuthCubit>().state is VerifyOtpSuccess
                  ? ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                      },
                      child: Text('تسجيل الخروج'),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

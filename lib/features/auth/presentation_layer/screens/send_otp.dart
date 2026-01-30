import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('تسجيل الدخول')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                "تسجيل الدخول",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: context.read<AuthCubit>().phoneController,
                decoration: InputDecoration(
                  labelText: 'رقم الجوال',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().sendOtp();
                },
                child: context.read<AuthCubit>().state is Loading
                    ? CircularProgressIndicator()
                    : Text('تسجيل الدخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

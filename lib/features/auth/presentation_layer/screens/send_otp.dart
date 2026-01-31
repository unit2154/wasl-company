import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/core/widgets/submit_button.dart';
import 'package:wasl_company_app/core/widgets/text_input.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Column(
                  spacing: constraints.maxHeight * 0.028,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // logo
                    SizedBox(
                      height: constraints.maxWidth * 0.42,
                      width: constraints.maxWidth * 0.42,
                      child: Image.asset(AppImages.logo),
                    ),

                    // phone number
                    TextInput(
                      label: 'رقم الجوال',
                      prefixIcon: AppIcons.phone,
                      keyboardType: TextInputType.phone,
                      controller: context.read<AuthCubit>().phoneController,
                      constraints: constraints,
                    ),

                    // space
                    SizedBox(height: constraints.maxHeight * 0.048),

                    // send button
                    SubmitButton(
                      isLoading: context.watch<AuthCubit>().state is Loading,
                      constraints: constraints,
                      text: 'إرسال',
                      onPressed: () {
                        context.read<AuthCubit>().sendOtp();
                      },
                    ),

                    // register button
                    SubmitButton(
                      constraints: constraints,
                      text: 'تسجيل',
                      outline: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

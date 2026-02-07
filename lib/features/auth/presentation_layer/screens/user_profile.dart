import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/core/widgets/text_input.dart';
import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("الملف الشخصي")],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<Either<Failure, UserEntity>>(
                future: context.read<AuthCubit>().get_user(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserEntity? user = snapshot.data!.fold(
                      (l) => null,
                      (r) => r,
                    );
                    return ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Center(
                          child: Container(
                            height: constraints.maxWidth * 0.3,
                            width: constraints.maxWidth * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.cardBorder,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(AppImages.logo),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            const Text("اسم الشركة"),
                            TextInput(
                              constraints: constraints,
                              controller: TextEditingController(
                                text: user?.name,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('رقم الهاتف'),
                            TextInput(
                              controller: TextEditingController(
                                text: user?.phone,
                              ),
                              constraints: constraints,
                            ),
                            const SizedBox(height: 10),
                            const Text("البريد الالكتروني"),
                            TextInput(
                              controller: TextEditingController(
                                text: user?.email,
                              ),
                              constraints: constraints,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

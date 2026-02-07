import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/theme/cubit/theme_cubit.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/screens/user_profile.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var user = getIt<Box<UserModel>>().getAt(0);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.logo),
                ),
                const SizedBox(height: 10),
                Text(user!.name),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.person),
                const SizedBox(width: 10),
                const Text('حسابي الشخصي'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.notifications),
                const SizedBox(width: 10),
                const Text('الاشعارات'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.cardBorder),
          ListTile(
            title: Row(
              children: [
                SvgPicture.asset(AppIcons.deals),
                const SizedBox(width: 10),
                const Text('التعاملات'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              context.read<DashboardCubit>().changeIndex(4);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.location_on),
                const SizedBox(width: 10),
                const Text('فروع الشركة'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.dark_mode_outlined),
                const SizedBox(width: 10),
                const Text('الوضع الليلي'),
                Spacer(),
                BlocBuilder<ThemeCubit, ChangedThemeState>(
                  builder: (context, state) {
                    return Switch(
                      value:
                          context.read<ThemeCubit>().state.themeMode ==
                          ThemeMode.dark,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: AppColors.cardBorder),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.call),
                const SizedBox(width: 10),
                const Text('الدعم والتواصل'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.logout),
                const SizedBox(width: 10),
                const Text('تسجيل الخروج'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () async {
              await context.read<AuthCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}

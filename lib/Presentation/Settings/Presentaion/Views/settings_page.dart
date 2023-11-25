import '../../../../core/Widgets/app_shadow_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Colors/app_colors.dart';
import '../../../../core/Images/app_assets.dart';
import '../../../../core/Values/app_strings.dart';
import '../../../../core/Widgets/app_styles.dart';
import '../../../../glopal.dart';
import '../../../App/Presentaion/Manager/Theme/theme_cubit.dart';
import '../Manager/ShowPassword/show_password_cubit.dart';
import 'Widgets/build_listtile_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Global.storageService.getBoolain()
                ? AppColors.text
                : AppColors.text,
            shadows: iconListShadow,
          ),
        ),
        title: Text(
          AppConstants.settings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            shadows: titlwListShadow,
          ),
        ),
      ),
      body: BlocBuilder<ThemeCubit, bool>(
        builder: (context, stateTheme) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: BlocBuilder<ShowPasswordCubit, bool>(
                  builder: (context, state) => ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.primary300,
                          backgroundImage: AssetImage(Assets.imagesSquare),
                        ),
                      ),
                      Text(
                        'Osama Nabil',
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                      buildLisTile(name: 'Osama Nabil', iconData: Icons.person),
                      buildLisTile(
                          name: 'Osama854@gmail.com', iconData: Icons.email),
                      buildLisTile(
                        name: state ? '123456' : '********',
                        iconData: Icons.password,
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<ShowPasswordCubit>()
                                .toggleVisability();
                          },
                          icon: Icon(
                            state ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      SwitchListTile(
                        secondary: Icon(
                          stateTheme
                              ? Icons.mode_night_outlined
                              : Icons.mode_night,
                        ),
                        title: Text('Change Mode'),
                        activeColor: Colors.redAccent,
                        value: Global.storageService.getBoolain(),
                        onChanged: (value) {
                          Global.storageService
                              .setBoolain(AppConstants.isChange, value);
                          context.read<ThemeCubit>().toggleValue();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

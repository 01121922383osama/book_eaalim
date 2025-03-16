import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Presentation/App/Presentaion/Manager/Theme/theme_cubit.dart';
import 'Presentation/App/Presentaion/Manager/TypeIndex/app_index_toggle_cubit.dart';
import 'Presentation/Home/Presentation/Manager/IndexSliders/indexslider_cubit.dart';
import 'Presentation/Settings/Presentaion/Manager/ShowPassword/show_password_cubit.dart';
import 'Presentation/SplashPage/Presentation/Views/splash_page.dart';
import 'glopal.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => AppIndexToggleCubit()),
        BlocProvider(create: (context) => ShowPasswordCubit()),
        BlocProvider(create: (context) => IndexsliderCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BooksEaalim',
            theme: ThemeData(
              brightness: Global.storageService.getBoolain()
                  ? Brightness.dark
                  : Brightness.light,
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.redAccent,
                titleTextStyle: TextStyle(color: Colors.black),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}

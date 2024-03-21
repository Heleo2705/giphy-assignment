import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_store/infrastructure/injector/injector.dart';
import 'package:giphy_store/presentation/constants/theme/theme_cubit/theme.dart';
import 'package:giphy_store/presentation/constants/theme/theme_cubit/theme_cubit.dart';
import 'package:giphy_store/router/router.dart';

void main() {
  final injector=Injector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: state is ThemeInitial ? state.themeMode : ThemeMode.dark,
            // routerConfig: router.config(),
            routerConfig: router.config(),
          );
        },
      ),
    );
  }
}

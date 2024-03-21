part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  final ThemeMode themeMode;
  

  ThemeInitial({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

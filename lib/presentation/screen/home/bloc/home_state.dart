part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeTrendingLoaded extends HomeState {
  final String? error;
  final List<Data> list;

  HomeTrendingLoaded({this.error, required this.list});
  @override
  List<Object?> get props => [error];
}

class HomeSearchLoaded extends HomeState {
  final String? error;
  final List<Data> list;

  HomeSearchLoaded({this.error, required this.list});
  @override
  List<Object?> get props => [];
}

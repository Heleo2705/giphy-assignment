part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchGifEvent extends HomeEvent {
  final String query;

  SearchGifEvent({required this.query});
}

class FetchEvent extends HomeEvent {}

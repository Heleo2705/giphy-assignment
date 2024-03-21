import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giphy_store/infrastructure/network/repos/giphy_repo.dart';

import '../../../../infrastructure/injector/injector.dart';
import '../../../../infrastructure/network/models/giphy_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final giphyRepo = locator<GiphyRepo>();
  HomeBloc() : super(HomeInitial()) {
    on<FetchEvent>(_fetch);
    on<SearchGifEvent>(_search);
  }

  FutureOr<void> _fetch(FetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitial());
    final result = await giphyRepo.getTrendingGifs();
    result.fold(
      (l) => emit(HomeTrendingLoaded(error: l.toString(), list: [])),
      (r) => emit(HomeTrendingLoaded(list: r)),
    );
  }

  FutureOr<void> _search(SearchGifEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitial());
    final result = await giphyRepo.searchGif(query: event.query);
    result.fold(
      (l) => emit(HomeSearchLoaded(error: l.toString(), list: [])),
      (r) => emit(HomeSearchLoaded(list: r)),
    );
  }
}

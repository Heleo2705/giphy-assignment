import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giphy_store/infrastructure/network/models/giphy_response_model.dart';
import 'package:giphy_store/infrastructure/network/utils/api_urls.dart';

import '../../injector/injector.dart';
import '../utils/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class GiphyRepo {
  Future<Either<Exception, List<Data>>> getTrendingGifs();
  Future<Either<Exception, List<Data>>> searchGif({required String query});
}

class GiphyRepoImpl extends GiphyRepo {
  final apiHelper = locator<ApiHelper>();
  final apiKey = "CefzoTyjQLiGn2XUaiQA8AfGBldGysC9";
  @override
  Future<Either<Exception, List<Data>>> getTrendingGifs() async {
    try {
      final result = await apiHelper.get(
        path: ApiUrls.trending(apiKey: apiKey),
      );
      final json = result.data;
      final model = GiphyResponse.fromJson(json);
      return right(model.data ?? []);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Data>>> searchGif(
      {required String query}) async {
    try {
      final result = await apiHelper.get(
        path: ApiUrls.search(apiKey: apiKey, query: query),
      );
      final model = GiphyResponse.fromJson(result.data);
      return right(model.data ?? []);
    } on Exception catch (e) {
      return left(e);
    }
  }
}

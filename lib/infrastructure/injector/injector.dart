import 'package:get_it/get_it.dart';
import 'package:giphy_store/infrastructure/network/repos/giphy_repo.dart';

import '../network/utils/api_helper.dart';

final locator = GetIt.instance;

class Injector {
  Injector() {
    init();
  }

  void init() async {
    final apiHelper =
        locator.registerSingleton<ApiHelper>(ApiHelper("https://api.giphy"
            ".com/v1/gifs/"));
    initRepos();
  }

  Future<void> initRepos() async {
    final giphyRepo = locator.registerSingleton<GiphyRepo>(GiphyRepoImpl());
  }

  Future<void> initDao() async {}
}

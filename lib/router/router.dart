import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:giphy_store/router/router.gr.dart';
// import 'package:dummy/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,initial: true)
  ];
}

final router = AppRouter();

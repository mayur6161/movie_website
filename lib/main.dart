import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movietub/pages/homepage.dart';
import 'package:movietub/pages/movies.dart';
import 'package:movietub/widgets/colors.dart';
import 'package:movietub/widgets/names.dart';
import 'package:movietub/widgets/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
  WebView.platform = WebWebViewPlatform();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Names.title,
      theme: ThemeData(
        primarySwatch: appcolour,
      ),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.movie1Route: (_, __) => MaterialPage(child: MoviePage1()),
        MyRoutes.homePageRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.endgame: (_, __) => MaterialPage(child: EndGame()),
      }),
    );
  }
}

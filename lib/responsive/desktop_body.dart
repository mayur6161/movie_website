import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import '../pages/movies.dart';
import '../widgets/names.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(Names.appname),
        elevation: 0,
      ),
      body: SmoothScrollWeb(
        controller: _controller,
        child: ListView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  //==================================== movie 1 2 3
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                      ],
                    ),
                  ),
                  //======================================== movie 4 5 6
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                      ],
                    ),
                  ),
                  //=========================================== movie 7 8 9
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const MovieEmpty(),
                        ),
                      ],
                    ),
                  ),
                  //=========================================== movie 10 11 12
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const Movie1(),
                        ),
                        SizedBox(
                          width: width / 3,
                          child: const EndGameThumb(),
                        ),
                      ],
                    ),
                  ),
                  //=================================== Bottom Container
                  Container(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movietub/widgets/ad_url.dart';
import 'package:movietub/widgets/colors.dart';
import 'package:movietub/widgets/hover.dart';
import 'package:movietub/widgets/movie_url.dart';
import 'package:movietub/widgets/routes.dart';
import 'package:movietub/widgets/thumbnail_pictures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import '../widgets/names.dart';
import 'package:velocity_x/velocity_x.dart';

class MovieEmpty extends StatelessWidget {
  const MovieEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 10.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//========================================================= Thumbnail Movie 1

class Movie1 extends StatefulWidget {
  const Movie1({Key? key}) : super(key: key);

  @override
  State<Movie1> createState() => _Movie1State();
}

class _Movie1State extends State<Movie1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OnHoverButton(
        child: ElevatedButton(
          onPressed: () {
            _incrementCounter();
            switch (_counter % 2) {
              case 0:
                context.vxNav.push(Uri.parse(MyRoutes.movie1Route));

                //These lines also take too next page but there was with
                //urlname on site ex: website/moviepage1 so i preferred using
                //top option and is easy too
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MoviePage1()));
                break;
              case 1:
                final url = AdUrl.adurl1;
                openBrowserURL(url: url, inApp: true);
                break;
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.black12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 10.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      ThumbnailUrl.thumburlmovie1,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Text(
                  "Movie 1",
                  style: TextStyle(fontSize: 18, color: textcolour),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    }
  }
}

//------------------------------------------------- Page Movie 1
class MoviePage1 extends StatefulWidget {
  const MoviePage1({Key? key}) : super(key: key);

  @override
  State<MoviePage1> createState() => _MoviePage1State();
}

class _MoviePage1State extends State<MoviePage1> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(MovieUrl.movieurlmovie1),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(Names.appname),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: height / 2,
          width: width / 2,
          color: Colors.green,
          child: FlickVideoPlayer(
            flickManager: flickManager,
          ),
        ),
      ),
    );
  }
}

//===================================================== endgame

class EndGameThumb extends StatefulWidget {
  const EndGameThumb({Key? key}) : super(key: key);

  @override
  State<EndGameThumb> createState() => _EndGameThumbState();
}

class _EndGameThumbState extends State<EndGameThumb> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OnHoverButton(
        child: ElevatedButton(
          onPressed: () {
            _incrementCounter();
            switch (_counter % 2) {
              case 0:
                context.vxNav.push(Uri.parse(MyRoutes.endgame));

                //These lines also take too next page but there was with
                //urlname on site ex: website/moviepage1 so i preferred using
                //top option and is easy too
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MoviePage1()));
                break;
              case 1:
                final url = AdUrl.endgameadurl;
                openBrowserURL(url: url, inApp: true);
                break;
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.black12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 10.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      ThumbnailUrl.endgamethumbnailurl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Text(
                  "Movie 1",
                  style: TextStyle(fontSize: 18, color: textcolour),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    }
  }
}

//------------------------------------------------- Page Movie 1
class EndGame extends StatefulWidget {
  const EndGame({Key? key}) : super(key: key);

  @override
  State<EndGame> createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(MovieUrl.endgamemovieurl),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(Names.appname),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: height / 2,
          width: width / 2,
          color: Colors.green,
          child: FlickVideoPlayer(
            flickManager: flickManager,
          ),
        ),
      ),
    );
  }
}


//===============================================================

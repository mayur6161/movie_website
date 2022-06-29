import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import '../widgets/names.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          children: [],
        ),
      ),
    );
  }
}

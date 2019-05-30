import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuConta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation translate;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 480));
    translate = Tween(begin: 0.0, end: 200.0).animate(controller);
//      ..addListener(() {
//        setState(() {});
//      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 45, 152, 1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[menu()],
            ),
            Column(
              children: <Widget>[header(name: 'Gabriel'), content()],
            ),
          ],
        ),
      ),
    );
  }

  Widget header({@required name}) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 26.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('images/logo.svg',
                  height: 34.0, color: Colors.white),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.keyboard_arrow_down, color: Colors.white70)
            ],
          )
        ],
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, translate.value),
            child: Container(
                height: 420.0,
                child: GestureDetector(
                  onTap: _toogleContent,
                  onVerticalDragUpdate: _onVerticalDragUpdateContent,
                  onVerticalDragEnd: _onVerticalDragEndContent,
                  child: SizedBox.expand(
                    child: Container(
                      child: Transform.translate(
                        offset: Offset(0.0, translate.value),
                        child: PageView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(elevation: 0.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(elevation: 0.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _toogleContent() {
    controller.value != 0 ? controller.reverse() : controller.forward();
  }

  _onVerticalDragUpdateContent(value) {
    setState(() {
      controller.value += value.primaryDelta / 300.0;
    });
  }

  _onVerticalDragEndContent(value) {
    controller.value > 0.5 ? controller.forward() : controller.reverse();
  }

  Widget menu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          itemMenu(),
          itemMenu(),
          itemMenu(),
          itemMenu(),
          itemMenu(),
          itemMenu(),
          itemMenu(),
        ],
      ),
    );
  }

  Widget itemMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
          height: 100.0,
          width: 95.0,
          color: Colors.white12,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.code, color: Colors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cobrar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400)))
                ],
              )
            ],
          )),
    );
  }
}

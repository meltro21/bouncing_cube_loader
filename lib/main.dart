import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Color lightCyan = Color(0xffd6fff6);
  Color mediumTurquoise = Color(0xff4dccbd);
  Color russianViolet = Color(0xff110d31);
  Color frenchBlue = Color(0xff2374ab);
  Color lightCoral = Color(0xffff8484);

  var size = 80.0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _animation =
        Tween<double>(begin: 0.0, end: 6.28319).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward(from: 0.0);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    mediaHeight -= statusBarHeight;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: mediaHeight,
            width: mediaWidth,
            color: lightCoral,
            child: Center(
              child: Transform(
                transform: Matrix4.identity()
                  ..rotateX(0.785398)
                  ..rotateZ(_animation.value),
                child: Stack(children: [
                  //right
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateX(0.785398)
                      ..rotateZ(0.785398)
                      ..rotateX(-1.5708)
                      ..translate(0, -size, 0),
                    child: Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                          color: russianViolet,
                          border: Border.all(color: lightCoral, width: 1)),
                    ),
                  ),
                  //bottom
                  Container(
                    transform: Matrix4.identity()
                      ..rotateX(0.785398)
                      ..rotateZ(0.785398),
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                        color: russianViolet,
                        border: Border.all(color: lightCoral, width: 1)),
                  ),

                  //front
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateX(0.785398)
                      ..rotateZ(0.785398)
                      ..rotateY(-1.5708),
                    child: Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                          color: russianViolet,
                          border: Border.all(color: lightCoral, width: 1)),
                    ),
                  ),
                  //top
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateX(0.785398)
                      ..rotateZ(0.785398)
                      ..translate(0, 0, size),
                    child: Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                          color: russianViolet,
                          border: Border.all(color: lightCoral, width: 1)),
                    ),
                  ),
                  //left
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateX(0.785398)
                      ..rotateZ(0.785398)
                      ..rotateX(-1.5708)
                      ..translate(0, -size, size),
                    child: Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                          color: russianViolet,
                          border: Border.all(color: lightCoral, width: 1)),
                    ),
                  ),
                  //back

                  Transform(
                    transform: Matrix4.identity()
                      ..rotateX(0.785398)
                      ..rotateZ(0.785398)
                      ..rotateY(-1.5708)
                      ..translate(0, 0, -size),
                    child: Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                          color: russianViolet,
                          border: Border.all(color: lightCoral, width: 1)),
                    ),
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}

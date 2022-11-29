import 'package:flutter/material.dart';
import 'package:noteapp/Overview/overview.dart';
import 'package:noteapp/gen/assets.gen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const ROUTE_NAME = 'Splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    introSplash();
  }

  void introSplash() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushNamed(OverviewScreen.ROUTER_NAME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFBE9D),
      body: Container(
        child: Center(child: Assets.image.appIcon.svg()),
      ),
    );
  }
}

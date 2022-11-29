import 'package:flutter/material.dart';
import 'package:noteapp/CreateScreen/CreateNote.dart';
import 'package:noteapp/Overview/overview.dart';
import 'package:noteapp/splash.dart';

final Map<String, WidgetBuilder> router = {
  Splash.ROUTE_NAME: (context) => const Splash(),
  OverviewScreen.ROUTER_NAME: (context) => const OverviewScreen(),
  CreateNote.ROUTER_NAME: (context) => const CreateNote(),
};
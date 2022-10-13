import 'package:flutter/material.dart';
import 'package:todo_app/views/recycle_bin.dart';
import 'package:todo_app/views/tabs_screen.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );

      case TabScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );
   
       default:
       return null;
    }
  }
}

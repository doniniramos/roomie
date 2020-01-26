import 'package:flutter/material.dart';
import 'package:roomie_app/screens/search_roomie/search_roomie.dart';
import 'package:roomie_app/utils/in_app_notifier.dart';
import 'package:roomie_app/utils/roomie_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roomie',
      theme: roomieTheme,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SearchRoomieScreen(),
            InAppNotifier(
              isActive: ValueNotifier<bool>(false),
              content: ValueNotifier<String>('Fábio Barboza Filho'),
            ),
          ],
        ),
      ),
    );
  }
}

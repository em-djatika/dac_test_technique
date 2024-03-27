import 'package:flutter/material.dart';

class EScaffold extends StatelessWidget {
  const EScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.floatingActionButton,
      this.color,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation,
      this.drawer,
      this.keyy});
  final Widget body;
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final Color? color;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Key? keyy;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: keyy,
        
        backgroundColor:const Color.fromARGB(255, 251, 238, 255),
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

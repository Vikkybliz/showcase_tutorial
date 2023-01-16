import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ShowCaseWidget(
              builder: Builder(builder: ((context) => const Show()))),
        ));
  }
}

class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Showcase(
            key: _one,
            description: 'This is the leading icon',
            child: Icon(Icons.ac_unit)),
        title: Showcase(
            key: _two,
            description: 'This is the app title',
            child: const Text('ShowCase this widget')),
        actions: [
          Showcase(
              key: _three,
              description: 'This is the trailing',
              child: Icon(Icons.abc))
        ],
      ),
      floatingActionButton: Showcase(
        key: _four,
        description: 'This is a floating button',
        title: 'FLoating button',
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.access_alarm_sharp),
        ),
      ),
    );
  }
}

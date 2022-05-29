import 'package:becos_kitchen/component/expandable_fab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../component/menu_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Beco's Kitchen",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: const Text('メニュー一覧'),
        ),
        floatingActionButton: ExpandableFab(
          distance: 100.0,
          children: [
            ActionButton(onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
            ActionButton(onPressed: () {}, icon: const Icon(Icons.photo_album)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            children: [
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
            ],
          ),
        ));
  }
}

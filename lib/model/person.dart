import 'package:collection/collection.dart';

enum Person {
  baek(
    'baek',
    'assets/images/icon_baek.jpg',
    'UZEHS0qXu5YAe9cRGu6WFet7NSf1',
  ),
  akane(
    'akane',
    'assets/images/icon_akane.png',
    'b30gb2uK3EZi41DevxI4Ls0z9u33',
  );

  final String name;
  final String imagePath;
  final String uid;
  const Person(this.name, this.imagePath, this.uid);

  static Person getPersonFromUid(String uid) {
    return Person.values.firstWhereOrNull((element) => element.uid == uid) ??
        Person.baek;
  }
}

extension PersonExt on Person {
  bool get isBaek => this == Person.baek;
  bool get isAkane => this == Person.akane;
}

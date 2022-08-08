enum User {
  akane('akane', 'assets/images/icon_akane.png'),
  baek('baek', 'assets/images/icon_baek.jpg');

  final String name;
  final String imagePath;
  const User(this.name, this.imagePath);
}

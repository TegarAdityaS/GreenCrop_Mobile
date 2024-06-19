// lib/data/bottom_menu.dart
class BottomMenu {
  final int id;
  final String imagePath;

  BottomMenu(this.id, this.imagePath);
}

List<BottomMenu> bottomMenu = [
  BottomMenu(0, 'assets/icons/home.png'),
  BottomMenu(1, 'assets/icons/heart.png'),
  BottomMenu(2, 'assets/icons/sun.png'),
];
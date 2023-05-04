import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {super.key, this.currentIndex = 0, required this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '云通在线',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: '数联生活',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: '我的',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}

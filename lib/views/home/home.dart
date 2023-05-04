import 'package:flutter/material.dart';
import '../../components/tabbar/index.dart';
import 'chat/chat.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('云通数联chat'),
        ),
        body: ChatPage(),
        bottomNavigationBar: CustomBottomNavigationBar(
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, "/");
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, "/business");
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, "/school");
            }
          },
          currentIndex: 0,
        ));
  }
}

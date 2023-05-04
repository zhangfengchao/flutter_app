import 'package:flutter/material.dart';

import '../../components/tabbar/index.dart';

class DigitalPage extends StatelessWidget {
  const DigitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Business Page'),
        ),
        body: const Center(
          child: Text(
            'Index 1: Business',
          ),
        ),
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
          currentIndex: 1,
        ));
  }
}

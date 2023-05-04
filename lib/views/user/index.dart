import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../components/tabbar/index.dart';
import '../alert/index.dart';

class UserCenter extends StatelessWidget {
  const UserCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('School Page'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  child: const Text('显示隐私政策'),
                  onPressed: () async {
                    bool hasUserAccepted =
                        await showPrivacyPolicyDialog(context);
                    if (hasUserAccepted) {
                      print('用户已经同意隐私政策');
                    } else {
                      print('用户已经拒绝隐私政策');
                    }
                  }),
            ],
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
          currentIndex: 2,
        ));
  }
}

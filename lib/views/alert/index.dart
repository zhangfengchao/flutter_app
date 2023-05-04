import 'package:flutter/material.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('隐私政策'),
      // ignore: sized_box_for_whitespace
      content: Container(
        width: double.maxFinite,
        height: 300,
        child: const Text("啦啦啦"),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('同意'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        ElevatedButton(
          child: const Text('不同意'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}

Future<bool> showPrivacyPolicyDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const PrivacyPolicyDialog();
    },
  );
}

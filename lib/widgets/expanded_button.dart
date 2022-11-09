import 'package:flutter/material.dart';

typedef Action = Function();

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {super.key, required this.buttonName, required this.action});

  final String buttonName;
  final Action action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => action(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(15),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

enum DialogType {ok, delete}

class DialogBox extends StatelessWidget {
  const DialogBox({
    Key? key,
    required this.title,
    required this.content,
    this.type = DialogType.ok,
  }) : super(key: key);

  final String title;
  final String content;
  final DialogType type;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            'Hủy',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Confirm');
          },
          child: type == DialogType.ok
              ? const Text(
                  'Đồng ý',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : const Text(
                  'Xóa',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.title,
    this.shareContent,
    this.shareSubject,
    this.shareListFile,
  });

  final String title;
  final String? shareContent;
  final String? shareSubject;
  final List<XFile>? shareListFile;

  @override
  Widget build(BuildContext context) {
    if (shareContent != null || shareListFile != null) {
      return IconButton(
        onPressed: () {
          if (shareListFile == null || shareListFile!.isEmpty) {
            Share.share(shareContent!, subject: shareSubject ?? '');
          } else {
            Share.shareXFiles(shareListFile!, text: shareContent ?? '');
          }
        },
        icon: const Icon(Icons.share),
      );
    } else {
      return const SizedBox();
    }
  }
}

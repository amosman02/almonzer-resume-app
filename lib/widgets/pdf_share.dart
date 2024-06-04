import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:portfolio/constants/colors.dart' as constants;

class PDFShareWidget extends StatelessWidget {
  const PDFShareWidget({super.key});

  Future<void> _sharePdf() async {
    try {
      // Load PDF file from assets
      final ByteData bytes = await rootBundle
          .load('assets/pdfs/Software-Resume-Almonzer-Osman.pdf');
      final Uint8List list = bytes.buffer.asUint8List();

      // Get temporary directory
      final tempDir = await getTemporaryDirectory();
      final file =
          await File('${tempDir.path}/Software-Resume-Almonzer-Osman.pdf')
              .create();

      // Write PDF data to file
      await file.writeAsBytes(list);

      // Share the PDF file
      await Share.shareXFiles([XFile(file.path)], text: 'Check out my resume!');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, top: 10),
      child: Center(
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(constants.darkBlue),
            foregroundColor: WidgetStatePropertyAll<Color>(constants.bgColor),
          ),
          onPressed: _sharePdf,
          child: const Text('Share Resume',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

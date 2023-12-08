import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PdfUploadPage extends StatefulWidget {
  @override
  _PdfUploadPageState createState() => _PdfUploadPageState();
}

class _PdfUploadPageState extends State<PdfUploadPage> {
  PDFDocument? _pdfDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Upload Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickPDF,
              child: Text('Pick a PDF'),
            ),
            SizedBox(height: 20),
            if (_pdfDocument != null)
              Container(
                height: 300,
                child: PDFViewer(
                  document: _pdfDocument!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final File file = File(result.files.single.path!);
      final PDFDocument document = await PDFDocument.fromFile(file);

      setState(() {
        _pdfDocument = document;
      });
    }
  }
}

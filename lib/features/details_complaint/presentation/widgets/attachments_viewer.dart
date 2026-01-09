import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';


import 'package:http/http.dart' as http;


class AttachmentsViewer extends StatelessWidget {
  final List<String> attachments;

  const AttachmentsViewer({super.key, required this.attachments});

  bool _isImage(String p) {
    p = p.toLowerCase();
    return p.endsWith('.jpg') ||
        p.endsWith('.jpeg') ||
        p.endsWith('.png') ||
        p.endsWith('.gif') ||
        p.endsWith('.webp');
  }

  bool _isPdf(String p) {
    return p.toLowerCase().endsWith('.pdf');
  }

  bool _isRemote(String p) {
    return p.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    final imagePaths = attachments.where((e) => _isImage(e)).toList();
    final filePaths = attachments.where((e) => _isPdf(e)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imagePaths.isNotEmpty)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: imagePaths.map((path) {
              final isNet = _isRemote(path);

              final img = isNet
                  ? Image.network(
                      path,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(path),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    );

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => _FullImageView(imagePath: path),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: img,
                ),
              );
            }).toList(),
          ),

        if (imagePaths.isNotEmpty) const SizedBox(height: 15),

        if (filePaths.isNotEmpty)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: filePaths.map((path) {
              final fileName = path.split('/').last;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PdfViewerPage(path: path),
                    ),
                  );
                },
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.picture_as_pdf, color: Colors.white),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          fileName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class _FullImageView extends StatelessWidget {
  final String imagePath;
  const _FullImageView({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final isRemote =
        imagePath.startsWith('http') || imagePath.startsWith('https');
    final image = isRemote
        ? Image.network(imagePath)
        : Image.file(File(imagePath));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(context), 
              child: Center(child: image),
            ),
          ),

          
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PdfViewerPage extends StatefulWidget {
  final String path;
  const PdfViewerPage({super.key, required this.path});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    _preparePdf();
  }

  Future<void> _preparePdf() async {
    if (widget.path.startsWith('http')) {
      final response = await http.get(Uri.parse(widget.path));
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/${widget.path.split('/').last}');
      await file.writeAsBytes(response.bodyBytes);
      setState(() => localPath = file.path);
    } else {
      setState(() => localPath = widget.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (localPath == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.close_rounded, size: 30, color: Colors.black),
            ),
          ),
        ],
      ),
      body: PDFView(filePath: localPath),
    );
  }
}





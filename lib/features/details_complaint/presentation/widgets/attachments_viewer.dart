import 'dart:io';

import 'package:complaints_application/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:http/http.dart' as http;

// class AttachmentsViewer extends StatelessWidget {
//   final List<String> attachments;

//   const AttachmentsViewer({
//     super.key,
//     required this.attachments,
//   });

//   bool _isImage(String path) {
//     final ext = path.toLowerCase();
//     return ext.endsWith(".jpg") ||
//         ext.endsWith(".jpeg") ||
//         ext.endsWith(".png") ||
//         ext.endsWith(".gif");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final imagePaths = attachments.where((e) => _isImage(e)).toList();
//     final filePaths = attachments.where((e) => !_isImage(e)).toList();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ---------- الصور ----------
//         if (imagePaths.isNotEmpty)
//           Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             children: imagePaths.map((path) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => _FullImageView(imagePath: path),
//                     ),
//                   );
//                 },
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.file(
//                     File(path),
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//         SizedBox(height: 15),

//         // ---------- الملفات ----------
//         if (filePaths.isNotEmpty)
//           Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             children: filePaths.map((path) {
//               final fileName = path.split('/').last;

//               return InkWell(
//                 onTap: () => OpenFilex.open(path),
//                 child: Container(
//                   width: 120,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.12),
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.white24),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.insert_drive_file, color: Colors.white),
//                       SizedBox(width: 6),
//                       Expanded(
//                         child: Text(
//                           fileName,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }
// }

// class _FullImageView extends StatelessWidget {
//   final String imagePath;
//   const _FullImageView({required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: GestureDetector(
//         onTap: () => Navigator.pop(context),
//         child: Center(
//           child: Image.file(File(imagePath)),
//         ),
//       ),
//     );
//   }
// }

class AttachmentsViewer extends StatelessWidget {
  final List<String> attachments; // remote URLs or local paths

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
    final filePaths = attachments.where((e) => !_isImage(e)).toList();

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
                onTap: () async {
                  InkWell(
                    onTap: () {
                      NativeFileOpener.openPdf(fileName);
                    },
                    child: Text('فتح PDF'),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => FullPdfView(pdfPath: path,),
                  //   ),
                  // );
                  // try {
                  //   await OpenFilex.open(path);
                  // } catch (e) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //      SnackBar(
                  //       backgroundColor: Colors.redAccent,
                  //       content: Text('لا يمكن فتح الملف',style: AppTextStyles.smallBeigeStyle,)),
                  //   );
                  // }
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
          // الصورة
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(context), // كبسة على الشاشة بتسكر
              child: Center(child: image),
            ),
          ),

          // زر الإغلاق العلوي
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

class NativeFileOpener {
  static const _channel = MethodChannel('file_opener');

  static Future<void> openPdf(String url) async {
    try {
      await _channel.invokeMethod('openPdf', {'url': url});
    } on PlatformException catch (e) {
      throw 'Failed to open pdf: ${e.message}';
    }
  }
}

// class FullPdfView extends StatefulWidget {
//   final String pdfPath; 
//   const FullPdfView({super.key, required this.pdfPath});

//   @override
//   State<FullPdfView> createState() => _FullPdfViewState();
// }

// class _FullPdfViewState extends State<FullPdfView> {
//   String? localPath;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _preparePdf();
//   }

//   Future<void> _preparePdf() async {
//   try {
//     if (widget.pdfPath.startsWith('http')) {
     
//       final response = await http.get(Uri.parse(widget.pdfPath));
//       final tempDir = Directory.systemTemp; 
//       final file = File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.pdf');
//       await file.writeAsBytes(response.bodyBytes);
//       localPath = file.path;
//     } else {
      
//       localPath = widget.pdfPath;
//     }
//   } catch (e) {
   
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('فشل تحميل الملف: $e')),
//     );
//     localPath = null;
//   } finally {
//     if (mounted) setState(() => isLoading = false);
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           if (isLoading)
//             const Center(child: CircularProgressIndicator())
//           else
//             Positioned.fill(
//               child: PDFView(
//                 filePath: localPath,
//                 enableSwipe: true,
//                 swipeHorizontal: true,
//                 autoSpacing: true,
//                 pageFling: true,
//               ),
//             ),
          
//           Positioned(
//             top: 40,
//             right: 20,
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: const BoxDecoration(
//                   color: Colors.black54,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.close, color: Colors.white, size: 28),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:complaints_application/core/constants/layout/app_space.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../bloc/edit_complaint_bloc.dart';
import '../bloc/edit_complaint_event.dart';

Widget buildEditFileSelector(
    BuildContext context, List<File> attachments) {
      final parentContext = context;
 return Column(
    children: [
      Padding(
        padding: AppPadding.onlyRightMedium,
        child: Container(
          height: SizeConfig.h(51.8),
          width: SizeConfig.w(320),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.4)),
            borderRadius: AppRadius.circularMedium,
            color: Colors.white.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Attach files', style: AppTextStyles.smallBeigeStyle),

              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors.beige,
                    context: parentContext,
                    builder: (context) {
                      return SafeArea(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.image,
                                  color: AppColors.oliveGreen,
                                ),
                                title: Text(
                                  'pick an image',
                                  style: AppTextStyles.smallOliveGreenStyle,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  pickImageGallery(parentContext);
                                },
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.file_present,
                                  color: AppColors.oliveGreen,
                                ),
                                title: Text(
                                  'pick a file',
                                  style: AppTextStyles.smallOliveGreenStyle,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  pickPdf(parentContext);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.oliveGreen,
                  size: SizeConfig.h(25),
                ),
              ),
            ],
          ),
        ),
      ),
      AppSpaces.verticalSmall,
      if (attachments.isNotEmpty)
        SizedBox(
          height: SizeConfig.h(80),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: attachments.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) => Stack(
              children: [
                GestureDetector(
                  onTap: () { OpenFilex.open(attachments[i].path);
                 },
                  child: Container(
                    width: SizeConfig.w(100),
                    height: SizeConfig.h(100),
                    color: Colors.grey.shade200,
                    child: attachments[i].path.toLowerCase().endsWith('.pdf')
                        ? Icon(Icons.picture_as_pdf, color: Colors.redAccent)
                        //  Center(child: Text(attachments[i].path,style: TextStyle(color: Colors.black,fontSize: 10.5)))
                        : Image.file(attachments[i], fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: SizeConfig.h(4),
                  left: SizeConfig.h(4),
                  child: GestureDetector(
                    onTap: () => context.read<EditComplaintBloc>().add(
                      RemoveAttachmentEvent(i),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 9,
                      child: Icon(Icons.close, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ],
  );
}


Future<void> pickImageGallery(BuildContext context) async {
  final picker = ImagePicker();
  final xs = await picker.pickMultiImage(imageQuality: 70);

  if (xs.isNotEmpty) {
    for (var e in xs) {
      if (!context.mounted) return;
      context.read<EditComplaintBloc>().add(AddAttachmentEvent(File(e.path)));
    }
  }
}

Future<void> pickPdf(BuildContext context) async {
  final res = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    allowedExtensions: ['pdf', 'doc', 'docx'],
    type: FileType.custom,
  );

  if (res != null && res.files.first.path != null) {
    if (!context.mounted) return;
    context.read<EditComplaintBloc>().add(
      AddAttachmentEvent(File(res.files.first.path!)),
    );
  }
}



  // return Column(
  //   children: [
  //     IconButton(
  //       icon: const Icon(Icons.add),
  //       onPressed: () async {
  //         final picker = ImagePicker();
  //         final images = await picker.pickMultiImage();
  //         for (var img in images) {
  //           context
  //               .read<EditComplaintBloc>()
  //               .add(AddAttachmentEvent(File(img.path)));
  //         }
  //       },
  //     ),
  //     SizedBox(
  //       height: 80,
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: attachments.length,
  //         itemBuilder: (_, i) => Stack(
  //           children: [
  //             Image.file(attachments[i]),
  //             Positioned(
  //               top: 0,
  //               right: 0,
  //               child: GestureDetector(
  //                 onTap: () => context
  //                     .read<EditComplaintBloc>()
  //                     .add(RemoveAttachmentEvent(i)),
  //                 child: const Icon(Icons.close, color: Colors.red),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ],
  // );
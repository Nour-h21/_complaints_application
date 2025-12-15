import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../bloc/add_complaint_bloc.dart';
import '../bloc/add_complaint_event.dart';

Widget buildFileSelector(BuildContext context, List<File> attachments) {
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
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors.beige,
                    context: parentContext,
                    builder: (context) {
                      return SafeArea(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.image,
                                  color: AppColors.oliveGreen,
                                ),
                                title: Text(
                                  'اختر صور',
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
                                  'اختر ملفات',
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
                icon: Icon(Icons.add, color: AppColors.yellow, size: SizeConfig.h(25)),
              ),
              Text('إرفاق ملفات', style: AppTextStyles.smallWhite70Style),
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
                  onTap: () => OpenFilex.open(attachments[i].path),
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
                    onTap: () => context.read<AddComplaintBloc>().add(
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
      context.read<AddComplaintBloc>().add(AddAttachmentEvent(File(e.path)));
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
    context.read<AddComplaintBloc>().add(
      AddAttachmentEvent(File(res.files.first.path!)),
    );
  }
}
import 'dart:io';
import 'dart:ui';

import 'package:complaints_application/core/constants/strings/texts.dart';
import 'package:complaints_application/core/constants/urls/assets_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/shared/widgets/gradient_elevated_button.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../bloc/add_complaint_bloc.dart';
import '../bloc/add_complaint_event.dart';
import '../bloc/add_complaint_state.dart';
import '../widgets/build_file_selector.dart';
import '../widgets/dropDown.dart';
import '../widgets/textFormField.dart';

// class AddComplaint extends StatefulWidget {
//   const AddComplaint({super.key});

//   @override
//   State<AddComplaint> createState() => _AddComplaint();
// }

// class _AddComplaint extends State<AddComplaint> {
//   List<String> pickedImages = [];
//   List<String> pickedDocuments = [];

//     final formKey = GlobalKey<FormState>();

//   TextEditingController description = TextEditingController();
//   TextEditingController location = TextEditingController();

//   List<Map<String, String>> types = [];
//   List<Map<String, String>> sections = [];

//   @override
//   void initState() {
//     super.initState();
//     types = [
//       {"id": "1", "name": "خدمة عامة"},
//       {"id": "2", "name": "بنية تحتية"},
//       {"id": "3", "name": "حوادث"},
//       {"id": "4", "name": "ملاحظة"},
//     ];
//     sections = [
//       {"id": "1", "name": "قسم أول"},
//       {"id": "2", "name": "قسم ثاني"},
//       {"id": "3", "name": "قسم ثالث"},
//     ];
//   }

//   Future pickImages() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//         allowMultiple: true,
//       );
//       if (result != null) {
//         setState(() {
//           pickedImages.addAll(result.paths.whereType<String>());
//         });
//       }
//     } catch (e) {
//       debugPrint("Error picking images: $e");
//     }
//   }

//   Future pickDocuments() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'doc', 'docx'],
//       );

//       if (result != null) {
//         setState(() {
//           pickedDocuments.addAll(result.paths.whereType<String>());
//         });
//       }
//     } catch (e) {
//       debugPrint("Error picking documents: $e");
//     }
//   }

//   void openFile(String path) async {
//     try {
//       await OpenFilex.open(path);
//     } catch (e) {
//       debugPrint("Cannot open file: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(

//         children: [
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   AppColors.armyGreen,
//                   AppColors.armyGreen2,
//                   AppColors.oliveGreen2,
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),

//           Padding(
//             padding:  EdgeInsets.only(top: SizeConfig.h(50)),
//             child: Stack(
//               children: [
//                 Center(
//                   child: ClipRRect(
//                     borderRadius: AppRadius.circularMedium,
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(
//                         sigmaX: SizeConfig.w(20),
//                         sigmaY: SizeConfig.h(20),
//                       ),
//                       child: Container(
//                         width: SizeConfig.w(360),
//                         padding: AppPadding.allSmall,
//                         decoration: BoxDecoration(
//                           color: AppColors.whiteWithOpacity15,
//                           borderRadius: AppRadius.circularMedium,
//                           border: Border.all(
//                             color: AppColors.whiteWithOpacity3,
//                             width: SizeConfig.w(1.5),
//                           ),
//                         ),
//                         child: SingleChildScrollView(
//                           child: Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: AppPadding.onlyRightMedium,
//                                   child: Text(
//                                     AppTexts.addComplaint,
//                                     style: AppTextStyles.bigwhiteStyle,
//                                   ),
//                                 ),
//                                 AppSpaces.verticalSmall,
//                                 Text(
//                                   "قم بتعبئة جميع الحقول ليتم تقديم الشكوى بنجاح",
//                                   style: TextStyle(color: AppColors.primaryColor),
//                                 ),
//                                 AppSpaces.verticalMedium,
//                                 Padding(
//                                   padding: AppPadding.onlyLeftLarge,
//                                   child: DropdownButtonField(
//                                     label: 'نوع الشكوى',
//                                     options: types
//                                         .map((e) => e['name']!)
//                                         .toList(),
//                                     onChanged: (String? value) {},
//                                     validator: (v) => v == null
//                                         ? 'الرجاء إختيار نوع الشكوى'
//                                         : null,
//                                   ),
//                                 ),
//                                 AppSpaces.verticalSmall,
//                                 Padding(
//                                   padding: AppPadding.onlyRightMedium,
//                                   child: DropdownButtonField(
//                                     label: 'قسم الشكوى',
//                                     options: sections
//                                         .map((e) => e['name']!)
//                                         .toList(),
//                                     onChanged: (String? value) {},
//                                     validator: (v) =>
//                                         v == null ? 'الرجاء إختيار القسم' : null,
//                                   ),
//                                 ),
//                                 AppSpaces.verticalMedium,
//                                 CustomTextFormField(
//                                   controller: description,
//                                   label: 'وصف المشكلة',
//                                   width: SizeConfig.w(320),
//                                   maxLines: 4,
//                                 ),
//                                 AppSpaces.verticalMedium,
//                                 Padding(
//                                   padding: AppPadding.onlyLeftLarge,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Colors.white.withOpacity(0.4),
//                                       ),
//                                       borderRadius: AppRadius.circularVeryMedium,
//                                       color: Colors.white.withOpacity(0.1),
//                                     ),
//                                     child: CustomTextFormField(
//                                       controller: location,
//                                       label: 'موقع الشكوى',
//                                       width: SizeConfig.w(320),
//                                     ),
//                                   ),
//                                 ),
//                                 AppSpaces.verticalSmall,

//                                 Padding(
//                                   padding: AppPadding.onlyRightMedium,
//                                   child: Container(
//                                     height: SizeConfig.h(51.8),
//                                     width: SizeConfig.w(320),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Colors.white.withOpacity(0.4),
//                                       ),
//                                       borderRadius: BorderRadius.circular(30),
//                                       color: Colors.white.withOpacity(0.1),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         IconButton(
//                                           onPressed: () {
//                                             showModalBottomSheet(
//                                               backgroundColor: AppColors.beige,
//                                               context: context,
//                                               builder: (context) {
//                                                 return SafeArea(
//                                                   child: Directionality(
//                                                     textDirection: TextDirection.rtl,
//                                                     child: Wrap(
//                                                       children: [
//                                                         ListTile(
//                                                           leading:  Icon(
//                                                             Icons.image,
//                                                            color: AppColors.oliveGreen,
//                                                           ),
//                                                           title:  Text(
//                                                             'اختر صور',
//                                                             style: AppTextStyles.smallOliveGreenStyle,
//                                                           ),
//                                                           onTap: () {
//                                                             Navigator.pop(context);
//                                                             pickImages();
//                                                           },
//                                                         ),
//                                                         ListTile(
//                                                           leading:  Icon(
//                                                             Icons.file_present,
//                                                              color: AppColors.oliveGreen,
//                                                           ),
//                                                           title:  Text(
//                                                             'اختر ملفات',
//                                                              style: AppTextStyles.smallOliveGreenStyle,
//                                                           ),
//                                                           onTap: () {
//                                                             Navigator.pop(context);
//                                                             pickDocuments();
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 );
//                                               },
//                                             );
//                                           },
//                                           icon: Icon(
//                                             Icons.add,
//                                             color: AppColors.yellow,
//                                             size: 23,
//                                           ),
//                                         ),
//                                         Text(
//                                           'إرفاق ملفات',
//                                           style: AppTextStyles.smallWhite70Style,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 AppSpaces.verticalSmall,
//                                 if (pickedImages.isNotEmpty)
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 10,
//                                       horizontal: 12,
//                                     ),
//                                     child: GridView.builder(
//                                       shrinkWrap: true,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       gridDelegate:
//                                           const SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 4,
//                                             crossAxisSpacing: 8,
//                                             mainAxisSpacing: 8,
//                                           ),
//                                       itemCount: pickedImages.length,
//                                       itemBuilder: (context, index) {
//                                         final img = pickedImages[index];
//                                         return Stack(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () => openFile(img),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 child: Image.file(
//                                                   File(img),
//                                                   width: double.infinity,
//                                                   height: double.infinity,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               top: 0,
//                                               right: 0,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     pickedImages.removeAt(index);
//                                                   });
//                                                 },
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.red,
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: const Icon(
//                                                     Icons.close,
//                                                     size: 18,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 if (pickedDocuments.isNotEmpty)
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 12,
//                                     ),
//                                     child: Column(
//                                       children: pickedDocuments.map((doc) {
//                                         return Stack(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () => openFile(doc),
//                                               child: Container(
//                                                 margin: const EdgeInsets.only(
//                                                   bottom: 5,
//                                                 ),
//                                                 padding: const EdgeInsets.all(8),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                   color: Colors.grey.shade200,
//                                                 ),
//                                                 child: Row(
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.file_present,
//                                                       size: 20,
//                                                       color: Colors.blue,
//                                                     ),
//                                                     const SizedBox(width: 6),
//                                                     Expanded(
//                                                       child: Text(
//                                                         doc.split("/").last,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               top: 0,
//                                               right: 0,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     pickedDocuments.remove(doc);
//                                                   });
//                                                 },
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.red,
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: const Icon(
//                                                     Icons.close,
//                                                     size: 18,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       }).toList(),
//                                     ),
//                                   ),
//                                 AppSpaces.verticalVeryMedium,
//                                 GradientElevatedButton(
//                                   text: 'إرسال الشكوى' ,
//                                    onPressed: () {  },),
//                                 // Container(
//                                 //   width: double.infinity,
//                                 //   padding: AppPadding.symmetricVerticSmall,
//                                 //   decoration: BoxDecoration(
//                                 //     borderRadius: AppRadius.circularSmall,
//                                 //     gradient: LinearGradient(
//                                 //       colors: [
//                                 //         AppColors.yellow,
//                                 //         AppColors.greenWithShade,
//                                 //       ],
//                                 //     ),
//                                 //   ),
//                                 //   alignment: Alignment.center,
//                                 //   child: Text(
//                                 //     'إرسال الشكوى',
//                                 //     style: AppTextStyles.medBlackStyle,
//                                 //   ),
//                                 // ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: SizeConfig.h(280),
//                   top: SizeConfig.h(15),
//                   child: Container(
//                     height: SizeConfig.h(73),
//                     width: SizeConfig.w(120),
//                     decoration: BoxDecoration(
//                       image: DecorationImage(image: AssetImage(AppAssets.logo)),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// presentation/pages/add_complaint_page.dart

// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../presentation/bloc/add_complaint_bloc.dart';
// import '../../presentation/bloc/add_complaint_state.dart';

// class AddComplaint extends StatefulWidget {
//   const AddComplaint({super.key});

//   @override
//   State<AddComplaint> createState() => _AddComplaint();
// }

// class _AddComplaint extends State<AddComplaint> {
//   List<String> pickedImages = [];
//   List<String> pickedDocuments = [];

//   final formKey = GlobalKey<FormState>();
//   TextEditingController description = TextEditingController();
//   TextEditingController location = TextEditingController();

//   List<Map<String, dynamic>> types = [];
//   List<Map<String, dynamic>> sections = [];

//   String? selectedTypeName;
//   String? selectedSectionName;

//   @override
//   void initState() {
//     super.initState();
//     types = [
//       {"id": 1, "name": "خدمة عامة"},
//       {"id": 2, "name": "بنية تحتية"},
//       {"id": 3, "name": "حوادث"},
//       {"id": 4, "name": "ملاحظة"},
//     ];
//     sections = [
//       {"id": 1, "name": "قسم أول"},
//       {"id": 2, "name": "قسم ثاني"},
//       {"id": 3, "name": "قسم ثالث"},
//     ];
//   }

//   // use FilePicker for images (robust on desktop and mobile)
//   Future pickImages() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//         allowMultiple: true,
//       );
//       if (result != null) {
//         setState(() {
//           pickedImages.addAll(result.paths.whereType<String>());
//         });
//       }
//     } catch (e) {
//       debugPrint("Error picking images: $e");
//     }
//   }

//   Future pickDocuments() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'doc', 'docx'],
//       );
//       if (result != null) {
//         setState(() {
//           pickedDocuments.addAll(result.paths.whereType<String>());
//         });
//       }
//     } catch (e) {
//       debugPrint("Error picking documents: $e");
//     }
//   }

//   void openFile(String path) async {
//     try {
//       await OpenFilex.open(path);
//     } catch (e) {
//       debugPrint("Cannot open file: $e");
//     }
//   }

//   // helper to get id from name
//  int _typeIdForName(String name) {
//   final item = types.firstWhere((e) => e['name'] == name);
//   return item['id'] as int ;
// }

// int _sectionIdForName(String name) {
//   final item = sections.firstWhere((e) => e['name'] == name);
//   return item['id'] as int;
// }

//   void _onSubmit() {
//     if (!formKey.currentState!.validate()) return;

//     final complaintTypeId = selectedTypeName != null ? _typeIdForName(selectedTypeName!) : types.first['id']!;
//     final departmentId = selectedSectionName != null ? _sectionIdForName(selectedSectionName!) : sections.first['id']!;

//     // convert picked paths to File objects
//     final attachments = <File>[];
//     for (final p in [...pickedImages, ...pickedDocuments]) {
//       attachments.add(File(p));
//     }

//     final params = AddComplaintParams(
//       complaintTypeId: complaintTypeId.toString(),
//       complaintDepartmentId: departmentId.toString(),
//       problemDescription: description.text.trim(),
//       location: location.text.trim(),
//       attachments: attachments,
//     );

//     // dispatch event to bloc
//     context.read<AddComplaintBloc>().add(SubmitComplaintEvent(params));
//   }

//   @override
//   Widget build(BuildContext context) {// We will use BlocConsumer so we can show success/error feedback while keeping UI intact
//     return BlocProvider(
//       create: (_) => getIt<AddComplaintBloc>(),
//       child: BlocConsumer<AddComplaintBloc, AddComplaintState>(
//         listener: (context, state) {
//           if (state is AddComplaintLoading) {
//             // show snack or loader if you want — keep design unchanged
//             // E.g. show a simple SnackBar:
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('جاري إرسال الشكوى...')),
//             );
//           } else if (state is AddComplaintSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.response.message)),
//             );
//             // optionally: clear the form or navigate to details page
//             // if you want to open details page, you have attachments urls in state.response.data.attachments
//           } else if (state is AddComplaintFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('خطأ: ${state.message}')),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             body: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         AppColors.armyGreen,
//                         AppColors.armyGreen2,
//                         AppColors.oliveGreen2,
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: SizeConfig.h(50)),
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: ClipRRect(
//                           borderRadius: AppRadius.circularMedium,
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(
//                               sigmaX: SizeConfig.w(20),
//                               sigmaY: SizeConfig.h(20),
//                             ),
//                             child: Container(
//                               width: SizeConfig.w(360),
//                               padding: AppPadding.allSmall,
//                               decoration: BoxDecoration(
//                                 color: AppColors.whiteWithOpacity15,
//                                 borderRadius: AppRadius.circularMedium,
//                                 border: Border.all(
//                                   color: AppColors.whiteWithOpacity3,
//                                   width: SizeConfig.w(1.5),
//                                 ),
//                               ),
//                               child: SingleChildScrollView(
//                                 child: Directionality(
//                                   textDirection: TextDirection.rtl,
//                                   child: Form(
//                                     key: formKey,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: AppPadding.onlyRightMedium,
//                                           child: Text(
//                                             AppTexts.addComplaint,
//                                             style: AppTextStyles.bigwhiteStyle,
//                                           ),
//                                         ),
//                                         AppSpaces.verticalSmall,Text(
//                                           "قم بتعبئة جميع الحقول ليتم تقديم الشكوى بنجاح",
//                                           style: TextStyle(color: AppColors.primaryColor),
//                                         ),
//                                         AppSpaces.verticalMedium,
//                                         Padding(
//                                           padding: AppPadding.onlyLeftLarge,
//                                           child: DropdownButtonField(
//                                             label: 'نوع الشكوى',
//                                             options: types.map((e) => e['name']! as String).toList(),
//                                             onChanged: (String? value) {
//                                               setState(() {
//                                                 selectedTypeName = value;
//                                               });
//                                             },
//                                             validator: (v) => v == null ? 'الرجاء إختيار نوع الشكوى' : null,
//                                           ),
//                                         ),
//                                         AppSpaces.verticalSmall,
//                                         Padding(
//                                           padding: AppPadding.onlyRightMedium,
//                                           child: DropdownButtonField(
//                                             label: 'قسم الشكوى',
//                                             options: sections.map((e) => e['name']! as String).toList(),
//                                             onChanged: (String? value) {
//                                               setState(() {
//                                                 selectedSectionName = value;
//                                               });
//                                             },
//                                             validator: (v) => v == null ? 'الرجاء إختيار القسم' : null,
//                                           ),
//                                         ),
//                                         AppSpaces.verticalMedium,
//                                         CustomTextFormField(
//                                           controller: description,
//                                           label: 'وصف المشكلة',
//                                           width: SizeConfig.w(320),
//                                           maxLines: 4,
//                                         ),
//                                         AppSpaces.verticalMedium,
//                                         Padding(
//                                           padding: AppPadding.onlyLeftLarge,
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: Colors.white.withOpacity(0.4),
//                                               ),
//                                               borderRadius: AppRadius.circularVeryMedium,
//                                               color: Colors.white.withOpacity(0.1),
//                                             ),
//                                             child: CustomTextFormField(
//                                               controller: location,
//                                               label: 'موقع الشكوى',
//                                               width: SizeConfig.w(320),
//                                             ),
//                                           ),
//                                         ),
//                                         AppSpaces.verticalSmall,
//                                         Padding(padding: AppPadding.onlyRightMedium,
//                                           child: Container(
//                                             height: SizeConfig.h(51.8),
//                                             width: SizeConfig.w(320),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: Colors.white.withOpacity(0.4),
//                                               ),
//                                               borderRadius: BorderRadius.circular(30),
//                                               color: Colors.white.withOpacity(0.1),
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 IconButton(
//                                                   onPressed: () {
//                                                     showModalBottomSheet(
//                                                       backgroundColor: AppColors.beige,
//                                                       context: context,
//                                                       builder: (context) {
//                                                         return SafeArea(
//                                                           child: Directionality(
//                                                             textDirection: TextDirection.rtl,
//                                                             child: Wrap(
//                                                               children: [
//                                                                 ListTile(
//                                                                   leading: Icon(Icons.image, color: AppColors.oliveGreen),
//                                                                   title: Text('اختر صور', style: AppTextStyles.smallOliveGreenStyle),
//                                                                   onTap: () {
//                                                                     Navigator.pop(context);
//                                                                     pickImages();
//                                                                   },
//                                                                 ),
//                                                                 ListTile(
//                                                                   leading: Icon(Icons.file_present, color: AppColors.oliveGreen),
//                                                                   title: Text('اختر ملفات', style: AppTextStyles.smallOliveGreenStyle),
//                                                                   onTap: () {
//                                                                     Navigator.pop(context);
//                                                                     pickDocuments();
//                                                                   },
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         );
//                                                       },
//                                                     );
//                                                   },
//                                                   icon: Icon(Icons.add, color: AppColors.yellow, size: 23),
//                                                 ),Text('إرفاق ملفات', style: AppTextStyles.smallWhite70Style),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         AppSpaces.verticalSmall,

//                                         // images grid (same look as you had)
//                                         if (pickedImages.isNotEmpty)
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                                             child: GridView.builder(
//                                               shrinkWrap: true,
//                                               physics: const NeverScrollableScrollPhysics(),
//                                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                                 crossAxisCount: 4,
//                                                 crossAxisSpacing: 8,
//                                                 mainAxisSpacing: 8,
//                                               ),
//                                               itemCount: pickedImages.length,
//                                               itemBuilder: (context, index) {
//                                                 final img = pickedImages[index];
//                                                 return Stack(
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: () => openFile(img),
//                                                       child: ClipRRect(
//                                                         borderRadius: BorderRadius.circular(10),
//                                                         child: Image.file(
//                                                           File(img),
//                                                           width: double.infinity,
//                                                           height: double.infinity,
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Positioned(
//                                                       top: 0,
//                                                       right: 0,
//                                                       child: GestureDetector(
//                                                         onTap: () {
//                                                           setState(() {
//                                                             pickedImages.removeAt(index);
//                                                           });
//                                                         },
//                                                         child: Container(
//                                                           decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//                                                           child: const Icon(Icons.close, size: 18, color: Colors.white),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 );
//                                               },
//                                             ),
//                                           ),if (pickedDocuments.isNotEmpty)
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                                             child: Column(
//                                               children: pickedDocuments.map((doc) {
//                                                 return Stack(
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: () => openFile(doc),
//                                                       child: Container(
//                                                         margin: const EdgeInsets.only(bottom: 5),
//                                                         padding: const EdgeInsets.all(8),
//                                                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
//                                                         child: Row(
//                                                           children: [
//                                                             const Icon(Icons.file_present, size: 20, color: Colors.blue),
//                                                             const SizedBox(width: 6),
//                                                             Expanded(child: Text(doc.split("/").last)),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Positioned(
//                                                       top: 0,
//                                                       right: 0,
//                                                       child: GestureDetector(
//                                                         onTap: () {
//                                                           setState(() {
//                                                             pickedDocuments.remove(doc);
//                                                           });
//                                                         },
//                                                         child: Container(
//                                                           decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//                                                           child: const Icon(Icons.close, size: 18, color: Colors.white),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 );
//                                               }).toList(),
//                                             ),
//                                           ),

//                                         AppSpaces.verticalVeryMedium,

//                                         // Submit button (keeps your GradientElevatedButton)
//                                         GradientElevatedButton(
//                                           text: 'إرسال الشكوى',
//                                           onPressed: () =>
//                                             _onSubmit()

//                                         ),
//                                         AppSpaces.verticalVeryMedium,
//                                       ],
//                                     ),
//                                   ),
//                                 ),),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: SizeConfig.h(280),
//                         top: SizeConfig.h(15),
//                         child: Container(
//                           height: SizeConfig.h(73),
//                           width: SizeConfig.w(120),
//                           decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.logo)), shape: BoxShape.circle),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//exampleeeeee

class AddComplaint extends StatefulWidget {
  const AddComplaint({super.key});

  @override
  State<AddComplaint> createState() => _AddComplaint();
}

class _AddComplaint extends State<AddComplaint> {
  final formKey = GlobalKey<FormState>();

  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();

  List<Map<String, String>> types = [];
  List<Map<String, String>> sections = [];

  String? selectedTypeValue;
  String? selectedSectionValue;

  @override
  void initState() {
    super.initState();
    types = [
      {"id": "1", "name": "طلب تسجيل"},
      {"id": "2", "name": "خطأ فاتورة"},
      {"id": "3", "name": "عطل فني"},
    ];
    sections = [
      {"id": "1", "name": "المؤسسة العامة للكهرباء"},
      {"id": "2", "name": "المؤسسة العامة لمياه "},
      {"id": "3", "name": "المؤسسة العامة للاتصالات"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddComplaintBloc>(),
      child: Scaffold(
        body: Stack(
          children: [
         
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.armyGreen,
                    AppColors.armyGreen2,
                    AppColors.oliveGreen2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

               Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.beige),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: SizeConfig.h(50)),
              child: Stack(
                children: [
              
                  Center(
                    child: ClipRRect(
                      borderRadius: AppRadius.circularMedium,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: SizeConfig.w(20),
                          sigmaY: SizeConfig.h(20),
                        ),
                        child: Container(
                          width: SizeConfig.w(360),
                          padding: AppPadding.allSmall,
                          decoration: BoxDecoration(
                            color: AppColors.whiteWithOpacity15,
                            borderRadius: AppRadius.circularMedium,
                            border: Border.all(
                              color: AppColors.whiteWithOpacity3,
                              width: SizeConfig.w(1.5),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: BlocBuilder<AddComplaintBloc, AddComplaintState>(
                                buildWhen: (_, __) => true,
                                builder: (context, state) {
                                  List<File> attachments = [];
                                  if (state is AddComplaintInitial) {
                                    selectedTypeValue = state.selectedTypeId;
                                    selectedSectionValue =
                                        state.selectedDepartmentId;
                                    attachments = state.attachments;
                                  }
                                  return SingleChildScrollView(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: AppPadding.onlyRightMedium,
                                            child: Text(
                                              AppTexts.addComplaint,
                                              style:
                                                  AppTextStyles.bigwhiteStyle,
                                            ),
                                          ),
                                          AppSpaces.verticalSmall,
                                          Text(
                                            "قم بتعبئة جميع الحقول ليتم تقديم الشكوى بنجاح",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          AppSpaces.verticalMedium,
                                          Padding(
                                            padding: AppPadding.onlyLeftLarge,
                                            child: DropdownButtonField(
                                              label: 'نوع الشكوى',
                                              options: types
                                                  .map((e) => e['name']!)
                                                  .toList(),
                                              onChanged: (String? value) {
                                                // find id by name
                                                final found = types.firstWhere(
                                                  (t) => t['name'] == value,
                                                );
                                                context
                                                    .read<AddComplaintBloc>()
                                                    .add(
                                                      AddComplaintTypeSelected(
                                                        found['id']!,
                                                      ),
                                                    );
                                              },
                                              validator: (v) => v == null
                                                  ? 'الرجاء إختيار نوع الشكوى'
                                                  : null,
                                            ),
                                          ),
                                          AppSpaces.verticalSmall,
                                          Padding(
                                            padding: AppPadding.onlyRightMedium,
                                            child: DropdownButtonField(
                                              label: 'قسم الشكوى',
                                              options: sections
                                                  .map((e) => e['name']!)
                                                  .toList(),
                                              onChanged: (String? value) {
                                                final found = sections
                                                    .firstWhere(
                                                      (t) => t['name'] == value,
                                                    );
                                                context
                                                    .read<AddComplaintBloc>()
                                                    .add(
                                                      AddComplaintDepartmentSelected(
                                                        found['id']!,
                                                      ),
                                                    );
                                              },
                                              validator: (v) => v == null
                                                  ? 'الرجاء إختيار القسم'
                                                  : null,
                                            ),
                                          ),
                                          AppSpaces.verticalMedium,
                                          CustomTextFormField(
                                            controller: description,
                                            label: 'وصف المشكلة',
                                            width: SizeConfig.w(320),
                                            maxLines: 4,
                                          ),
                                          AppSpaces.verticalMedium,
                                          Padding(
                                            padding: AppPadding.onlyLeftLarge,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                ),
                                                borderRadius: AppRadius
                                                    .circularVeryMedium,
                                                color: Colors.white.withOpacity(
                                                  0.1,
                                                ),
                                              ),
                                              child: CustomTextFormField(
                                                controller: location,
                                                label: 'موقع الشكوى',
                                                width: SizeConfig.w(320),
                                              ),
                                            ),
                                          ),
                                          AppSpaces.verticalSmall,

                                          buildFileSelector(
                                            context,
                                            attachments,
                                          ),

                                          AppSpaces.verticalSmall,
                                          BlocConsumer<
                                            AddComplaintBloc,
                                            AddComplaintState
                                          >(
                                            listener: (context, state) {
                                              if (state
                                                  is AddComplaintFailure) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    content: Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Text(
                                                        state.message,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else if (state
                                                  is AddComplaintSuccess) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Colors.green.shade400,
                                                    content: Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Text(
                                                        'تم إرسال الشكوى بنجاح',
                                                        style: AppTextStyles
                                                            .smallBeigeStyle,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                                location.clear();
                                                description.clear();

                                                context
                                                    .read<AddComplaintBloc>()
                                                    .add(
                                                      ResetAddComplaintEvent(),
                                                    );

                                                setState(() {
                                                  selectedSectionValue = null;
                                                  selectedTypeValue = null;
                                                });

                                                // context
                                                //     .read<AddComplaintBloc>()
                                                //     .add(
                                                //       RemoveAttachmentEvent(-1),
                                                //     );
                                              }
                                            },
                                            builder: (context, state) {
                                              if (state
                                                  is AddComplaintLoading) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                        backgroundColor:
                                                            AppColors.beige,
                                                      ),
                                                );
                                              }
                                              return GradientElevatedButton(
                                                text: 'إرسال الشكوى',
                                                onPressed: () {
                                                  if (!formKey.currentState!
                                                      .validate())
                                                    return;
                                                  context
                                                      .read<AddComplaintBloc>()
                                                      .add(
                                                        SubmitAddComplaintEvent(
                                                          description:
                                                              description.text,
                                                          location:
                                                              location.text,
                                                        ),
                                                      );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: SizeConfig.h(285),
                    top: SizeConfig.h(28),
                    child: Container(
                      height: SizeConfig.h(73),
                      width: SizeConfig.w(120),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.logo),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // ===========================
// // Widget لعرض الملفات المرفقة
// Widget _buildAttachmentsList(List<File> attachments) {
//   if (attachments.isEmpty) return SizedBox.shrink();

//   return SizedBox(
//     height: 120,
//     child: ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: attachments.length,
//       separatorBuilder: (_, __) => const SizedBox(width: 8),
//       itemBuilder: (context, i) {
//         final file = attachments[i];
//         final isPdf = file.path.toLowerCase().endsWith('.pdf');

//         return Stack(
//           children: [
//             GestureDetector(
//               onTap: () => OpenFilex.open(file.path),
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 color: Colors.grey.shade200,
//                 child: isPdf
//                     ? const Icon(Icons.picture_as_pdf)
//                     : Image.file(file, fit: BoxFit.cover),
//               ),
//             ),
//             Positioned(
//               top: 4,
//               left: 4,
//               child: GestureDetector(
//                 onTap: () => context.read<AddComplaintBloc>().add(
//                   RemoveAttachmentEvent(i),
//                 ),
//                 child: const CircleAvatar(
//                   backgroundColor: Colors.red,
//                   radius: 12,
//                   child: Icon(Icons.close, size: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     ),
//   );
// }

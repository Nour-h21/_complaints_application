import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/Theme/app_colors.dart';
import '../../../../core/Theme/app_gradient.dart';
import '../../../../core/Theme/app_text_style.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/shared/widgets/gradient_elevated_button.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../add_complaint/presentation/widgets/textFormField.dart';
import '../../../details_complaint/presentation/pages/details_complaint.dart';
import '../../../details_complaint/presentation/widgets/attachments_viewer.dart';
import '../bloc/edit_complaint_bloc.dart';
import '../bloc/edit_complaint_event.dart';
import '../bloc/edit_complaint_state.dart';
import '../widgets/build_attachment_selctor.dart';

class EditComplaintPage extends StatelessWidget {
  final int complaintId;
  final String type;
  final String department;
  final String location;
  final String description;
  final List<String> attachments;
  const EditComplaintPage({
    super.key,
    required this.complaintId,
    required this.type,
    required this.department,
    required this.location,
    required this.description,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditComplaintBloc>(),
      child: _EditComplaintView(
        complaintId: complaintId,
        type: type,
        department: department,
        location: location,
        description: description,
        attachments: attachments,
      ),
    );
  }
}

class _EditComplaintView extends StatefulWidget {
  final int complaintId;
  final String type;
  final String department;
  final String location;
  final String description;
  final List<String> attachments;

  const _EditComplaintView({
    required this.complaintId,
    required this.type,
    required this.department,
    required this.location,
    required this.description,
    required this.attachments,
  });

  @override
  State<_EditComplaintView> createState() => _EditComplaintViewState();
}

class _EditComplaintViewState extends State<_EditComplaintView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return Scaffold(
      body: BlocConsumer<EditComplaintBloc, EditComplaintState>(
        listener: (context, state) {
          if (state.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color.fromARGB(255, 93, 174, 95),
                content: Text(
                  'Complaint updated',
                  style: TextStyle(
                    fontFamily: 'Arima',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.offWhite,
                  ),
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    DetailsComplaint(complaintId: widget.complaintId),
              ),
            );
          }

          if (state.error.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color.fromARGB(255, 250, 61, 47),
                content: Text(
                  state.error,
                  style: TextStyle(
                    fontFamily: 'Arima',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.offWhite,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Stack(
              children: [
                
                Container(
                  decoration: BoxDecoration(
                    gradient: gradients.onboardingGradient,
                  ),
                ),
                

                Padding(
                  padding: EdgeInsets.only(top: 45, left: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Edit The Complaint',
                            textAlign: TextAlign.center,
                            style: texts.addTitle,
                          ),
                      
                          // Row(
                          //   children: [
                          //     Text(
                          //       'S',
                          //       style: TextStyle(
                          //         fontSize: 35,
                          //         fontWeight: FontWeight.bold,
                          //         color: AppColors.oliveGreen,
                          //         fontFamily: 'Arima',
                          //       ),
                          //     ),
                      
                          //     Text(
                          //       'hakwa \n yr',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.bold,
                          //         color: AppColors.beige,
                          //         fontFamily: 'Arima',
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          
                          SizedBox(width: SizeConfig.w(100)),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailsComplaint(
                                      complaintId: widget.complaintId,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.arrow_back, color: AppColors.beige),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        indent: 2,
                        endIndent: 15,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.h(130)),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: AppRadius.circularMedium,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: SizeConfig.w(20),
                                sigmaY: SizeConfig.h(20),
                              ),
                              child: Container(
                                width: SizeConfig.w(360),
                                height: SizeConfig.h(699),
                                padding: AppPadding.allSmall,
                                decoration: BoxDecoration(
                                  color: colors.cardBackground,
                                  borderRadius: AppRadius.circularMedium,
                                  border: Border.all(
                                    color: AppColors.whiteWithOpacity3,
                                    width: SizeConfig.w(1.5),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                      // Text(
                                      //   'Edit The Complsint',
                                      //   textAlign: TextAlign.center,
                                      //   style: texts.addTitle
                                      // ),
                                      AppSpaces.verticalSmall,
                                      Text(
                                        "You can only edit the description field and add attachments.",
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontFamily: 'Arima',
                                        ),
                                      ),
                                      AppSpaces.verticalMedium,
                                      Padding(
                                        padding: AppPadding.onlyLeftLarge,
                                        child: CustomTextFormField(
                                          label: 'Complaint Type',
                                          initialValue: widget.type,
                                          width: SizeConfig.w(320),
                                          readOnly: true,
                                        ),
                                      ),
                                      AppSpaces.verticalSmall,
                                      Padding(
                                        padding: AppPadding.onlyRightMedium,
                                        child: CustomTextFormField(
                                          label: 'Complaint Discription',
                                          initialValue: widget.department,
                                          width: SizeConfig.w(320),
                                          readOnly: true,
                                        ),
                                      ),
                                      AppSpaces.verticalMedium,
                                      CustomTextFormField(
                                        controller: descriptionController,
                                        label: "Complaint Discription",
                                        width: SizeConfig.w(320),
                                        maxLines: 4,
                                        readOnly: false,
                                      ),
                                      AppSpaces.verticalMedium,
                                      Padding(
                                        padding: AppPadding.onlyLeftLarge,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white.withOpacity(
                                                0.4,
                                              ),
                                            ),
                                            borderRadius:
                                                AppRadius.circularVeryMedium,
                                            color: Colors.white.withOpacity(
                                              0.1,
                                            ),
                                          ),
                                          child: CustomTextFormField(
                                            readOnly: true,
                                            initialValue: widget.location,
                                            label: 'Complaint Location',
                                            width: SizeConfig.w(320),
                                          ),
                                        ),
                                      ),
                                      AppSpaces.verticalSmall,

                                      // ATTACHMENTS
                                      buildEditFileSelector(
                                        context,
                                        state.attachments,
                                      ),
                                      AppSpaces.verticalSmall,
                                      AttachmentsViewer(
                                        attachments: widget.attachments,
                                      ),
                                      AppSpaces.verticalSmall,
                                      GradientElevatedButton(
                                        text: 'Submit',
                                        onPressed: () {
                                          // final bloc = context
                                          //     .read<EditComplaintBloc>();
                                          // if (bloc.state.attachments.isEmpty) {
                                          //   ScaffoldMessenger.of(
                                          //     context,
                                          //   ).showSnackBar(
                                          //     SnackBar(
                                          //       backgroundColor: Color.fromARGB(
                                          //         255,
                                          //         250,
                                          //         61,
                                          //         47,
                                          //       ),
                                          //       content: Text(
                                          //         "At least one image or file must be attached",
                                          //         style: TextStyle(
                                          //           fontFamily: 'Arima',
                                          //           fontSize: 15,
                                          //           fontWeight: FontWeight.w500,
                                          //           color: AppColors.offWhite,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   );
                                          //   return;
                                          // }
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<EditComplaintBloc>()
                                                .add(
                                                  SubmitEditComplaintEvent(
                                                    complaintId:
                                                        widget.complaintId,
                                                    description:
                                                        descriptionController
                                                            .text,
                                                  ),
                                                );
                                          }
                                        },
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



// class EditComplaintPage extends StatelessWidget {
//   final int complaintId;
//   final String type;
//   final String department;
//   final String location;
//   final String description;

//   const EditComplaintPage({
//     super.key,
//     required this.complaintId,
//     required this.type,
//     required this.department,
//     required this.location,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<EditComplaintBloc>(),
//       child: _EditComplaintView(
//         complaintId: complaintId,
//         type: type,
//         department: department,
//         location: location,
//         description: description,
//       ),
//     );
//   }
  
// }
// class _EditComplaintView extends StatefulWidget {
//   final int complaintId;
//   final String type;
//   final String department;
//   final String location;
//   final String description;

//   const _EditComplaintView({
//     required this.complaintId,
//     required this.type,
//     required this.department,
//     required this.location,
//     required this.description,
//   });

//   @override
//   State<_EditComplaintView> createState() => _EditComplaintViewState();
// }

// class _EditComplaintViewState extends State<_EditComplaintView> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController descriptionController;

//   @override
//   void initState() {
//     super.initState();
//     descriptionController =
//         TextEditingController(text: widget.description);
//   }

//   @override
//   void dispose() {
//     descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<EditComplaintBloc, EditComplaintState>(
//         listener: (context, state) {
//           if (state.success) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Complaint updated')),
//             );
//             Navigator.pop(context, true);
//           }

//           if (state.error != null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.error!)),
//             );
//           }
//         },
//         builder: (context, state) {
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Edit Complaint',
//                       style: Theme.of(context).textTheme.headlineSmall),

//                   const SizedBox(height: 20),

//                   TextFormField(
//                     initialValue: widget.type,
//                     readOnly: true,
//                     decoration:
//                         const InputDecoration(labelText: 'Type'),
//                   ),

//                   const SizedBox(height: 10),

//                   TextFormField(
//                     initialValue: widget.department,
//                     readOnly: true,
//                     decoration:
//                         const InputDecoration(labelText: 'Department'),
//                   ),

//                   const SizedBox(height: 10),

//                   TextFormField(
//                     controller: descriptionController,
//                     maxLines: 4,
//                     decoration: const InputDecoration(
//                         labelText: 'Problem Description'),
//                     validator: (v) =>
//                         v!.isEmpty ? 'Required' : null,
//                   ),

//                   const SizedBox(height: 10),

//                   TextFormField(
//                     initialValue: widget.location,
//                     readOnly: true,
//                     decoration:
//                         const InputDecoration(labelText: 'Location'),
//                   ),

//                   const SizedBox(height: 20),

//                   /// ATTACHMENTS
//                   buildEditFileSelector(
//                     context,
//                     state.attachments,
//                   ),

//                   const SizedBox(height: 30),

//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: state.loading
//                           ? null
//                           : () {
//                               if (_formKey.currentState!.validate()) {
//                                 context
//                                     .read<EditComplaintBloc>()
//                                     .add(
// SubmitEditComplaintEvent(
//                                         complaintId:
//                                             widget.complaintId,
//                                         description:
//                                             descriptionController.text,
//                                       ),
//                                     );
//                               }
//                             },
//                       child: state.loading
//                           ? const CircularProgressIndicator()
//                           : const Text('Submit'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
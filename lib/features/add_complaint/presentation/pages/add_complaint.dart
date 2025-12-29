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
import '../../../../core/shared/widgets/back_button.dart';
import '../../../../core/shared/widgets/gradient_elevated_button.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../bloc/add_complaint_bloc.dart';
import '../bloc/add_complaint_event.dart';
import '../bloc/add_complaint_state.dart';
import '../widgets/build_file_selector.dart';
import '../widgets/dropDown.dart';
import '../widgets/textFormField.dart';

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
      child: SafeArea(
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
                  buildBackButton(context),
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
      ),
    );
  }
}

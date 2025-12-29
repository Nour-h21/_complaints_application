import 'package:complaints_application/core/constants/strings/texts.dart';
import 'package:complaints_application/core/shared/pages/background_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_bloc.dart';
import '../../../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_event.dart';
import '../../../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_state.dart';
import '../../../UnreadNotificationsCount/presentation/widgets/notification_icon_button.dart';
import '../bloc/my_complaint_bloc.dart';
import '../bloc/my_complaint_event.dart';
import '../bloc/my_complaint_state.dart';
import '../widgets/complaint_card.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


class MyComplaints extends StatefulWidget {
  const MyComplaints({super.key});

  @override
  State<MyComplaints> createState() => _MyComplaintsState();
}

class _MyComplaintsState extends State<MyComplaints> {
  @override
  void initState() {
    super.initState();
    context.read<ComplaintsBloc>().add(LoadComplaintsEvent());
     context.read<ComplaintsBloc>().add(LoadComplaintsEvent());

  // 🔔 تشغيل تحديث عداد الإشعارات
  context.read<UnreadCountBloc>().add(StartUnreadCountPolling());
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWithLogo(
        appbarName: AppTexts.list,
        padding: AppPadding.onlyTopLargeAndLeftMed,
        useListview: false,
        icon: NotificationsIconButton(),
        child: BlocConsumer<ComplaintsBloc, ComplaintsState>(
          listener: (context, state) {
            if (state is ComplaintsFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state is ComplaintsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ComplaintsLoaded) {
              final list = state.complaints;
              if (list.isEmpty) {
                return Center(
                  child: Column(
                  children: [
                    Text('لا توجد شكاوي بعد 🤔', style: AppTextStyles.medBeigeStyle),
      
                     Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.h(448),
                left: SizeConfig.h(256),
              ),
              child: SizedBox(
                height: SizeConfig.h(48),
                width: SizeConfig.w(125),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: FloatingActionButton.extended(
                    backgroundColor: AppColors.beige,
                    onPressed: () {
                      GoRouter.of(context).push('/AddComplaint');
                    },
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.oliveGreen,
                      size: SizeConfig.w(23.5),
                    ),
                    label: Text(
                      AppTexts.addComplaint,
                      style: AppTextStyles.smallOliveGreenStyle,
                    ),
                  ),
                ),
              ),
            ),
                  ],
                ));
              }
      
              return Stack(
                children: [
                  Padding(
                    padding: AppPadding.symmetricHorizontSmall,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        height: SizeConfig.h(500),
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final c = list[index];
                            return ComplaintCard(complaint: c);
                          },
                        ),
                      ),
                    ),
                  ),
                   Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.h(438),
                left: SizeConfig.h(256),
              ),
              child: SizedBox(
                height: SizeConfig.h(48),
                width: SizeConfig.w(125),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: FloatingActionButton.extended(
                    backgroundColor: AppColors.beige,
                    onPressed: () {
                      GoRouter.of(context).push('/AddComplaint');
                    },
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.oliveGreen,
                      size: SizeConfig.w(23.5),
                    ),
                    label: Text(
                      AppTexts.addComplaint,
                      style: AppTextStyles.smallOliveGreenStyle,
                    ),
                  ),
                ),
              ),
            ),
                ],
              );
            } else if (state is ComplaintsFailure) {
              return Center(child: Text('حصل خطأ', style: AppTextStyles.medWhite70Style));
            } else {
              return const SizedBox.shrink();
            }
          },
           
        ),
        
      ),
    );
  }
}
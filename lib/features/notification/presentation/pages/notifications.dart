import 'package:complaints_application/core/constants/strings/texts.dart';
import 'package:complaints_application/core/shared/pages/background_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/shared/widgets/back_button.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../UnreadNotificationsCount/presentation/widgets/notification_icon_button.dart';

import '../bloc/bloc/notifications_bloc.dart';
import '../bloc/bloc/notifications_event.dart';
import '../bloc/bloc/notifications_state.dart';
import '../widgets/notificatios_card.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsBloc>().add(FetchNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWithLogo(
        appbarName: AppTexts.welcome,
        padding: AppPadding.onlyTopLargeAndLeftMed,
        useListview: false,
        icon: buildBackButton(context),
        child: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationsLoaded) {
              final list = state.notifications;
              if (list.isEmpty) {
                return Center(
                  child: Text(
                    'لا يوجد إشعارات',
                    style: AppTextStyles.medBeigeStyle,
                  ),
                );
              }
      
              return Stack(
                children: [
                  Padding(
                    padding: AppPadding.symmetricHorizontSmall,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        height: SizeConfig.h(530),
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final n = list[index];
                            return NotificatiosCard(notifications: n);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is NotificationsError) {
              return Center(
                child: Text(
                  '${state.message} : حصل خطأ',
                  style: AppTextStyles.medWhite70Style,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

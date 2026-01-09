import 'package:carousel_slider/carousel_slider.dart';
import 'package:complaints_application/app/di/injection_container.dart';
import 'package:complaints_application/core/constants/urls/assets_url.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/Theme/app_colors.dart';
import '../../../../core/Theme/app_gradient.dart';
import '../../../../core/Theme/app_text_style.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_padding.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/shared/pages/gradient_background.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_bloc.dart';
import '../../../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_event.dart';
import '../../../UnreadNotificationsCount/presentation/widgets/notification_icon_button.dart';
import '../bloc/my_complaint_bloc.dart';
import '../bloc/my_complaint_event.dart';
import '../bloc/my_complaint_state.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/complaint_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// class MyComplaints extends StatefulWidget {
//   const MyComplaints({super.key});

//   @override
//   State<MyComplaints> createState() => _MyComplaintsState();
// }

// class _MyComplaintsState extends State<MyComplaints> {
//   @override
//   // void initState() {
//   //   super.initState();
//   //   context.read<ComplaintsBloc>().add(LoadComplaintsEvent());
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<ComplaintsBloc>()..add(LoadComplaintsEvent()),
//       child: Builder(
//         builder: (context) {
//           return BackgroundWithLogo(
//             appbarName: AppTexts.list,
//             padding: AppPadding.onlyTopLargeAndLeftMed,
//             useListview: false,
//             icon: SizedBox(),
//             child: BlocConsumer<ComplaintsBloc, ComplaintsState>(
//               listener: (context, state) {
//                 if (state is ComplaintsFailure) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(state.message),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 if (state is ComplaintsLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is ComplaintsLoaded) {
//                   final list = state.complaints;
//                   if (list.isEmpty) {
//                     return Center(
//                       child: Text(
//                         'لا توجد شكاوي بعد 🤔',
//                         style: AppTextStyles.medBeigeStyle,
//                       ),
//                     );
//                   }

//                   return Stack(
//                     children: [
//                       Padding(
//                         padding: AppPadding.symmetricHorizontSmall,
//                         child: Directionality(
//                           textDirection: TextDirection.rtl,
//                           child: SizedBox(
//                             height: SizeConfig.h(530),
//                             child: ListView.builder(
//                               itemCount: list.length,
//                               itemBuilder: (context, index) {
//                                 final c = list[index];
//                                 return ComplaintCard(complaint: c);
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: SizeConfig.h(448),
//                           left: SizeConfig.h(256),
//                         ),
//                         child: SizedBox(
//                           height: SizeConfig.h(48),
//                           width: SizeConfig.w(125),
//                           child: Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: FloatingActionButton.extended(
//                               backgroundColor: AppColors.beige,
//                               onPressed: () {
//                                 GoRouter.of(context).push('/AddComplaint');
//                               },
//                               icon: Icon(
//                                 Icons.edit,
//                                 color: AppColors.oliveGreen,
//                                 size: SizeConfig.w(23.5),
//                               ),
//                               label: Text(
//                                 AppTexts.addComplaint,
//                                 style: AppTextStyles.smallOliveGreenStyle,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if (state is ComplaintsFailure) {
//                   return Center(
//                     child: Text('حصل خطأ', style: AppTextStyles.medWhite70Style),
//                   );
//                 } else {
//                   return const SizedBox.shrink();
//                 }
//               },
//             ),
//           );
//         }
//       ),
//     );
//   }
// }

class MyComplaints extends StatefulWidget {
  const MyComplaints({super.key});

  @override
  State<MyComplaints> createState() => _MyComplaintsState();
}

class _MyComplaintsState extends State<MyComplaints> {

  @override
    void initState() {
    super.initState();
  // 🔔 تشغيل تحديث عداد الإشعارات
  context.read<UnreadCountBloc>().add(StartUnreadCountPolling());
}
  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return BlocProvider(
      create: (context) => getIt<ComplaintsBloc>()..add(LoadComplaintsEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: GradientBackground(
              child: Padding(
                padding: EdgeInsets.only(top: 42,left: 20,right: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'S',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: AppColors.oliveGreen,
                            fontFamily: 'Arima',
                          ),
                        ),
                        Text(
                          'hakwa \n yr',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.beige,
                            fontFamily: 'Arima',
                          ),
                        ),
                        SizedBox(width: SizeConfig.w(255)),
                        // IconButton(
                        //   onPressed: () {
                        //     GoRouter.of(context).push("/Notifications");
                        //   },
                        //   icon: Icon(
                        //     Icons.notifications_rounded,
                        //     color: AppColors.beige,
                        //     size: 26,
                        //   ),
                        // ),
                        NotificationsIconButton(),
                      ],
                    ),

                    SizedBox(height: SizeConfig.h(25)),
                    CarouselSlider(
                      items: [
                        buildCarouselItem(
                          AppAssets.slider1,

                          "Your Government Platform \n Your Voice Matters  ",
                        ),
                        buildCarouselItem(
                          AppAssets.slider2,

                          "Direct & Fast Delivery ",
                        ),
                        buildCarouselItem(
                          AppAssets.slider3,

                          "Accurate Description  Exact Location  More Details",
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.5,
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(30)),
                    Row(
                      children: [
                        Text(
                          "My Complaints",
                          style: texts.title,
                        ),
                      ],
                    ),
                    BlocConsumer<ComplaintsBloc, ComplaintsState>(
                      listener: (context, state) {
                        if (state is ComplaintsFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ComplaintsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ComplaintsLoaded) {
                          final list = state.complaints;
                          if (list.isEmpty) {
                            return Center(
                              child: Text(
                                'لا توجد شكاوي بعد 🤔',
                                style: AppTextStyles.medBeigeStyle,
                              ),
                            );
                          }
                          return Padding(
                            padding: AppPadding.symmetricHorizontSmall,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: SizedBox(
                                height: SizeConfig.h(420),
                                child: ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    final c = list[index];
                                    return ComplaintCard(complaint: c);
                                  },
                                ),
                              ),
                            ),
                          );
                        } else if (state is ComplaintsFailure) {
                          return Center(
                            child: Text(
                              'حصل خطأ',
                              style: AppTextStyles.medWhite70Style,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

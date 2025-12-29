import 'package:complaints_application/features/notification/presentation/bloc/bloc/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/notifications_bloc.dart';
import '../bloc/bloc/notifications_event.dart';


class NotificationsPage extends StatefulWidget {

  const NotificationsPage({super.key,});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<NotificationsBloc>()
        .add(FetchNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإشعارات')),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotificationsLoaded) {
            if (state.notifications.isEmpty) {
              return const Center(child: Text('لا يوجد إشعارات'));
            }

            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final n = state.notifications[index];
                return ListTile(
                  title: Text(n.title),
                  subtitle: Text(n.body),
                  trailing: Text(
                    n.createdAt,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            );
          }

          if (state is NotificationsError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/logout_bloc.dart';
import '../bloc/logout_event.dart';
import '../bloc/logout_state.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final IconData logoutIcon = Platform.isIOS
        ? CupertinoIcons.square_arrow_right
        : Icons.logout;

    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.go('/logIn');
        }

        if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: IconButton(
        tooltip: 'تسجيل الخروج',
        icon: Icon(logoutIcon),
        onPressed: () {
          context.read<LogoutBloc>().add(LogoutRequested());
        },
      ),
    );
  }
}
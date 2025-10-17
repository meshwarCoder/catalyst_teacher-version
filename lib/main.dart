import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:catalyst/features/auth/presentation/cubit/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const CatalystTeacher());
}

class CatalystTeacher extends StatelessWidget {
  const CatalystTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt.get<AuthRepoImplementation>()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Routs.router,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

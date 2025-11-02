import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/utils/vlidation.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/features/auth/presentation/cubit/login%20cubit/login_cubit.dart';
import 'package:catalyst/features/auth/presentation/widgets/bubble_icon.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_textformfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/widgets/glass_books.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: BlocConsumer<LoginCubitCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is LoginCubitError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is LoginCubitSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            GoRouter.of(context).go(Routs.root);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Opacity(
                opacity: state is LoginCubitLoading ? 0.5 : 1,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Form(
                      autovalidateMode: autoValidate,
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //logo
                            const SizedBox(height: 70),
                            GlassBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text(
                                    "Catalyst",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Text(
                                    "Teacher Version",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.6),
                                      letterSpacing: 1,
                                    ),
                                  ),

                                  //SvgPicture.asset(Assets.catalyst),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),

                            //Text Fields
                            GlassBox(
                              child: Column(
                                children: [
                                  Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextformfield(
                                    controller: context
                                        .read<LoginCubitCubit>()
                                        .emailController,
                                    label: 'Email',
                                    icon: CupertinoIcons.mail,
                                    validator: Validation.validateEmail,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextformfield(
                                    controller: context
                                        .read<LoginCubitCubit>()
                                        .passwordController,
                                    label: 'Password',
                                    icon: CupertinoIcons.lock,
                                    isPassword: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
                                    },
                                  ),

                                  //Forgot Password
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        GoRouter.of(
                                          context,
                                        ).push(Routs.forgetPassword);
                                      },
                                      child: Text(
                                        'Forgot Password? ',
                                        style: TextStyle(
                                          color: AppColors.likeWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  //Login Button
                                  CustomButton(
                                    text: 'LOGIN',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginCubitCubit>().login();
                                      } else {
                                        setState(() {
                                          autoValidate = AutovalidateMode
                                              .onUserInteraction;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),

                            GlassBox(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'don’t have an account?',
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: 0.7,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(0, 0),
                                        ),
                                        onPressed: () {
                                          GoRouter.of(
                                            context,
                                          ).push(Routs.register);
                                        },
                                        child: const Text(
                                          'Sign Up',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BubbleIcon(
                                        icon: Icons.school,
                                        active: true,
                                      ),
                                      SizedBox(width: 40),
                                      BubbleIcon(
                                        icon: Icons.person,
                                        active: false,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (state is LoginCubitLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}

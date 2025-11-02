import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/utils/vlidation.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/core/widgets/glass_books.dart';
import 'package:catalyst/features/auth/presentation/cubit/register%20cubit/register_cubit.dart';
import 'package:catalyst/features/auth/presentation/cubit/register%20cubit/register_state.dart';
import 'package:catalyst/features/auth/presentation/widgets/bubble_icon.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: BlocConsumer<RegisterCubit, RegisterCubitState>(
        listener: (context, state) {
          if (state is RegisterCubitSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.successMessage)));
            GoRouter.of(context).go(Routs.login);
          } else if (state is RegisterCubitError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Opacity(
                opacity: state is RegisterCubitLoading ? 0.5 : 1,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: autoValidate,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //logo
                            const SizedBox(height: 70),
                            GlassBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  CustomText(
                                    text: "Catalyst",
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withValues(alpha: 0.9),
                                    letterSpacing: 1.5,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomText(
                                    text: "Empowering Education",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withValues(alpha: 0.6),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),

                            GlassBox(
                              child: Column(
                                children: [
                                  CustomText(
                                    text: "Create an account ",
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withValues(alpha: 0.9),
                                  ),
                                  CustomText(
                                    text: "join the teatching revolution",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withValues(alpha: 0.6),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextformfield(
                                    controller: context
                                        .read<RegisterCubit>()
                                        .nameController,
                                    label: 'Name',
                                    icon: Icons.person,
                                    validator: Validation.validateName,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextformfield(
                                    controller: context
                                        .read<RegisterCubit>()
                                        .emailController,
                                    label: 'Email',
                                    icon: Icons.email,
                                    validator: Validation.validateEmail,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextformfield(
                                    controller: context
                                        .read<RegisterCubit>()
                                        .passwordController,
                                    label: 'Password',
                                    icon: Icons.lock,
                                    isPassword: true,
                                    validator: Validation.validatePassword,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextformfield(
                                    controller: context
                                        .read<RegisterCubit>()
                                        .confirmPasswordController,
                                    label: 'Confirm Password',
                                    icon: Icons.lock,
                                    isPassword: true,
                                    validator: (value) =>
                                        Validation.validateConfirmPassword(
                                          value,
                                          context
                                              .read<RegisterCubit>()
                                              .passwordController
                                              .text,
                                        ),
                                  ),
                                  const SizedBox(height: 35),

                                  //Sign Up Button
                                  CustomButton(
                                    text: 'SIGN UP',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<RegisterCubit>().signUp();
                                      } else {
                                        setState(() {
                                          autoValidate =
                                              AutovalidateMode.always;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),

                            //Text Fields
                            const SizedBox(height: 20),

                            //go to Login
                            GlassBox(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already have an account',
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
                                          GoRouter.of(context).go(Routs.login);
                                        },
                                        child: const Text(
                                          'Login',
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
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (state is RegisterCubitLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}

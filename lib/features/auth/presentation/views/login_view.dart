import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/utils/assets.dart';
import 'package:catalyst/core/utils/vlidation.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/features/auth/presentation/cubit/login%20cubit/login_cubit.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_textformfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:catalyst/core/utils/routs.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }else if (state is LoginCubitSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
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
                    child: Column(
                      children: [
                        //logo
                        const SizedBox(height: 120),
                        SvgPicture.asset(Assets.catalyst),
                        const SizedBox(height: 85),
              
                        //Text Fields
                        CustomTextformfield(
                          controller: context
                              .read<LoginCubitCubit>()
                              .emailController,
                          label: 'Email',
                          hintText: 'Enter your email',
                          icon: Icons.email,
                          validator: Validation.validateEmail,
                        ),
                        const SizedBox(height: 15),
                        CustomTextformfield(
                          controller: context
                              .read<LoginCubitCubit>()
                              .passwordController,
                          label: 'Password',
                          hintText: 'Enter your password',
                          icon: Icons.lock,
                          isPassword: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
              
                        //Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(Routs.forgetPassword);
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
                        const SizedBox(height: 35),
              
                        //Login Button
                        CustomButton(
                          text: 'LOGIN',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubitCubit>().login();
                            } else {
                              setState(() {
                                autoValidate = AutovalidateMode.onUserInteraction;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
              
                        //go to Register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Don\'t have an account?',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.likeWhite,
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).push(Routs.register);
                              },
                              child: CustomText(
                                text: 'Sign Up',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.button,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if(state is LoginCubitLoading)
            const Center(child: CircularProgressIndicator(),)
            ],
          );
        },
      ),
    );
  }
}

import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/utils/assets.dart';
import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/utils/vlidation.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/features/auth/presentation/cubit/register%20cubit/register_cubit.dart';
import 'package:catalyst/features/auth/presentation/cubit/register%20cubit/register_state.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
          if(state is RegisterCubitSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.successMessage)),
            );
            GoRouter.of(context).go(Routs.login);
          }else if(state is RegisterCubitError){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
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
                    child: Column(
                      children: [
                        //logo
                        const SizedBox(height: 120),
                        SvgPicture.asset(Assets.catalyst),
                        const SizedBox(height: 50),
              
                        //Text Fields
                        CustomTextformfield(
                          controller: context.read<RegisterCubit>().nameController,
                          label: 'Name',
                          hintText: 'Enter your full name',
                          icon: Icons.person,
                          validator: Validation.validateName,
                        ),
                        const SizedBox(height: 15),
                        CustomTextformfield(
                          controller: context.read<RegisterCubit>().emailController,
                          label: 'Email',
                          hintText: 'Enter your email',
                          icon: Icons.email,
                          validator: Validation.validateEmail,
                        ),
                        const SizedBox(height: 15),
                        CustomTextformfield(
                          controller: context
                              .read<RegisterCubit>()
                              .passwordController,
                          label: 'Password',
                          hintText: 'Enter your password',
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
                          hintText: 'confirm password',
                          icon: Icons.lock,
                          isPassword: true,
                          validator: (value) => Validation.validateConfirmPassword(
                            value,
                            context.read<RegisterCubit>().passwordController.text,
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
                                autoValidate = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
              
                        //go to Login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Already have an account?',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.likeWhite,
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: CustomText(
                                text: 'Login',
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
            if(state is RegisterCubitLoading)
            const Center(child: CircularProgressIndicator(),)
            ],
          );
          },
      ),
    );
  }
}

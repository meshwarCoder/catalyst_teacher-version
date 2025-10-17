import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/core/utils/vlidation.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/features/auth/presentation/cubit/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_textformfield.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.likeWhite),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Form(
            autovalidateMode: autoValidate,
            key: _formKey,
            child: Column(
              children: [
                Spacer(flex: 5,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'New Password',
                    fontSize: 15,
                    color: AppColors.likeWhite,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextformfield(
                  controller: context.read<ForgetPasswordCubit>().passwordController,
                  label: 'Password',
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  isPassword: true,
                  validator: Validation.validatePassword,
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Confirm Password',
                    fontSize: 15,
                    color: AppColors.likeWhite,
                  ),
                ),
                const SizedBox(height: 5),
                CustomTextformfield(
                  controller: context.read<ForgetPasswordCubit>().confirmPasswordController,
                  label: 'Confirm Password',
                  hintText: 'confirm password',
                  icon: Icons.lock,
                  isPassword: true,
                  validator: (value) => Validation.validateConfirmPassword(
                    value,
                    context.read<ForgetPasswordCubit>().passwordController.text,
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: 'RESET PASSWORD',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ForgetPasswordCubit>().resetPassword();
                      GoRouter.of(context).go(Routs.login);
                    }else{
                      setState(() {
                        autoValidate = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const Spacer(flex: 2,),              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
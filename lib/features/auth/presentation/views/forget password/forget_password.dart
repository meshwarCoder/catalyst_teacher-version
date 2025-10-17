import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/features/auth/presentation/cubit/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:catalyst/features/auth/presentation/cubit/forget%20password%20cubit/forget_password_state.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:catalyst/core/utils/routs.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            GoRouter.of(context).push(Routs.verificationCode);
          }
          if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
             Opacity(
              opacity: state is ForgetPasswordLoading ? 0.5 : 1,
               child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    Spacer(flex: 5),
                    Form(
                      autovalidateMode: autoValidate,
                      key: _formKey,
                      child: CustomTextformfield(
                        controller: context
                            .read<ForgetPasswordCubit>()
                            .emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                        icon: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 35),
                    CustomButton(
                      text: 'SEND',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgetPasswordCubit>().forgotPassword();
                        } else {
                          setState(() {
                            autoValidate = AutovalidateMode.onUserInteraction;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Already have an account?',
                          color: AppColors.likeWhite,
                          fontSize: 12,
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).go(Routs.login);
                          },
                          child: CustomText(
                            text: 'Login',
                            color: AppColors.button,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                           ),
             ),
             if (state is ForgetPasswordLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
             ],
          );
        },
      ),
    );
  }
}

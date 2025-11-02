import 'package:catalyst/core/utils/app_colors.dart';
import 'package:catalyst/core/widgets/app_bar.dart';
import 'package:catalyst/core/widgets/custom_text.dart';
import 'package:catalyst/features/auth/presentation/cubit/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:catalyst/features/auth/presentation/cubit/forget%20password%20cubit/forget_password_state.dart';
import 'package:catalyst/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:catalyst/core/widgets/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:catalyst/core/utils/routs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final ValueNotifier<bool> _isValid = ValueNotifier(false);
  String code = '';

  @override
  void dispose() {
    _isValid.dispose();
    super.dispose();
  }

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
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            GoRouter.of(context).push(Routs.resetPassword);
          }
          if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Opacity(
                  opacity: state is ForgetPasswordLoading ? 0.5 : 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 3),
                        CustomText(
                          text: 'Verification Code',
                          fontSize: 18,
                          color: AppColors.likeWhite,
                        ),
                        const SizedBox(height: 20),

                        // 🔹 Pin Code Input
                        PinCodeTextField(
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          cursorColor: AppColors.button,
                          textStyle: GoogleFonts.comfortaa(
                            fontSize: 29,
                            color: AppColors.likeBlack,
                            fontWeight: FontWeight.bold,
                          ),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(12),
                            fieldHeight: 60,
                            fieldWidth: 60,
                            activeFillColor: Colors.white60,
                            inactiveFillColor: Colors.white24,
                            selectedFillColor: AppColors.button.withValues(
                              alpha: 0.7,
                            ),
                            activeColor: AppColors.button,
                            selectedColor: AppColors.button,
                            inactiveColor: Colors.grey,
                          ),
                          enableActiveFill: true,
                          onChanged: (value) {
                            context.read<ForgetPasswordCubit>().code = value;
                            _isValid.value =
                                context
                                    .read<ForgetPasswordCubit>()
                                    .code
                                    .length ==
                                4;
                          },
                        ),

                        const SizedBox(height: 30),

                        // 🔹 Resend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Did not receive the code?',
                              fontSize: 14,
                              color: AppColors.likeWhite,
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {},
                              child: CustomText(
                                text: 'Resend',
                                fontSize: 14,
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // 🔹 Send Button
                        ValueListenableBuilder<bool>(
                          valueListenable: _isValid,
                          builder: (context, valid, _) {
                            return CustomButton(
                              text: 'SEND',

                              backgroundColor: valid
                                  ? null
                                  : AppColors.button.withValues(alpha: 0.3),
                              onPressed: () {
                                if (valid) {
                                  context
                                      .read<ForgetPasswordCubit>()
                                      .verifyCode();
                                }
                              },
                            );
                          },
                        ),

                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Already have an account?',
                              fontSize: 14,
                              color: AppColors.likeWhite,
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () => GoRouter.of(context).go(Routs.login),
                              child: CustomText(
                                text: 'Login',
                                fontSize: 14,
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
                if (state is ForgetPasswordLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}

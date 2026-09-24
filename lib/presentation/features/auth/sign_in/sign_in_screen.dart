import 'package:base_project/presentation/base/base_widget.dart';
import 'package:base_project/presentation/custom/widgets/custom_button.dart';
import 'package:base_project/presentation/custom/widgets/custom_text_field.dart';
import 'package:base_project/presentation/custom/widgets/keyboard_dismiss.dart';
import 'package:base_project/presentation/custom/widgets/loader.dart';
import 'package:base_project/presentation/features/auth/sign_in/cubit/sign_in_cubit.dart';

import '../../../../util/core_export.dart';

class SignInScreen extends BaseWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SignInCubit, ApiRenderState>(
            buildWhen: (previous, current) => current is Loading || current is ApiSuccess || current is ApiFailure,
            builder: (context, state) {
              final cubit = context.read<SignInCubit>();
              return KeyboardDismissWrapper(
                child: StackLoader(
                  state: state,
                  content: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        twoColorTitle(title: Strings.welcome(), coloredTitle: Strings.back()),
                        12.h.verticalSpace,
                        Text(Strings.loginInstruction(), style: dmSans400()),
                        32.h.verticalSpace,
                        CustomTextField(
                          titleText: Strings.emailAddress(),
                          hintText: Strings.eEmailAddress(),
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (_) => cubit.onFieldChanged(),
                        ),
                        16.h.verticalSpace,
                        CustomTextField(
                          titleText: Strings.password(),
                          hintText: Strings.ePassword(),
                          controller: cubit.passwordController,
                          isPassword: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onChanged: (_) => cubit.onFieldChanged(),
                        ),
                        32.h.verticalSpace,
                        BlocBuilder<SignInCubit, ApiRenderState>(
                          buildWhen: (previous, current) => current is OnChanged,
                          builder: (context, _) => CustomButton(
                            text: Strings.login(),
                            isDisabledCondition: () => cubit.isButtonDisabled,
                            onTap: () {
                              hideKeyBoard(context);
                              cubit.onTapSignIn();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

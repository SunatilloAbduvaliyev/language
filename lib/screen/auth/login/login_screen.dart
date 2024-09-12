import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/screen/widgets/change_language_button.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/auth_cubit/auth_cubit.dart';
import '../../../cubit/auth_cubit/auth_state.dart';
import '../../../data/model/forms_status.dart';
import '../../../utils/color/app_colors.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/style/app_text_style.dart';
import '../../../utils/ui_utils/ui_utils.dart';
import '../../route.dart';
import '../../widgets/login_button.dart';
import '../widget/input_text.dart';
import '../widget/row_item_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("____________________________________----build run login");
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.c356899.withOpacity(0.6),
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 50.h),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthState>(
              builder: (BuildContext context, AuthState state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Align(
                        alignment: Alignment.topLeft,
                        child: changeLanguageButton(context),
                      ),
                      Center(
                        child: Text(
                          'Welcome Back',
                          style: AppTextStyle.semiBold.copyWith(
                            fontSize: 30.w,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      11.boxH(),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                        style: AppTextStyle.regular.copyWith(
                          fontSize: 12.w,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      64.boxH(),
                      Text(
                        'email'.tr(),
                        style: AppTextStyle.semiBold,
                      ),
                      10.boxH(),
                      InputText(
                        controller: _emailController,
                        title: 'email'.tr(),
                        regExp: AppConstants.emailRegExp,
                        errorText: "email_error".tr(),
                      ),
                      15.boxH(),
                      Text(
                        'password'.tr(),
                        style: AppTextStyle.semiBold,
                      ),
                      10.boxH(),
                      InputText(
                        controller: _passwordController,
                        title: 'password'.tr(),
                        regExp: AppConstants.passwordRegExp,
                        isPassword: true,
                        errorText: "password_error".tr(),
                      ),
                      30.boxH(),
                      LoginButton(
                        title: 'login'.tr(),
                        onTap: state.status == FormsStatus.success
                            ? () {}
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                }
                              },
                        isLoading: state.status == FormsStatus.loading,
                        success: state.status == FormsStatus.success,
                      ),
                      16.boxH(),
                      Center(
                        child: rowButtonItem(
                          onTap: state.status == FormsStatus.loading
                              ? () {}
                              : () {
                                  context.read<AuthCubit>().initialState();
                                  Navigator.pushReplacementNamed(
                                      context, RouteName.register);
                                },
                          login: true,
                        ),
                      )
                    ],
                  ),
                );
              },
              listenWhen: (lastState, currentState) =>
                  currentState.status == FormsStatus.error ||
                  currentState.status == FormsStatus.success,
              listener: (BuildContext context, AuthState state) {
                if (state.status == FormsStatus.success) {
                  context.read<UserBloc>().add(FetchUserEvent(userDocId: state.user!.uid));
                  Navigator.pushNamed(context, RouteName.tabBoxScreen);
                }
                if (state.status == FormsStatus.error) {
                  showErrorMessage(
                    message: state.errorMessage,
                    context: context,
                    onTap: () {
                      context.read<AuthCubit>().initialState();
                      Navigator.pop(context);
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:english/cubit/grammar_cubit/grammar_cubit.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_bloc/user_bloc.dart';
import '../../../bloc/user_bloc/user_event.dart';
import '../../../cubit/auth_cubit/auth_cubit.dart';
import '../../../cubit/auth_cubit/auth_state.dart';
import '../../../data/model/forms_status.dart';
import '../../../data/model/grammar/grammar_model.dart';
import '../../../data/model/user/user_model.dart';
import '../../../utils/color/app_colors.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/style/app_text_style.dart';
import '../../../utils/ui_utils/ui_utils.dart';
import '../../route.dart';
import '../../widgets/change_language_button.dart';
import '../../widgets/global_button.dart';
import '../widget/input_text.dart';
import '../widget/row_item_button.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    debugPrint("____________________________________----build run");
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
                      30.boxH(),
                      Text(
                        'name'.tr(),
                        style: AppTextStyle.semiBold,
                      ),
                      10.boxH(),
                      Row(
                        children: [
                          Expanded(
                            child: InputText(
                              controller: _firstNameController,
                              title: 'first_name'.tr(),
                              regExp: AppConstants.nameRegExp,
                              errorText: "name_error".tr(),
                            ),
                          ),
                          5.boxW(),
                          Expanded(
                            child: InputText(
                              controller: _lastNameController,
                              title: 'last_name'.tr(),
                              regExp: AppConstants.nameRegExp,
                              errorText: "name_error".tr(),
                            ),
                          ),
                        ],
                      ),
                      15.boxH(),
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
                      25.boxH(),
                      LoginButton(
                        title: 'register'.tr(),
                        onTap: state.status == FormsStatus.success? (){}:() {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().register(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _firstNameController.text,
                            );
                          }
                        },
                        isLoading: state.status == FormsStatus.loading ,
                        success: state.status == FormsStatus.success,
                      ),
                      15.boxH(),
                      16.boxH(),
                      Center(
                        child: rowButtonItem(
                          onTap: state.status == FormsStatus.loading
                              ? () {}
                              : () {
                            context.read<AuthCubit>().initialState();
                            Navigator.pushReplacementNamed(
                                context, RouteName.login);
                          },
                          login: false,
                        ),
                      )
                    ],
                  ),
                );
              },
              listenWhen: (previous, current) =>
              current.status == FormsStatus.success ||
                  current.status == FormsStatus.error,
              listener: (BuildContext context, AuthState state) {
                if (state.status == FormsStatus.success) {
                  UserModel userModel = UserModel.initialValue();
                  userModel = userModel.copyWith(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                  );
                  if(context.read<GrammarCubit>().state.status == FormsStatus.success){
                    List<GrammarModel> grammarLikes = context.read<GrammarCubit>().state.grammarData;
                    context.read<UserBloc>().add(
                      InsertUserEvent(
                          insertUserData: userModel,
                          isGrammarSuccess: true,
                          grammarLikes: grammarLikes,
                      ),
                    );
                  }else{
                    context.read<UserBloc>().add(
                      InsertUserEvent(
                        insertUserData: userModel,
                        isGrammarSuccess: false,
                        grammarLikes: [],
                      ),
                    );
                  }
                  Navigator.pushReplacementNamed(context, RouteName.tabBoxScreen);
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
    _firstNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
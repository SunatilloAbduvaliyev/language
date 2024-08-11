import 'package:easy_localization/easy_localization.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_state.dart';
import '../../utils/style/app_text_style.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool navigatePop;

  const GlobalAppBar({
    super.key,
    required this.title,
    this.actions,
    this.navigatePop = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state.status == FormsStatus.success ||
            state.status == FormsStatus.updateLoading) {
          return AppBar(
            leading: navigatePop
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${context.read<UserBloc>().state.userData.firstName.substring(0, 1)}${context.read<UserBloc>().state.userData.lastName.substring(0, 1)}',
                          style: AppTextStyle.bold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
            title: Text(
              title.tr(),
              style: AppTextStyle.bold.copyWith(
                fontSize: 18,
              ),
            ),
            actions: actions,
            centerTitle: true,
          );
        }
        return AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          title: Text(
            title.tr(),
            style: AppTextStyle.bold.copyWith(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

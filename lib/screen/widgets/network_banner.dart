import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/style/app_text_style.dart';

class NetworkBanner extends StatelessWidget {
  const NetworkBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: Text(
        "network_error".tr(),
        style: AppTextStyle.bold.copyWith(
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: Text(
            'ok'.tr(),
            style: AppTextStyle.bold,
          ),
        ),
      ],
      backgroundColor: Colors.red,
    );
  }
}

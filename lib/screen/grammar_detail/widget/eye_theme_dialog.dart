import 'package:flutter/material.dart';
import '../../../utils/color/app_colors.dart';

void showModalDialog({
  required BuildContext context,
  required void Function(Color backgroundColor, Color textColor) onColorsChanged,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        height: 300.0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mavzuni tanlang',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: const Text('Qorong\'i Mavzu (Dark Mode)'),
                onTap: () {
                  onColorsChanged(
                    AppColors.darkModeBackground,
                    AppColors.darkModeText,
                  );
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                title: const Text('Yorug\' Mavzu (Light Mode)'),
                onTap: () {
                  onColorsChanged(
                    AppColors.cF3F3F3,
                    AppColors.lightModeText,
                  );
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFF4ECD8),
                ),
                title: const Text('Sepiya Mavzu (Sepia Mode)'),
                onTap: () {
                  onColorsChanged(
                    AppColors.sepiaModelBackground,
                    AppColors.sepiaModelText,
                  );
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE8F5E9),
                ),
                title: const Text('Pastel Mavzu (Pastel Mode)'),
                onTap: () {
                  onColorsChanged(
                    AppColors.pastelModelBackground,
                    Colors.green,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

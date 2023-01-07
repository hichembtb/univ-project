import 'package:flutter/material.dart';

import '../../constant/colors/app_color.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    Key? key,
    required this.onPressed,
    required this.actionText,
  }) : super(key: key);
  final void Function()? onPressed;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.kRedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        actionText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

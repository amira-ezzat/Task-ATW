import 'package:flutter/material.dart';
import 'package:task_atw/core/constant/colors.dart';
import 'package:task_atw/core/utils/app_texts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(13),
          backgroundColor: AppColor.indigoColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: AppColor.indigoColor)
            : AppTexts(
          data: text,
          textColor: Colors.white,
        ).bodyMS(),
      ),
    );
  }
}

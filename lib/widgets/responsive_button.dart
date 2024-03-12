import 'package:flutter/material.dart';
import 'package:munch/utils/my_colors.dart';
import 'package:munch/widgets/texts.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  final VoidCallback onTap;

  ResponsiveButton(
      {Key? key, this.isResponsive = false, this.width, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? H2Text(
                    text: '  Place order now',
                    color: Colors.white,
                  )
                : const SizedBox(),
            const Icon(
              Icons.arrow_right_rounded,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: MyColors.primary,
          fixedSize: Size(isResponsive == true ? double.maxFinite : 112, 48),
        ),
      ),
    );
  }
}

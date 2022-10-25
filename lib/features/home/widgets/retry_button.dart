import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';

class RetryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const RetryButton({
    super.key,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeMg.height(30),
        width: SizeMg.width(100),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(SizeMg.radius(3)),
        ),
        child: Text(
          buttonText,
          style: theme.textTheme.button,
        ),
      ),
    );
  }
}

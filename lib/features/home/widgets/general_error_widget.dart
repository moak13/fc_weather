import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';
import 'retry_button.dart';

class GeneralErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onTap;
  const GeneralErrorWidget({
    super.key,
    required this.errorMessage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return Container(
      width: SizeMg.width(250),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: SizeMg.width(10),
        right: SizeMg.width(10),
        top: SizeMg.height(10),
        bottom: SizeMg.height(10),
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(SizeMg.radius(10)),
      ),
      child: Column(
        children: [
          Text(
            'Error!!',
            style: theme.textTheme.headline3,
          ),
          SizedBox(
            height: SizeMg.height(10),
          ),
          Text(
            errorMessage,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(
            height: SizeMg.height(15),
          ),
          RetryButton(
            buttonText: 'Retry',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

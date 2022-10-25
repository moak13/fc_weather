import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';

class ReportDataWidget extends StatelessWidget {
  final String title;
  final int? data;
  const ReportDataWidget({
    super.key,
    required this.title,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return Container(
      height: SizeMg.height(100),
      width: SizeMg.width(100),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(SizeMg.radius(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyText1?.copyWith(
              fontSize: SizeMg.text(14),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeMg.height(20),
          ),
          Text(
            '$data',
            style: theme.textTheme.bodyText1?.copyWith(
              fontSize: SizeMg.text(14),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/wrapper_viewmodel.dart';
import 'widget/get_index_widget.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
      viewModelBuilder: () => WrapperViewModel(),
      builder: (
        BuildContext context,
        WrapperViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: GetIndexWidget(
            index: model.currentIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ],
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/utils/size_manager.dart';
import '../../core/utils/string_util.dart';
import 'view_model/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (
        BuildContext context,
        SettingsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: SizeMg.width(20),
                right: SizeMg.width(20),
                top: SizeMg.height(20),
              ),
              children: [
                Text(
                  'Settings',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: SizeMg.text(30),
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(20),
                ),
                ListTile(
                  title: Text(
                    'Switch Theme',
                    style: theme.textTheme.bodyMedium,
                  ),
                  trailing: Switch.adaptive(
                    activeColor: Colors.red,
                    inactiveThumbColor: Colors.grey,
                    value: model.isDark,
                    onChanged: (value) {
                      model.actionSwitchTheme();
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Temperature',
                    style: theme.textTheme.bodyMedium,
                  ),
                  trailing: SizedBox(
                    height: SizeMg.height(30),
                    width: SizeMg.width(100),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                          size: SizeMg.width(24),
                        ),
                        items:
                            model.tempList.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (StringUtil.isEmpty(value) ||
                              value == 'Please Select') {
                            return;
                          }
                          model.actionSwitchTemp(value);
                        },
                        isExpanded: true,
                        hint: Text(
                          model.temperature ?? 'Please Select',
                          style: theme.textTheme.bodySmall,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theme_handler/consumer/theme_switcher.dart';
import 'package:tris/src/common_widgets/scaffold_custom.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      widget: Center(
        child: Switch(
          value: isLightMode,
          onChanged: (value) {
            isLightMode = value;
            if (isLightMode) {
              setState(() {
                ThemeSwitcher(context: context).switchToLight();
              });
            } else {
              setState(() {
                ThemeSwitcher(context: context).switchToDark();
              });
            }
          },
        ),
      ),
      title: "Settings",
    );
  }
}

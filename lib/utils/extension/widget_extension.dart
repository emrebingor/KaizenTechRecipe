import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

extension WidgetExtension on Widget {
  Widget withLoading(bool isLoading) {
    return Stack(
      children: <Widget>[
        this,
        AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: isLoading ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: ColorExtension.brand_primary,
              ),
            ),
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

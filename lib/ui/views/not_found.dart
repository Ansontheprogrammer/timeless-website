import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/services/locator.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/adaptive/layout.dart';
import 'package:timeless_app/ui/widgets/home/landing_page_content.dart';

/// Creates a not found view
///
class NotFound extends StatelessWidget {
  NotFound();

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CustomTextNormal(
            text: 'Sorry this page is not found',
          ),
        ]));
  }
}

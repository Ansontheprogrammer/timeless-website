import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:timeless_app/ui/shared/layout.dart';
import 'package:timeless_app/ui/widgets/navigation/footer/footer.dart';

/// Creates a SingleChildScrollView that will display the footer on web
///
/// Will also push the the footer to the bottom of the view to prevent UI issues.
class ScrollablePageContent extends StatelessWidget {
  const ScrollablePageContent({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Layout widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (kIsWeb)
            SizedBox(
              height: 100,
            ),

          /// Set a minimum page height, mainly used for the webview to push the footer to the bottom of the display height
          ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.6),
              child: widget.pageContent),

          /// Create a footer for the web views
          if (kIsWeb) Footer()
        ],
      ),
    );
  }
}

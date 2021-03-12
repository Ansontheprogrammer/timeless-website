import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';

class MobileRecommendSection extends StatelessWidget {
  const MobileRecommendSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LeftColumnRecommended(),
        SizedBox(
          height: 50,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextCaption(
                text: 'New',
              ),
              ContainerSpacer(),
              CustomTextNormal(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              ),
              ContainerSpacer(),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.filled(
                  displayedOnTabletOrSmaller ? 3 : 9,
                  Slidable(
                    actionPane: SlidableScrollActionPane(),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.blue,
                        icon: Icons.archive,
                        // onTap: () => _showSnackBar(context, 'Archive'),
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        // onTap: () => _showSnackBar(context, 'Share'),
                      ),
                    ],
                    child: ListTile(
                      tileColor: Colors.black12,
                      title: CustomTextHeadline(text: "Jenny's"),
                      subtitle: CustomTextCaption(
                        text: 'Cleaning Business',
                        fontSize: 12.0,
                      ),
                      trailing: Icon(Icons.business),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

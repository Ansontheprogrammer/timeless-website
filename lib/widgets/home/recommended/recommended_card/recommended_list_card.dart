import 'package:flutter/cupertino.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_card.dart';

List<RecommendedCard> listOfCards = [
  RecommendedCard(),
  RecommendedCard(),
  RecommendedCard(),
  RecommendedCard(),
  RecommendedCard(),
  RecommendedCard(),
];

class RecommendedListCard extends StatelessWidget {
  const RecommendedListCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 5.0,
      runSpacing: 5.0,
      children: [
        RecommendedCard(),
        RecommendedCard(),
      ],
    );
  }
}

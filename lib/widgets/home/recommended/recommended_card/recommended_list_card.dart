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
  const RecommendedListCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: listOfCards,
    );
  }
}

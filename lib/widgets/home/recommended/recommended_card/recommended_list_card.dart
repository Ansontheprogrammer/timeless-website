import 'package:flutter/cupertino.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_card.dart';

List<RecommendedCard> listOfCards = [
  RecommendedCard(),
  RecommendedCard(),
  RecommendedCard(),
  // RecommendedCard(),
  // RecommendedCard(),
  // RecommendedCard(),
];

class RecommendedListCard extends StatelessWidget {
  final bool useHorizontal;
  const RecommendedListCard({required this.useHorizontal});

  @override
  Widget build(BuildContext context) {
    // return !this.useHorizontal
    //     ? Column(
    //         children: listOfCards,
    //       )
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: listOfCards,
    );
  }
}

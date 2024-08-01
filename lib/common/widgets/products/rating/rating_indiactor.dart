import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        itemCount: 5, //by default it takes 5
        rating: rating,
        itemSize: 20,
        unratedColor: Colors.grey,
        itemBuilder: (_, __) => Icon(
          Iconsax.star5,
          color: TColors.primary,
        ));
  }
}
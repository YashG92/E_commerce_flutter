import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ]
                .map((option) => DropdownMenuItem(
              child: Text(option),
              value: option,
            ))
                .toList(),
            onChanged: (value) {}),

        SizedBox(height: TSizes.spaceBtwSections,),
        /// Products
        TGridLayout(itemCount: 8, itemBuilder: (_,index) => TProductCardVertical())
      ],
    );
  }
}
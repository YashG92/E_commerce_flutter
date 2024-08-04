import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount:2 ,
      itemBuilder: (_, index) => Column(
        children: [
          ///Cart Item
          TCartItem(),
          if(showAddRemoveButtons)SizedBox(height: TSizes.spaceBtwItems,),

          /// Add remove buttom row with total price
          if(showAddRemoveButtons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  ///Add remove button

                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '2500'),
            ],
          )
        ],
      ),
    );
  }
}

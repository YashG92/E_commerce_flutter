import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹ 2500', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2,),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹ 50', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹ 2500', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2,),
        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹ 2500', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

      ],
    );
  }
}

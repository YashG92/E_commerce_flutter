import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(itemBuilder: (_,index) => TRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(TSizes.md),
      backgroundColor: dark ? TColors.dark : TColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            ///Row-1
            children: [
              ///Icon 1
              Icon(Iconsax.ship),
              SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),

              ///Status & Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.primary, fontWeightDelta: 1),
                    ),
                    Text(
                      '04 Aug 2024',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              ///Icon 2
              IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems,),

          ///Row-2
          Row(
            children: [
              Expanded(
                child: Row(

                  children: [
                    ///Icon 1
                    Icon(Iconsax.tag),
                    SizedBox(
                      width: TSizes.spaceBtwItems / 2,
                    ),

                    ///Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text(
                            '[#2135ac]',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(

                  children: [
                    ///Icon 1
                    Icon(Iconsax.calendar),
                    SizedBox(
                      width: TSizes.spaceBtwItems / 2,
                    ),

                    ///Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text(
                            '05 Aug 2024',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ), separatorBuilder: (_,__) => SizedBox(height: TSizes.spaceBtwItems,), itemCount: 10, shrinkWrap: true,);
  }
}

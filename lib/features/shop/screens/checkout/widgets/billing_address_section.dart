import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Yash G', style: Theme.of(context).textTheme.bodyLarge,),

        SizedBox(height: TSizes.spaceBtwItems/2,),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('+91 7698409883', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.location_city, color: Colors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('apartment, rajkot, gujarat, 360005, india', style: Theme.of(context).textTheme.bodyMedium,  softWrap: true,)),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  items: [
                    'Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'
                  ].map((option)=> DropdownMenuItem(child: Text(option), value: option,) ).toList(),

                  onChanged: (value) {})
            ],
          ),
        ),
      ),
    );
  }
}

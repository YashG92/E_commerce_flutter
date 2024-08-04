import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sub Categories
              Column(
                children: [
                  ///Heading
                  TSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context,index) => SizedBox(width: TSizes.spaceBtwItems,),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => TProductCardHorizontal(),

                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

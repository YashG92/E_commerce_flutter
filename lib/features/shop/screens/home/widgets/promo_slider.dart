import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/features/shop/controller/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(
        (){
          //Loader
          if(controller.isLoading.value) return const ShimmerEffect(width: double.infinity, height: 190);

          //No data
          if(controller.banners.isEmpty){
            return const Center(child: Text('No data Found!'));
          }else{
            return Column(
              children: [
                CarouselSlider(
                  items: controller.banners.map((banner) => TRoundedImage(
                    imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: ()=> Get.toNamed(banner.targetScreen),))
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, _) => controller.updatePageIndicator(index),
                    viewportFraction: 1,
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Center(
                  child: Obx(
                        () =>
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < controller.banners.length; i++)
                              TCircularContainer(
                                width: 20,
                                height: 4,
                                margin: EdgeInsets.only(right: 10),
                                backgroundColor: controller.carousalCurrentIndex
                                    .value == i ? TColors.primary : TColors.grey,
                              ),
                          ],
                        ),
                  ),
                )
              ],
            );
          }

        }
    );
  }
}

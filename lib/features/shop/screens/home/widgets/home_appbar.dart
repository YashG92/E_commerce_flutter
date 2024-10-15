import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/shimmer.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            (){ if(controller.profileLoading.value){
              return const ShimmerEffect(width: 80, height: 15);
            }return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            );}
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconcolor: TColors.white,
        )
      ],
    );
  }
}

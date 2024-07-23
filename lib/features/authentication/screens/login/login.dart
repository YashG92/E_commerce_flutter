import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title and Subtitle
              const TLoginHeader(),

              ///Form
              const TLoginForm(),

              ///Divider

               TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ///Footer
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}









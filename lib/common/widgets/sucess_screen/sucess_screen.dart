import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6), // Display Lottie animation

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Title and Subtitle

              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                'support@yg.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue)),),

            ],
          ),
        ),
      ),
    );
  }
}

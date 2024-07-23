import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Provide some padding to avoid overflow
      child: Row(
        children: [
          SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(value: true, onChanged: (value) {})),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Expanded( // Ensure text doesn't overflow
            child: Text.rich(TextSpan(
                children: [
                  TextSpan(text: '${TTexts.iAgreeTo}', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )),
                  TextSpan(text: '${TTexts.and}', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '${TTexts.termsOfUse}', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )),
                ]
            )),
          )
        ],
      ),
    );
  }
}

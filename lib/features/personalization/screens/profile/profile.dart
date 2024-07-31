import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          ///Profile Picture
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(image: TImages.user, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: Text('Change Profile Picture'))
                  ],
                ),
              ),
              ///Details
              SizedBox(height: TSizes.spaceBtwItems/2,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              ///Heading Profile Info
              TSectionHeading(title: 'Profile Information', showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(onPressed: () {  },title: 'Name', value: 'Yash G',),
              TProfileMenu(onPressed: () {  },title: 'Username', value: 'YashG92',),

              SizedBox(height: TSizes.spaceBtwItems,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              ///Heading Personal Info
              TSectionHeading(title: 'Personal Information', showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(onPressed: () {},title: 'User ID', value: '12345', icon: Icons.copy,),
              TProfileMenu(onPressed: () {  },title: 'E-mail', value: 'yg@gmail.com',),
              TProfileMenu(onPressed: () {  },title: 'Phone Number', value: '+91-7698409883',),
              TProfileMenu(onPressed: () {  },title: 'Gender', value: 'Male',),
              TProfileMenu(onPressed: () {  },title: 'Date of Birth', value: '23 Dec 2003',),
              const Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )



            ],
          ),



        ),
      ),
    );
  }
}


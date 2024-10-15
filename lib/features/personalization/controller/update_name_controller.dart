import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';


///Controller to manage user -related functionality
class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///Fetch user record
  Future<void>  initializeNames()async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }

      //Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      //Update user first and last name in firebase firestore
      Map<String,dynamic> name= {'FirstName' : firstName.text.trim(),'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      //Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();


      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      //Move to previous screen
      Get.off(const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      // Show some Generic error to user
      TLoaders.warningSnackBar(title: 'Oh Bad!', message: e.toString());
    }

  }


}
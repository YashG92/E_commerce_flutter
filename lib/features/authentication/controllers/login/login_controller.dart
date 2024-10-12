import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  ///Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');

    super.onInit();
  }

  /// Email and password login
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging in ....', TImages.docerAnimation);
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      //Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //Login user using email and pass auth
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      // Show some Generic error to user
      TLoaders.warningSnackBar(title: 'Oh Bad!', message: e.toString());
    }
  }
}

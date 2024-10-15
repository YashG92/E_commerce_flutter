import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/model/user_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';

import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

///Repo class for user related operations
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
///Functions to save user data
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///Functions to fetch user detail based on User ID
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///Functions to update user data in FireStore
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///Functions to update any specific User Collection
  Future<void> updateSingleField(Map<String,dynamic> json) async{
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///Functions to remove user data from Fire store
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("Users").doc(userId).delete();
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}


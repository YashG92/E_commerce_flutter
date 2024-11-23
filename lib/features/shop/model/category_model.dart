import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.image,
    this.parentId = '',
  });

  ///Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', isFeatured: false, name: '', image: '');

  ///Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  ///Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //Map JSON record to the model
      return CategoryModel(
          id: document.id,
          isFeatured: data['IsFeatured'] ?? false,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '');
    }else{
      return CategoryModel.empty();
    }
  }
}

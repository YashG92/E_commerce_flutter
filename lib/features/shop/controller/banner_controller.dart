import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/model/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{
  final Rx<int> carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();

  }

  ///Fetch Banners
  Future<void> fetchBanners() async{
    try{
      // Show loader while loading categories
      isLoading.value= true;

      //Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);


    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      //Remove Loader
      isLoading.value = false;
    }
  }
}
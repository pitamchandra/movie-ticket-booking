import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/movies/data/coming_model.dart';
import 'package:movie_ticket_booging/futures/movies/data/now_model.dart';

class MoviesController extends GetxController {
  var nowPlayingList = <NowModel>[].obs;
  var comingSoonList = <ComingModel>[].obs;

  var selectedTab = 'now'.obs;

  void switchTab(String tab) {
    selectedTab.value = tab;
  }

  @override
  void onInit() {
    loadNowPlaying();
    loadComingPlaying();
    super.onInit();
  }

  void loadNowPlaying() {
    nowPlayingList.value = [
      NowModel(
        title: 'batman_superman'.tr,
        duration: 'time1'.tr,
        rating: 'rating1',
        imageUrl: 'assets/images/onbording3.png',
        action: 'action_ci_fi'.tr,
      ),
      NowModel(
        title: 'shang_chi'.tr,
        duration: 'time'.tr,
        rating: 'rating',
        imageUrl: 'assets/images/onbording4.png',
        action: 'action_ci_fi'.tr,
      ),
      NowModel(
        title: 'avengers_infinity'.tr,
        duration: 'time2'.tr,
        rating: 'rating2',
        imageUrl: 'assets/images/movie1.png',
        action: 'action_ci_fi'.tr,
      ),
      NowModel(
        title: 'guardians_of_galaxy'.tr,
        duration: 'time3'.tr,
        rating: 'rating3',
        imageUrl: 'assets/images/onbording5.png',
        action: 'action_ci_fi'.tr,
      ),
    ];
  }

  void loadComingPlaying() {
    comingSoonList.value = [
      ComingModel(
        title: 'avatar_water'.tr,
        date: 'date'.tr,
        adventure: 'adventure_sci_fi'.tr,
        imageUrl: 'assets/images/onbording1.png',
      ),
      ComingModel(
        title: 'ant_uantumania'.tr,
        date: 'date1'.tr,
        adventure: 'adventure_sci_fi'.tr,
        imageUrl: 'assets/images/onbording2.png',
      ),
      ComingModel(
        title: 'shazam_gods'.tr,
        date: 'date2'.tr,
        adventure: 'adventure_sci_fi'.tr,
        imageUrl: 'assets/images/coming.png',
      ),
      ComingModel(
        title: 'kot_amotax'.tr,
        date: 'date3'.tr,
        adventure: 'adventure_sci_fi'.tr,
        imageUrl: 'assets/images/coming1.png',
      ),
    ];
  }
}

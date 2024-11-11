import 'ads_service.dart';
import 'ads_model.dart';

class AdsController {
  final AdsService _service = AdsService();

  Future<List<Ad>> fetchAds() async {
    return await _service.getAds();
  }
}

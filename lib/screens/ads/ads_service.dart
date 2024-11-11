import 'ads_model.dart';

class AdsService {
  Future<List<Ad>> getAds() async {
    // هنا سيكون الكود الذي يجلب البيانات من السيرفر أو مصدر خارجي
    // حاليًا، سنستخدم بيانات وهمية للتجربة

    await Future.delayed(Duration(seconds: 2)); // محاكاة لوقت الاستجابة

    return [
      Ad(title: 'إعلان 1', description: 'تفاصيل الإعلان 1'),
      Ad(title: 'إعلان 2', description: 'تفاصيل الإعلان 2'),
    ];
  }
}

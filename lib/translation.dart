import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "English": "English",
          "My coins":"My coins",
          "Purchased coins":"Purchased coins",
         
        },
        'ar_AE': {
          "Promo code not found": "لم يتم العثور على الرمز الترويجي",
          "My coins":"لم يتم العثور",
          "Purchased coins":"لم يتم العثور على الرمز الترويجي"
         
        }
      };
}

import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
 String? phoneNumber = '';
 bool isLoading = false;


 Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");


  @override
  void onInit() {
    super.onInit();
    phoneNumber;
    updateSelectedCountry(country: selectedCountry);
    update();
  }

  void updateSelectedCountry({Country? country}) {
    if (country != null) {
      selectedCountry = country;
      update();
    }
  }
 void toggleLoading() {
   isLoading = !isLoading;
   update();
 }
}
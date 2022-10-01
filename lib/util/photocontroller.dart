import 'package:get/get.dart';

class Photocontroller extends GetxController {
  var isProficpicpathset = false.obs;
  var profilepicpath = ''.obs;

  void setprofileimagepath(String path) {
    profilepicpath.value = path;
    isProficpicpathset.value = true;
  }
}

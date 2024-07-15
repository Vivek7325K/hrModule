import '../models/attachment_credential_model.dart';
import '../models/attachment_model.dart';
import '../models/user_model.dart';
import '../services/authService.dart';
import '../utilities/pref.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  Rx<UserModel> user = UserModel().obs;
  Rx<AttachmentCredentialsModel> attchmentCreds = AttachmentCredentialsModel().obs;
  Rx<bool> isUpdated = false.obs;

  Future<bool> authMe(bool force) async {
    AuthenticationService authService = AuthenticationService();
    String token = await authService.getAtuthToken();
    if (force || token != "") {
      var response = await authService.apiAuthMe();
      if (response != '') {
        user.value = response;
        user.refresh();
        return true;
      } else {
        // print('Error in apiAuthMe() CONTROLLER : returned empty string');
        return false;
      }
    }
    return false;
  }

  getSecureStorageToken(String storageId, String fileExtension) async {
    AuthenticationService authService = AuthenticationService();
    await authService
        .getSecureStorageToken(
            storageId: storageId, fileExtension: fileExtension)
        .then((response) {
      attchmentCreds.value = response;
      attchmentCreds.refresh();
    });
  }
}
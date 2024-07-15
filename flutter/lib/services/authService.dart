import 'dart:convert';
import '../config/config.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../models/attachment_credential_model.dart';
import '../models/user_model.dart';
import '../utilities/pref.dart';

String serverAddress = Config.baseURL;
String tenant = Config.tenant;
var uuid = const Uuid();

class AuthenticationService {
  Future<String> getAtuthToken() async {
    String token = await Pref.read('token');
    return token;
  }

  Future<String> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse('$serverAddress/auth/sign-in'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'tenantId': tenant
        }),
      );
      if (response.statusCode == 200) {
        String token = response.body;
        await Pref.write('token', token);
        return "";
      } else if (response.body.toString().toLowerCase().startsWith('sorry')) {
        return response.body.toString();
      } else {
        return response.reasonPhrase.toString();
      }
      // await populateCurrentUser(authResult.user!);
    } catch (e) {
      return "Something went wrong";
    }
  }

  Future<String> signup({
    required String email,
    required String password,
    required String phoneNumber,
    required String phonePrefix,
    required String referralCode,
  }) async {
    try {
      /*
      {
  "email": "adnan@gmail.com",
  "password": "123456",
  "invitationToken": null,
  "type": "customer",
  "referencedBy": "CCM-I8Z8J6",
  "phoneNumber": "911112223334",
  "phonePrefix": "91",
  "tenantId": "b164ff9b-47d2-4b22-b3ec-3d0c69973188"
} */
      var response = await http.post(
        Uri.parse('$serverAddress/auth/sign-up'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'phonePrefix': phonePrefix,
          'tenantId': tenant,
        }),
      );
      if (response.statusCode == 200) {
        String token = response.body;
        await Pref.write('token', token);
        return "";
      } else {
        return response.reasonPhrase.toString();
      }
      // await populateCurrentUser(authResult.user!);
    } catch (e) {
      return "Something went wrong";
    }
  }

  Future signOut() async {
    await Pref.write('token', "");
    return true;
  }

  Future apiAuthMe() async {
    String token = await getAtuthToken();
   try {
      var response = await http
          .get(Uri.parse('$serverAddress/auth/me'), headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print('bearer token : ' + token.toString());
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        UserModel userDetail = UserModel.fromJson(jsonResponse);
        return userDetail;
      } else {
        //throw Exception(response.reasonPhrase);
        return '';
      }
    } catch (e) {
      //throw Exception(e.toString());
      return '';
    }
  }


  Future getSecureStorageToken(
      {required String storageId, required String fileExtension}) async {
    String token = await getAtuthToken();
    try {
      String fileName = "${uuid.v4()}.$fileExtension";
      var response = await http.get(
          Uri.parse(
              '$serverAddress/tenant/$tenant/file/credentials?filename=$fileName&storageId=$storageId'),
          headers: <String, String>{
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        AttachmentCredentialsModel creds =
            AttachmentCredentialsModel.fromJson(jsonResponse);
        return creds;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  
}
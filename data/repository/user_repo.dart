import 'package:get/get.dart';
import 'package:gospela1/data/api/api_client.dart';
import 'package:gospela1/utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}

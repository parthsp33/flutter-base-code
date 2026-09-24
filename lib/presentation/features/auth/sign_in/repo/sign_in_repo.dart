import 'package:base_project/data/api/api_caller.dart';
import 'package:base_project/data/api/api_constants.dart';
import 'package:base_project/data/model/base_response.dart';

class SignInRepo extends ApiCaller {
  Future<BaseResponse> signIn({required Map<String, dynamic> reqData}) {
    return execute(() => apiService.post(url: ApiConstants.signIn, data: reqData));
  }
}

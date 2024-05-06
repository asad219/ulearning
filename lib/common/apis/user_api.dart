import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/utils/http_util.dart';

class UserApi {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('/api/auth/register', queryParameters: params?.toJson());

    print(response.toString());
  }
}

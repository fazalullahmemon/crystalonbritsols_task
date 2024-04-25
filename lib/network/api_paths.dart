import 'package:crystalonbritsols_task/network/api_base.dart';

enum ApiPath { tokens, departments, users }

String getPath(ApiPath value) {
  switch (value) {
    // API Paths
    case ApiPath.tokens:
      return "${ApiBase.baseUrl}/${ApiBase.apiV1}/authorization/tokens";
    case ApiPath.departments:
      return "${ApiBase.baseUrl}/${ApiBase.apiV1}/departments";

    default:
      return "";
  }
}

getUsersApi(int departmentId) {
  return "${ApiBase.baseUrl}/${ApiBase.apiV1}/departments/$departmentId/users";
}

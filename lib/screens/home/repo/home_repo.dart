import 'package:crystalonbritsols_task/network/api_paths.dart';
import 'package:crystalonbritsols_task/network/dio_client.dart';
import 'package:crystalonbritsols_task/screens/home/data/department_user.dart';
import 'package:crystalonbritsols_task/screens/home/data/departments.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final dioClient = DioClient.dioClient;

  Future<List<Department>?> getDepartments() async {
    final Response? response = await dioClient
        .getRequest(getPath(ApiPath.departments), shouldParse: false);

    List<Department>? departmentsList = [];
    if (response != null && response.statusCode == 200) {
      for (var element in (response.data as List)) {
        departmentsList.add(Department.fromJson(element));
      }
    }
    return departmentsList;
  }

  Future<List<DepartmentMember>?> getUsers({required int departmentId}) async {
    final Response? response = await dioClient
        .getRequest(getUsersApi(departmentId), shouldParse: false);

    List<DepartmentMember>? membersList = [];
    if (response != null && response.statusCode == 200) {
      for (var element in (response.data as List)) {
        membersList.add(DepartmentMember.fromJson(element));
      }
    }
    return membersList;
  }
}

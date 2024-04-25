import 'package:crystalonbritsols_task/navigation_path.dart';
import 'package:crystalonbritsols_task/screens/home/data/department_user.dart';
import 'package:crystalonbritsols_task/screens/home/data/departments.dart';
import 'package:crystalonbritsols_task/screens/home/repo/home_repo.dart';
import 'package:crystalonbritsols_task/services/storage_helper.dart';

import 'package:crystalonbritsols_task/utils/constants.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool isKeyboardOpen = RxBool(false);
  RxBool isLoading = RxBool(false);

  HomeRepo homeRepo = HomeRepo();

  List<Department>? departmentsResponse;
  List<DepartmentMember>? deparmentUsersResponse;

  getDepartments() async {
    try {
      isLoading(true);
      departmentsResponse = await homeRepo.getDepartments();
    } catch (e) {
      printLog(e);
    } finally {
      isLoading(false);
    }
  }

  getUsers(int departmentId, String departmentName) async {
    try {
      isLoading(true);
      Get.toNamed(NavigationPath.usersScreen, arguments: departmentName);
      deparmentUsersResponse =
          await homeRepo.getUsers(departmentId: departmentId);
    } catch (e) {
      printLog(e);
    } finally {
      isLoading(false);
    }
  }

  logout() async {
    try {
      isLoading(true);
      Get.offAllNamed(NavigationPath.loginScreen);
      StorageHelper.mInstance.setString(StorageHelper.storageAccessToken, "");
    } catch (e) {
      printLog(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getDepartments();
    super.onInit();
  }
}

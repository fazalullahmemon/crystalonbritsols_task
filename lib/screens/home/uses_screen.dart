import 'package:crystalonbritsols_task/screens/home/home_controller.dart';
import 'package:crystalonbritsols_task/widgets/custom_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final HomeScreenController _controller = Get.find();
  late String screenTitle;
  @override
  void initState() {
    screenTitle = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomLoaderWidget(
        isLoading: _controller.isLoading.value,
        child: Scaffold(
          appBar: _appBar,
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 4),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.folder),
                    SizedBox(
                        width: Get.width * 0.3,
                        child: Text(
                            "${_controller.deparmentUsersResponse![index].lastName}, ${_controller.deparmentUsersResponse![index].firstName}")),
                  ],
                ),
              );
            },
            itemCount: _controller.deparmentUsersResponse?.length ?? 0,
          ),
        ),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      // leading: Container(),
      title: Text(
        screenTitle,
      ),
      centerTitle: true,
    );
  }

  @override
  void dispose() {
    _controller.deparmentUsersResponse?.clear();
    super.dispose();
  }
}

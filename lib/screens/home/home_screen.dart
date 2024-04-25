import 'package:crystalonbritsols_task/screens/home/home_controller.dart';
import 'package:crystalonbritsols_task/widgets/custom_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _controller = Get.find();
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
              return GestureDetector(
                onTap: () => _controller.getUsers(
                    _controller.departmentsResponse![index].id!,
                    _controller.departmentsResponse![index].name!),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(Icons.folder),
                      SizedBox(
                          width: Get.width * 0.3,
                          child: Text(
                              _controller.departmentsResponse![index].name!)),
                    ],
                  ),
                ),
              );
            },
            itemCount: _controller.departmentsResponse?.length ?? 0,
          ),
        ),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      leading: Container(),
      title: const Text(
        "Departments",
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _controller.logout,
          icon: const Icon(
            Icons.power_settings_new_rounded,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

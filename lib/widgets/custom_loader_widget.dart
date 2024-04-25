import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget(
      {required this.child,
      required this.isLoading,
      this.borderRadius,
      super.key});
  final Widget child;
  final bool isLoading;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: borderRadius,
      child: Stack(children: [
        child,
        isLoading
            ? Container(
                width: double.infinity,
                height: double.maxFinite,
                color: Colors.black.withOpacity(0.1),
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                )))
            : Container()
      ]),
    );
  }
}

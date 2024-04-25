import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const spaceV4 = SizedBox(height: 4);
const spaceV8 = SizedBox(height: 8);
const spaceV12 = SizedBox(height: 12);
const spaceV16 = SizedBox(height: 16);
const spaceV24 = SizedBox(height: 24);
const spaceV32 = SizedBox(height: 32);

const spaceH4 = SizedBox(width: 4);
const spaceH8 = SizedBox(width: 8);
const spaceH12 = SizedBox(width: 12);
const spaceH16 = SizedBox(width: 16);
const spaceH24 = SizedBox(width: 24);

const noWidget = SizedBox.shrink();

late String deviceId;

void printLog(message) {
  if (kDebugMode) {
    log("$message");
  }
}

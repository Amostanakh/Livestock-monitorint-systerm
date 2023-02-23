// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestock_sms/models/livestock.model.dart';
import 'package:livestock_sms/models/user.model.dart';

Rx<UserModel?> kUser = (null as UserModel?).obs;
Rx<LivestockModel?> kLivestock = (null as LivestockModel?).obs;

keyboardUnFocus() => FocusManager.instance.primaryFocus?.unfocus();

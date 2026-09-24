/// Common exports used in almost every file.
/// Import this one file instead of many imports.
library;

export 'dart:convert';

export 'package:dio/dio.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get_it/get_it.dart';
export 'package:hive_flutter/hive_flutter.dart';

export 'package:base_project/config/env.dart';
export 'package:base_project/data/api/api_service.dart';
export 'package:base_project/data/di/common_di.dart';
export 'package:base_project/data/di/locator.dart';
export 'package:base_project/data/storage/storage.dart';
export 'package:base_project/gen/assets.gen.dart';
export 'package:base_project/gen/colors.gen.dart';
export 'package:base_project/presentation/base/api_render_state.dart';
export 'package:base_project/presentation/base/base_cubit.dart';
export 'package:base_project/presentation/routes/routes.dart';
export 'package:base_project/presentation/service/date_time.dart';
export 'package:base_project/presentation/service/misc.dart';
export 'package:base_project/presentation/service/navigation.dart';
export 'package:base_project/presentation/service/toast.dart';
export 'package:base_project/string/string.dart';
export 'package:base_project/util/extensions.dart';
export 'package:base_project/util/text_styles.dart';

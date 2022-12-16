import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class SettingCubit extends Cubit<ThemeData> {
  SettingCubit() : super(ThemeData.light());

  void toggleTheme() {
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
      
    } else {
      emit(ThemeData.light());
    }
  }
}

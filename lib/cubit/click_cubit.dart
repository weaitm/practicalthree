import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickInitial());


  var count = 0;
  var data = '';

  void Increment(Brightness br) {
    if (br == Brightness.dark) {
      count += 2;
      data = '+2 Тема: темная';
      emit(Click(count, data));
    } else if (br == Brightness.light) {
      count++;
      data = '+1 Тема: светлая';
      emit(Click(count, data));
    }
  }

  void Decrement(Brightness br) {
    if (br == Brightness.dark) {
      count -= 2;
      data = '-2 Тема: темная';
      emit(Click(count, data));
    } else if (br == Brightness.light) {
      count--;
      data = '-1 Тема: светлая';
      emit(Click(count, data));
    }
  }
}

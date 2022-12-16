part of 'click_cubit.dart';

@immutable
abstract class ClickState {

}

class ClickInitial extends ClickState {

}

class ClickError extends ClickState{
  final String message;

  ClickError(this.message);
}

class Click extends ClickState{
  final int count;
  final String data;

  Click(this.count, this.data);
}

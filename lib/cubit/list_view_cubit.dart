import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_view_state.dart';

class ListViewCubit extends Cubit<List<String>> {
  ListViewCubit() : super([]);

final List<String > list = [];

  void add(String data){
    list.insert(0,data);
    emit([...list]);
  }

}

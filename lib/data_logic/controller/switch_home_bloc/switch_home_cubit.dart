import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_home_state.dart';

class SwitchHomeCubit extends Cubit<CategoryType> {
  SwitchHomeCubit() : super(CategoryType.course);

  void change(CategoryType categoryType){
    emit(categoryType);
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



enum StudentStatus {future, admission, registered, denied, fired, banished}

class StudentController extends Cubit<StudentStatus> {
  StudentController() : super(StudentStatus.future);

  void change(StudentStatus status){
    emit(status);
  }
}

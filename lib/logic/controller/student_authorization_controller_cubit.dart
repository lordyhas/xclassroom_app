import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


/// Authorization
enum StudentStatus {future, admission, registered, denied, fired, banished}


/// [AuthorizationController] is a Student Authorization Controller
class AuthorizationController extends Cubit<StudentStatus> {
  AuthorizationController() : super(StudentStatus.future);

  void change(StudentStatus status){
    emit(status);
  }
}

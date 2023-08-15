import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos_iti/Service/User_Services.dart';
import 'package:todos_iti/models/Todo_Model.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()){
    getMyUsers();
  }
  List<TodoModel> todo = [];

  getMyUsers() async {
    try {
      emit(TodosLoading());
      todo = await UserServices().getUser();
      emit(TodosSuccess());
    } catch (e) {
      print(e.toString());
      emit(TodosError());
    }
  }


}

import 'package:bloc/bloc.dart';
import 'package:travelapp/cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  // AppCubits(super.initialState);
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}

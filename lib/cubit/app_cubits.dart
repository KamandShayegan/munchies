import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch/cubit/app_cubit_states.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit() : super(InitialState()) {
    emit(WelcomeState());
  }

  setMainPage() => emit(MainPageState());
  setDetailPage() => emit(DetailPageState());
}

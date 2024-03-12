import 'package:equatable/equatable.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class MainPageState extends CubitState {
  @override
  List<Object?> get props => [];
}

class DetailPageState extends CubitState {
  @override
  List<Object?> get props => [];
}

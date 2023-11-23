import 'package:bloc/bloc.dart';

class ShowPasswordCubit extends Cubit<bool> {
  ShowPasswordCubit() : super(false);
  void toggleVisability() {
    emit(!state);
  }
}

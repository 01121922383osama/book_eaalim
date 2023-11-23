import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  bool toggleValue() {
    emit(!state);
    return !state;
  }
}

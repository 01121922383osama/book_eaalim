import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_index_toggle_state.dart';

class AppIndexToggleCubit extends Cubit<AppIndexToggleState> {
  AppIndexToggleCubit() : super(AppIndexToggleInitial(index: 0));
  void typeIndex(int index) {
    AppIndexToggleInitial(index: index);
    emit(AppIndexToggleInitial(index: index));
  }
}

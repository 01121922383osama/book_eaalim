import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'indexslider_state.dart';

class IndexsliderCubit extends Cubit<IndexsliderState> {
  IndexsliderCubit() : super(IndexsliderInitial(index: 0));
  void typSlideIndex(int index) {
    IndexsliderInitial(index: index);
    emit(IndexsliderInitial(index: index));
  }
}

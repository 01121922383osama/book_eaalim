part of 'indexslider_cubit.dart';

@immutable
sealed class IndexsliderState {
  final int index;

  IndexsliderState({required this.index});
}

final class IndexsliderInitial extends IndexsliderState {
  IndexsliderInitial({required super.index});
}

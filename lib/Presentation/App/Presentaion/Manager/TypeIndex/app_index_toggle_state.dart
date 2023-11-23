part of 'app_index_toggle_cubit.dart';

@immutable
sealed class AppIndexToggleState {
  final int index;

  AppIndexToggleState({required this.index});
}

final class AppIndexToggleInitial extends AppIndexToggleState {
  AppIndexToggleInitial({required super.index});
}

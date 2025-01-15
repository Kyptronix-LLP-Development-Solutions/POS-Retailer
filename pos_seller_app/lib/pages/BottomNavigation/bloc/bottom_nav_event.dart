part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavTabChanged extends BottomNavEvent {
  final int index;

  const BottomNavTabChanged(this.index);

  // @override
  // List<Object?> get props => [index];
  @override
  List<Object> get props => [index];
}

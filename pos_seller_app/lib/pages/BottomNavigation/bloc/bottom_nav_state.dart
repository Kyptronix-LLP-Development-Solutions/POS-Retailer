part of 'bottom_nav_bloc.dart';

sealed class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavInitialState extends BottomNavState {
  final int selectedIndex;

  const BottomNavInitialState(this.selectedIndex);
  @override
  List<Object> get props => [selectedIndex];
}

class BottomNavUpdatedState extends BottomNavState {
  final int selectedIndex;

  const BottomNavUpdatedState(this.selectedIndex);
  @override
  List<Object> get props => [selectedIndex];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitialState(0)) {
    on<BottomNavTabChanged>((event, emit) {
      emit(BottomNavUpdatedState(event.index));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState());

  void start() {
    emit(state.copyWith(
      status: BottomNavBarStatus.success,
    ));
  }

  void updateIndex(int index) {
    emit(
      state.copyWith(
        index: index,
        status: BottomNavBarStatus.success,
      ),
    );
  }
}

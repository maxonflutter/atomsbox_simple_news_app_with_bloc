part of 'bottom_nav_bar_cubit.dart';

enum BottomNavBarStatus { initial, loading, success, error }

class BottomNavBarState extends Equatable {
  final int index;
  final BottomNavBarStatus status;

  const BottomNavBarState({
    this.index = 0,
    this.status = BottomNavBarStatus.initial,
  });

  BottomNavBarState copyWith({
    int? index,
    BottomNavBarStatus? status,
  }) {
    return BottomNavBarState(
      index: index ?? this.index,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [index, status];
}

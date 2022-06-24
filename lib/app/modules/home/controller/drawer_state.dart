part of 'drawer_controller.dart';

enum DrawerStatus {
  initial,
  loading,
  complete,
  failure;
}

class DrawerState {
  final List<UserModel> user;
  final DrawerStatus status;

  DrawerState._({
    required this.user,
    required this.status,
  });

  DrawerState.initial()
      : this._(
          user: [],
          status: DrawerStatus.initial,
        );

  DrawerState copyWith({
    List<UserModel>? user,
    DrawerStatus? status,
  }) {
    return DrawerState._(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}

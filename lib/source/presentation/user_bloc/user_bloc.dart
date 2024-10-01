import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_package/source/presentation/user_bloc/user_state.dart';

import '../../data/repositories/repo.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());

  void fetchUsers() async {
    try {
      emit(UserLoading());
      final users = await repository.fetchUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('Failed to load users'));
    }
  }
}

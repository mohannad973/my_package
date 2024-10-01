import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/repo.dart';
import '../user_bloc/user_bloc.dart';
import '../user_bloc/user_state.dart';


class UserScreen extends StatelessWidget {
  final UserRepository repository;

  UserScreen({required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(repository)..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(title: Text('Users')),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('Press the button to fetch users'));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/features/users/presentation/controller/user_controller.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(UserControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: users.when(
          data: (data) => ListView(
                children: [
                  ...data.data.map((e) => ListTile(
                        title: Text(e.first_name),
                        subtitle: Text(e.last_name),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(e.avatar),
                        ),
                      ))
                ],
              ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

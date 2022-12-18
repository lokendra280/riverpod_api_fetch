import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/features/unknown/presentation/controller/unknown_Controller.dart';
import 'package:riverpod_apicall/features/users/data/data_sources/user_remote_soucre_data.dart';

class UnknownScreen extends ConsumerWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(UnknownControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unknown controller'),
      ),
      body: users.when(
          data: (data) => ListView(
                children: [
                  ...data.data.map(
                    (e) => ListTile(
                      title: Text(e.name),
                      subtitle: Text(e.year.toString()),
                    ),
                  )
                ],
              ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

import 'package:becos_kitchen/screen/login/login_page.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_page.dart';
import 'package:becos_kitchen/view_model/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthVerification extends ConsumerWidget {
  const AuthVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(userStateProvider);
    return authState.when(data: (data) {
      if (data != null) {
        return const MenuListPage();
      }
      return const LoginPage();
    }, error: (_, __) {
      return const Scaffold(
        body: Text('エラー'),
      );
    }, loading: () {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}

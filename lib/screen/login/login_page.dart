import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_page.dart';
import 'package:becos_kitchen/view_model/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailControllerProvider = ref.watch(emailControllerStateProvider);
    final passwordControllerProvider =
        ref.watch(passwordControllerStateProvider);
    final state = ref.watch(userStateProvider).value;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(textBlack),
            ),
            child: Text('ログイン'),
          ),
          const ColumnPadding(height: 8),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              label: Text('メールアドレス'),
              hintText: 'test@gmail.com',
            ),
            controller: emailControllerProvider,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              label: Text('パスワード'),
              hintText: 'password',
            ),
            controller: passwordControllerProvider,
            obscureText: true,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  if (emailControllerProvider.text.isEmpty) {
                    throw 'メールアドレスを入力してください';
                  }
                  if (passwordControllerProvider.text.isEmpty) {
                    throw 'パスワードを入力してください';
                  }
                  await ref.read(loginViewModelProvider.notifier).signIn(
                        emailControllerProvider.text,
                        passwordControllerProvider.text,
                      );
                  if (state?.uid != null) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const MenuListPage()),
                      (route) => false,
                    );
                  }
                } catch (e) {
                  print('サインインエラー');
                }
              },
              child: Text('送信'))
        ]),
      ),
    );
  }
}

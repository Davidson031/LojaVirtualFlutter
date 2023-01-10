import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_textfield.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;
import 'package:quitanda_virtual/src/services/validators.dart';

import '../auth/controller/auth_controller.dart';
import '../home/controller/home_controller.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Perfil do Usuário"),
          actions: [
            IconButton(
              onPressed: () {
                authController.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            CustomTextField(
              icon: Icons.email,
              labelText: "E-mail",
              initial: authController.user.email,
              isReadOnly: true,
            ),
            CustomTextField(
              icon: Icons.phone,
              labelText: "Celular",
              initial: authController.user.phone,
              isReadOnly: true,
            ),
            CustomTextField(
              icon: Icons.copy,
              labelText: "CPF",
              isSecret: true,
              initial: authController.user.cpf,
              isReadOnly: true,
            ),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () async {
                  bool? res = await updatePassword();
                  print(res);
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: const BorderSide(color: Colors.green)),
                child: const Text(
                  "Atualizar Senha",
                ),
              ),
            )
          ],
        ));
  }

  Future<bool?> updatePassword() {

    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Atualização de Senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: currentPasswordController,
                      validator: passwordValidator,
                      icon: Icons.lock,
                      labelText: "Senha atual",
                      isSecret: true,
                    ),
                    CustomTextField(
                      controller: newPasswordController,
                      validator: passwordValidator,
                      icon: Icons.lock_outline,
                      labelText: "Nova senha",
                      isSecret: true,
                    ),
                    CustomTextField(
                        validator: (password) {
                          final res = passwordValidator(password);

                          if (res != null) {
                            return res;
                          }

                          if (password != newPasswordController.text) {
                            return "As senhas não são iguais";
                          }
                          return null;
                        },
                        icon: Icons.lock_outline,
                        labelText: "Confirmar Nova senha",
                        isSecret: true),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authController.changePassword(
                              currentPassword: currentPasswordController.text,
                              newPassword: newPasswordController.text,
                            );
                          }
                          ;
                        },
                        child: const Text(
                          "Atualizar",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}

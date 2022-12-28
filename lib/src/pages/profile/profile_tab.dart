import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_textfield.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Perfil do Usuário"),
          actions: [
            IconButton(
              onPressed: () {},
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
              initial: appData.user.email,
              isReadOnly: true,
            ),
            CustomTextField(
              icon: Icons.phone,
              labelText: "Celular",
              initial: appData.user.celular,
              isReadOnly: true,
            ),
            CustomTextField(
              icon: Icons.copy,
              labelText: "CPF",
              isSecret: true,
              initial: appData.user.cpf,
              isReadOnly: true,
            ),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () async {
                  bool? res = await updatePassword();
                  print(res);
                },
                child: Text(
                  "Atualizar Senha",
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: const BorderSide(color: Colors.green)),
              ),
            )
          ],
        ));
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                    icon: Icons.lock,
                    labelText: "Senha atual",
                    isSecret: true,
                  ),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    labelText: "Nova senha",
                    isSecret: true,
                  ),
                  CustomTextField(
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
                      onPressed: () {},
                      child: const Text(
                        "Atualizar",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: (){
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

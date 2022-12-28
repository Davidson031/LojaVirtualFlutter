import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_textfield.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final cpfFormatter = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

    final phoneFormatter = MaskTextInputFormatter(
        mask: "## #####-####", filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor[800],
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(icon: Icons.email, labelText: "E-mail"),
                        CustomTextField(
                            icon: Icons.lock,
                            labelText: "Senha",
                            isSecret: true),
                        CustomTextField(icon: Icons.person, labelText: "Nome"),
                        CustomTextField(
                            icon: Icons.phone,
                            labelText: "Telefone",
                            inputFormatters: [phoneFormatter]),
                        CustomTextField(
                            icon: Icons.file_copy,
                            labelText: "CPF",
                            inputFormatters: [cpfFormatter]),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {},
                            child: const Text(
                              "Cadastrar Usuário",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 5,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

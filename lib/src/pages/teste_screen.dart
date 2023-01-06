import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/home/controller/home_controller.dart';

import 'home/view/components/cateogory_tile.dart';

class TesteScreen extends StatelessWidget {
  const TesteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de teste"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text("001");
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20);
                  },
                  itemCount: 5),
            ],
          ),
          
        ],
      ),
    );
  }
}

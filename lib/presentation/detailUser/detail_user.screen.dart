import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/detail_user.controller.dart';

class DetailUserScreen extends GetView<DetailUserController> {
  const DetailUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailUserScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailUserScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

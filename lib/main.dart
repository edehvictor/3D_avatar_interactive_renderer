import 'package:flutter/material.dart';
import 'package:mobile_3d_renderer/model_render.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ModelRender(
        title: "",
      ),
    );
  }
}

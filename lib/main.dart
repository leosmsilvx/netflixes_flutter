import 'package:flutter/material.dart';
import 'package:netflix/core/app.dart';
import 'package:netflix/modules/usuario/repositories/datasource/momoria_datasource.dart';

void main() {
  MemoriaDataSource.init();
  runApp(const MyApp());
}

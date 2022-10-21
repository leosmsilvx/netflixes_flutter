import 'package:flutter/material.dart';
import 'package:netflix/modules/home/controllers/home_controller.dart';
import 'package:netflix/modules/usuario/models/usuario_models.dart';

class HomePage extends StatefulWidget {
  final UsuarioModel usuario;
  const HomePage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  void initState() {
    super.initState();
    _controller.carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bem vindo, ${widget.usuario.nome}",
              style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [],
        ));
  }
}

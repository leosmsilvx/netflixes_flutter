import 'package:flutter/material.dart';
import 'package:netflix/modules/home/controllers/home_controller.dart';
import 'package:netflix/modules/usuario/controllers/usuario_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        title: const Text("HOME PAGE"),
      ),
      body: ListView.builder(
        itemCount: _controller.usuarioDataSource.length,
        itemBuilder: (context, indice) {
          final usuario = _controller.usuarioDataSource[indice];
          return ListTile(
            title: Text(usuario.nome ?? "Sem nome"),
            subtitle: Text(usuario.email ?? "Sem email"),
          );
        },
      ),
    );
  }
}

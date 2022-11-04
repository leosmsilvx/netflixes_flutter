import 'package:flutter/material.dart';
import 'package:netflix/modules/home/controllers/home_controller.dart';
import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/modules/usuario/pages/usuario_page.dart';

class HomePage extends StatefulWidget {
  final UsuarioModel usuario;
  const HomePage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bem vindo, ${widget.usuario.nome}",
              style: const TextStyle(color: Colors.red)),
          backgroundColor: Colors.black,
        ),
        body: ValueListenableBuilder(
          valueListenable: _controller.usuarioDataSourceNotifier,
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: _controller.usuarioDataSource.length,
              itemBuilder: (context, indice) {
                final usuario = _controller.usuarioDataSource[indice];
                return ListTile(
                  title: Text(usuario.nome ?? 'Sem nome'),
                  subtitle: Text(usuario.email ?? 'Sem email'),
                  tileColor: Colors.black,
                  textColor: Colors.white,
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(children: [
                      IconButton(
                        onPressed: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UsuarioPage(
                                    current: usuario,
                                  )));
                          _controller.carregaDados();
                        },
                        icon: const Icon(Icons.edit),
                        color: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {
                            _controller.excluirOnPressed(
                              usuario,
                              () {
                                _controller.carregaDados();
                              },
                              () {
                                //ERRO TOAST
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ]),
                  ),
                );
              },
            );
          },
        ));
  }
}

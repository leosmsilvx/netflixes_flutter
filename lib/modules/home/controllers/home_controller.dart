import 'package:flutter/cupertino.dart';
import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/modules/usuario/repositories/usuario_repositorie.dart';

class HomeController extends ChangeNotifier {
  final _usuarioRepositorie = UsuarioRepositorie();

  ValueNotifier<List<UsuarioModel>> usuarioDataSourceNotifier =
      ValueNotifier<List<UsuarioModel>>([]);

  set usuarioDataSource(value) => usuarioDataSourceNotifier.value = value;

  List<UsuarioModel> get usuarioDataSource => usuarioDataSourceNotifier.value;

  void carregaDados() {
    _usuarioRepositorie
        .selecionarTodos()
        .then((value) => usuarioDataSource = value);
  }

  void excluirOnPressed(
      UsuarioModel usuario, VoidCallback sucesso, VoidCallback erro) async {
    try {
      _usuarioRepositorie.excluir(usuario);
      sucesso();
    } catch (e) {
      erro();
    }
  }
}

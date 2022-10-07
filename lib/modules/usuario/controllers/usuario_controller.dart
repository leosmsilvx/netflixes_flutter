import 'package:flutter/material.dart';
import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/modules/usuario/repositories/usuario_repositorie.dart';

class UsuarioController extends ChangeNotifier {
  final nome = TextEditingController();
  final senha = TextEditingController();
  final email = TextEditingController();
  final _repository = UsuarioRepositorie();

  void salvarOnPressed({
    required VoidCallback sucesso,
    required VoidCallback? Function(String motivo) falha,
  }) async {
    try {
      final usuario = UsuarioModel(
        nome: nome.text,
        senha: senha.text,
        email: email.text,
      );
      await _repository.incluir(usuario);

      sucesso();
    } catch (e) {
      falha(e.toString());
    }
  }
}

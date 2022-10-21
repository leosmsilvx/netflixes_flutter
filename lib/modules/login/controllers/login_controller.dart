import 'package:flutter/material.dart';
import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/modules/usuario/repositories/usuario_repositorie.dart';

class LoginController extends ChangeNotifier {
  final senha = TextEditingController();
  final email = TextEditingController();
  final _repository = UsuarioRepositorie();

  Future<void> entrarOnPressed({
    required VoidCallback? sucesso(UsuarioModel usuario),
    required VoidCallback? falha(String motivo),
  }) async {
    final validar = await _repository.selecionar(email.text);

    if (email.text.trim() == "") {
      falha("E-mail não informado");
      return;
    }

    if (validar == null) {
      falha("E-mail inválido!");
      return;
    }

    if (validar.senha == senha.text) {
      sucesso(validar);
      return;
    }
    falha('Email ou senha invalidos');
  }
}

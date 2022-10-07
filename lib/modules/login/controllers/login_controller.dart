import 'package:flutter/material.dart';
import 'package:netflix/modules/usuario/repositories/usuario_repositorie.dart';

class LoginController extends ChangeNotifier {
  final senha = TextEditingController();
  final email = TextEditingController();
  final _repository = UsuarioRepositorie();

  void entrarOnPressed({
    required VoidCallback sucesso,
    required VoidCallback? Function(String motivo) falha,
  }) async {
    final validar = await _repository.selecionar(email.text);
    if (validar?.senha == senha.text) {
      sucesso();
      return;
    }
    falha('Email ou senha invalidos');
  }
}

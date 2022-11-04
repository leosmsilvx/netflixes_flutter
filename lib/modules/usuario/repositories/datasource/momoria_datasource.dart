import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/modules/usuario/repositories/datasource/datasource_ds.dart';

class MemoriaDataSource extends DataSourceBase {
  static List<Map<String, dynamic>> tabelaUser = [];

  static void init() {
    for (var i = 0; i < 100; i++) {
      var usu = UsuarioModel(
          email: 'email$i@exemplo.com', nome: 'Fulano $i', senha: 's$i');
      tabelaUser.add(usu.toMap());
    }
  }

  @override
  Future<void> alterar(Map<String, dynamic> usuario) async {
    for (var i = 0; i < tabelaUser.length; i++) {
      if (tabelaUser[i]['email'] == usuario['email']) {
        tabelaUser[i]['nome'] = usuario['nome'];
        tabelaUser[i]['senha'] = usuario['senha'];
        break;
      }
    }
  }

  @override
  Future<void> excluir(Map<String, dynamic> usuario) async {
    tabelaUser.removeWhere((element) => element['email'] == usuario['email']);
  }

  @override
  Future<void> incluir(Map<String, dynamic> usuario) async {
    tabelaUser.add(usuario);
  }

  @override
  Future<Map<String, dynamic>?> selecionar(String email) async {
    for (var usuario in tabelaUser) {
      if (usuario['email'] == email) {
        return usuario;
      }
    }
    return null;
  }

  @override
  Future<List<Map<String, dynamic>>> selecionarTodos() async {
    return tabelaUser;
  }
}

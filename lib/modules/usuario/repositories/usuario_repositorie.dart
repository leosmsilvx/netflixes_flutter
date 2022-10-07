import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/modules/usuario/repositories/datasource/datasource_ds.dart';
import 'package:netflix/modules/usuario/repositories/datasource/momoria_datasource.dart';

class UsuarioRepositorie {
  final DataSourceBase? _db = MemoriaDataSource();
  Future<void> incluir(UsuarioModel usuarioModel) async {
    usuarioModel.isValid();
    _db!.incluir(usuarioModel.toMap());
  }

  Future<void> excluir(UsuarioModel usuarioModel) async {
    usuarioModel.isValid();
    _db!.excluir(usuarioModel.toMap());
  }

  Future<void> alterar(UsuarioModel usuarioModel) async {
    usuarioModel.isValid();
    _db!.alterar(usuarioModel.toMap());
  }

  Future<UsuarioModel?> selecionar(String email) async {
    final map = await _db!.selecionar(email);
    if (map == null) {
      return null;
    }
    return UsuarioModel.fromMap(map);
  }

  Future<List<UsuarioModel>> selecionarTodos() async {
    final maps = await _db!.selecionarTodos();
    var retorno = <UsuarioModel>[];
    for (var map in maps) {
      final usuario = UsuarioModel.fromMap(map);
      retorno.add(usuario);
    }
    return <UsuarioModel>[];
  }
}

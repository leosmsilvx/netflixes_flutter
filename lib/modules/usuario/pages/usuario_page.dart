import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:netflix/modules/usuario/controllers/usuario_controller.dart';
import 'package:netflix/modules/usuario/models/usuario_models.dart';
import 'package:netflix/shared/components/botao/botaoSFundo.dart';
import 'package:netflix/shared/components/campo_formulario/campoForm.dart';
import 'package:netflix/shared/components/botao/botaoForm.dart';

class UsuarioPage extends StatefulWidget {
  final UsuarioModel? current;
  const UsuarioPage({Key? key, this.current}) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final _controller = UsuarioController();

  @override
  void initState() {
    super.initState();

    if (widget.current != null) {
      _controller.email.text = widget.current!.email ?? '';
      _controller.senha.text = widget.current!.senha ?? '';
      _controller.nome.text = widget.current!.nome ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            child: ListView(
          children: [
            //LOGO NETFLIX
            Image.asset("assets/images/logo.png", width: 180, height: 180),

            //TEXTO
            const Padding(
                padding: EdgeInsets.fromLTRB(200, 50, 200, 20),
                child: Text("Cadastro de Usuário",
                    style: TextStyle(color: Colors.white, fontSize: 30))),

            //CAMPOS CADASTRO
            Padding(
                padding: const EdgeInsets.fromLTRB(200, 50, 200, 40),
                child: CampoForm(
                  icone: Icons.email,
                  texto: "Email",
                  controller: _controller.email,
                  teclado: TextInputType.emailAddress,
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(200, 0, 200, 40),
                child: CampoForm(
                  icone: Icons.person,
                  texto: "Nome",
                  controller: _controller.nome,
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(200, 0, 200, 40),
                child: CampoForm(
                  icone: Icons.key,
                  texto: "Senha",
                  controller: _controller.senha,
                  isSenha: true,
                )),

            //BOTAO CADASTRAR
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 200, 20),
              child: BotaoForm(
                  corfundo: Colors.red,
                  texto: "Salvar",
                  aoClicar: () {
                    _controller.salvarOnPressed(
                        sucesso: () {
                          Navigator.of(context).pop();
                          MotionToast.success(
                            title: const Text(
                              'Sucesso!',
                            ),
                            description: const Text(
                                'Seu cadastro foi concluído com sucesso.'),
                            animationType: AnimationType.fromLeft,
                            position: MotionToastPosition.top,
                            dismissable: true,
                          ).show(context);
                        },
                        falha: ((motivo) {
                          MotionToast.error(
                            title: const Text("Falha!"),
                            description: Text(motivo),
                            width: 500,
                            position: MotionToastPosition.top,
                            animationType: AnimationType.fromLeft,
                          ).show(context);
                        }),
                        alteracao: widget.current != null);
                  }),
            ),

            //TEXTO VOLTAR
            Padding(
                padding: const EdgeInsets.fromLTRB(200, 0, 200, 20),
                child: BotaoSFundo(
                  cortxt: Colors.white70,
                  texto: "Voltar",
                  aoClicar: () {
                    Navigator.of(context).pop();
                  },
                ))
          ],
        )));
  }
}

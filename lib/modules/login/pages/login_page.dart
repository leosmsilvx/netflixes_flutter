import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:netflix/modules/home/pages/home_page.dart';
import 'package:netflix/modules/login/controllers/login_controller.dart';
import 'package:netflix/modules/usuario/pages/usuario_page.dart';
import 'package:netflix/shared/components/botao/botaoForm.dart';
import 'package:netflix/shared/components/botao/botaoSFundo.dart';
import 'package:netflix/shared/components/campo_formulario/campoForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(children: [
          //LOGO NETFLIX
          Image.asset("assets/images/logo.png", width: 180, height: 180),

          //TEXTO
          const Padding(
            padding: EdgeInsets.fromLTRB(200, 50, 200, 20),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),

          //CAMPO USUARIO
          Padding(
              padding: const EdgeInsets.fromLTRB(200, 50, 200, 40),
              child: CampoForm(
                icone: Icons.email,
                texto: "Email",
                controller: _controller.email,
                teclado: TextInputType.emailAddress,
              )),

          //CAMPO SENHA
          Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 200, 40),
              child: CampoForm(
                icone: Icons.key,
                texto: "Senha",
                controller: _controller.senha,
                isSenha: true,
              )),

          //BOTAO ENTRAR
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 0, 200, 20),
            child: BotaoForm(
              corfundo: Colors.red,
              cortxt: Colors.white,
              texto: "Entrar",
              aoClicar: () {
                _controller.entrarOnPressed(sucesso: (usuarioLogado) {
                  final rota = MaterialPageRoute(
                      builder: (context) => HomePage(
                            usuario: usuarioLogado,
                          ));
                  Navigator.of(context).pushReplacement(rota);
                  MotionToast.success(
                    title: const Text(
                      'Sucesso!',
                    ),
                    description: const Text('Login concluido'),
                    animationType: AnimationType.fromLeft,
                    position: MotionToastPosition.top,
                    dismissable: true,
                  ).show(context);
                }, falha: ((motivo) {
                  MotionToast.error(
                    title: const Text("Falha!"),
                    description: Text(motivo),
                    width: 500,
                    position: MotionToastPosition.top,
                    animationType: AnimationType.fromLeft,
                  ).show(context);
                }));
              },
            ),
          ),

          //TEXTO CRIAR CONTA
          Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 200, 20),
              child: BotaoSFundo(
                cortxt: Colors.white70,
                texto: "Criar conta",
                aoClicar: () {
                  final rota = MaterialPageRoute(
                      builder: (context) => const UsuarioPage());
                  Navigator.of(context).push(rota);
                },
              ))
        ]));
  }
}

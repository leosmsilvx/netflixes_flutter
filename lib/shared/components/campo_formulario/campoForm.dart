import 'package:flutter/material.dart';

class CampoForm extends StatefulWidget {
  final String texto;
  final IconData icone;
  final TextEditingController controller;
  TextInputType? teclado;
  bool? isSenha;
  CampoForm(
      {Key? key,
      required this.texto,
      required this.icone,
      required this.controller,
      this.teclado,
      this.isSenha})
      : super(key: key);

  @override
  State<CampoForm> createState() => _CampoFormState();
}

class _CampoFormState extends State<CampoForm> {
  bool senha() {
    return widget.isSenha != null && widget.isSenha == true;
  }

  late bool _mostrarSenha = senha();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 187, 187, 187)),
      controller: widget.controller,
      keyboardType: widget.teclado ?? TextInputType.text,
      obscureText: _mostrarSenha,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 87, 86, 86),
          filled: true,
          prefixIcon: Icon(widget.icone),
          label: Text(widget.texto),
          border: InputBorder.none,
          suffixIcon: senha()
              ? IconButton(
                  icon: Icon(
                    _mostrarSenha ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _mostrarSenha = !_mostrarSenha;
                    });
                  },
                  //Se senha for false retorna null
                )
              : null),
    );
  }
}

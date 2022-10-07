import 'package:flutter/material.dart';

class BotaoForm extends StatefulWidget {
  final String texto;
  final Color? cortxt;
  final Color corfundo;
  Function()? aoClicar;
  BotaoForm({
    Key? key,
    required this.texto,
    this.cortxt,
    required this.corfundo,
    this.aoClicar,
  }) : super(key: key);

  @override
  State<BotaoForm> createState() => _BotaoFormState();
}

class _BotaoFormState extends State<BotaoForm> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.aoClicar,
        child: Text(widget.texto,
            style:
                TextStyle(color: widget.cortxt ?? Colors.white, fontSize: 18)),
        style: ElevatedButton.styleFrom(
          primary: (widget.corfundo),
          minimumSize: const Size(100, 55),
        ));
  }
}

import 'package:flutter/material.dart';

class BotaoSFundo extends StatefulWidget {
  final String texto;
  final Color? cortxt;
  Function()? aoClicar;
  BotaoSFundo({ Key? key,
    this.cortxt,
    required this.texto,
    this.aoClicar,
   }) : super(key: key);

  @override
  State<BotaoSFundo> createState() => _BotaoSFundoState();
}

class _BotaoSFundoState extends State<BotaoSFundo> {
  @override
  Widget build(BuildContext context) {
    return  TextButton(
                onPressed: widget.aoClicar,
                child: Text(widget.texto,
                    style: TextStyle(color: widget.cortxt ?? Colors.white, fontSize: 14)
                ),
              );
  }
}
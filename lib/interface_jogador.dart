import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/fantasmas.dart';
import 'package:escribo_pacman/frutas.dart';
import 'package:escribo_pacman/jogador.dart';
import 'package:flutter/material.dart';
import 'jogador.dart';
import 'dart:async' as asyncro;

class InterfaceJogador extends StatefulWidget {
  const InterfaceJogador({Key? key, required this.game}) : super(key: key);
  final BonfireGame game;
  static const overlayKey = 'interfaceJogador';
  @override
  State<InterfaceJogador> createState() => _InterfaceJogadorState();
}

class _InterfaceJogadorState extends State<InterfaceJogador> {
  late asyncro.Timer _lifeTime;
  int score = 0;
  int tempo = 0;
  int _vidas = 0;
  int tempPoder = 0;
  int tempInvulneravel = 0;
  int contFruta = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Text(
          'SCORE: $score  VIDAS: $_vidas',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ));
  }

  @override
  void initState() {
    _lifeTime = asyncro.Timer.periodic(
        const Duration(milliseconds: 100), _verificaScore);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  void _verificaScore(asyncro.Timer timer) {
    tempo += 1;
    if (tempo == 100) {
      widget.game.map
          .add(Fantasma(position: Vector2(220, 232), cor: Fantasmas.azul));
    }
    if (tempo == 200) {
      widget.game.map
          .add(Fantasma(position: Vector2(220, 232), cor: Fantasmas.rosa));
    }
    if (tempo == 300) {
      widget.game.map
          .add(Fantasma(position: Vector2(220, 232), cor: Fantasmas.vermelho));
    }
    if (widget.game.player is Jogador && widget.game.player != null) {
      var jogador = widget.game.player as Jogador;
      if (!jogador.atacavel) {
        tempPoder += 1;
        if (tempPoder > 100) {
          jogador.atacavel = true;
          tempPoder = 0;
        }
      }
      if (jogador.invulneravel) {
        tempInvulneravel += 1;
        if (tempInvulneravel > 250) {
          jogador.invulneravel = false;
          jogador.enableCollision(true);
        }
      }
      if (jogador.pontos != score) {
        setState(() {
          score = jogador.pontos;
        });
      }
      if (jogador.vidas != _vidas) {
        setState(() {
          _vidas = jogador.vidas;
        });
      }
      if (score >= 500 && contFruta == 0) {
        widget.game.map.add(
            Frutas(Vector2(400, 16), FrutasEnum.cereja, FrutasEnum.cereja));
        contFruta += 1;
      }
      if (score >= 750 && contFruta == 1) {
        widget.game.map
            .add(Frutas(Vector2(144, 16), FrutasEnum.maca, FrutasEnum.maca));
        contFruta += 1;
      }
      if (score >= 1000 && contFruta == 2) {
        widget.game.map.add(
            Frutas(Vector2(48, 80), FrutasEnum.morango, FrutasEnum.morango));
        contFruta += 1;
      }
      if (score >= 1500 && contFruta == 3) {
        widget.game.map
            .add(Frutas(Vector2(160, 368), FrutasEnum.maca, FrutasEnum.maca));
        contFruta += 1;
      }
    }
  }
}

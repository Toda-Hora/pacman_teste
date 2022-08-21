import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/bolas.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/fantasmas.dart';
import 'package:escribo_pacman/interface_jogador.dart';
import 'package:escribo_pacman/jogador.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double tileSize = 16;
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      overlayBuilderMap: {
        InterfaceJogador.overlayKey: (context, game) =>
            InterfaceJogador(game: game)
      },
      showCollisionArea: false,
      cameraConfig: CameraConfig(
          moveOnlyMapArea: true, sizeMovementWindow: Vector2(0, 0)),
      player: Jogador(Vector2(220, 73)),
      joystick: Joystick(keyboardConfig: KeyboardConfig()),
      map: TiledWorldMap(
        'mapa_pacman.json',
        objectsBuilder: {
          'fantasma_vermelho': (properties) {
            return Fantasma(properties.position, Fantasmas.amarelo);
          },
          'ponto': (properties) {
            return BolasPontos(properties.position);
          },
          'poder': ((properties) {
            return BolasPoder(properties.position);
          })
        },
        forceTileSize: Size(tileSize, tileSize),
      ),
      initialActiveOverlays: const [InterfaceJogador.overlayKey],
    );
  }
}

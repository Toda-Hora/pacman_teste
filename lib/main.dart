import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/fantasmas.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCORE:'),
        backgroundColor: Colors.black,
      ),
      body: BonfireTiledWidget(
          showCollisionArea: false,
          cameraConfig: CameraConfig(
              moveOnlyMapArea: true, sizeMovementWindow: Vector2(0, 0)),
          player: Jogador(Vector2(tileSize * 13, tileSize * 22.5)),
          joystick: Joystick(
              keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          )),
          map: TiledWorldMap('mapa_pacman.json',
              objectsBuilder: {
                'fantasma_vermelho': (properties) =>
                    FantasmaVermelho(properties.position),
              },
              forceTileSize: Size(tileSize, tileSize))),
    );
  }
}

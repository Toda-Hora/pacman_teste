import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes.dart';

class Jogador extends RotationPlayer with ObjectCollision {
  Jogador(Vector2 position)
      : super(
          position: position,
          animRun: Animacoes().jogCorre,
          size: Vector2(32, 32),
          animIdle: Animacoes().jogPara,
          speed: 150,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 6,
            align: Vector2(8, 8),
          ),
        ],
      ),
    );
  }
}

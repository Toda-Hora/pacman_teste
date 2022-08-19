import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_jogador.dart';

class Jogador extends RotationPlayer with ObjectCollision {
  Jogador(Vector2 position)
      : super(
          position: position,
          animRun: AnimacoesJogador().jogCorre,
          size: Vector2(32, 32),
          animIdle: AnimacoesJogador().jogPara,
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
  @override
  bool onCollision(GameComponent component, bool active) {
    // TODO: implement onCollision
    return super.onCollision(component, active);
  }
}

import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_jogador.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/fantasmas.dart';

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
    if (component is FantasmaVermelho) {
      simpleAttackMelee(
          damage: 150,
          size: Vector2(tileSize, tileSize),
          animation: AnimacoesJogador().jogAtaque,
          withPush: false);
    }

    return super.onCollision(component, active);
  }

  @override
  void die() {
    playSpriteAnimationOnce(AnimacoesJogador().jogMorre);
    super.die();
  }
}

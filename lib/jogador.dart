import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_jogador.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/fantasmas.dart';

class Jogador extends RotationPlayer with ObjectCollision {
  int _pontos = 0;
  bool atacavel = true;
  bool invulneravel = false;
  int vidas = 3;
  Jogador(Vector2 position)
      : super(
          position: position,
          animRun: AnimacoesJogador().jogCorre,
          size: Vector2(32, 32),
          animIdle: AnimacoesJogador().jogPara,
          speed: 80,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 7,
            align: Vector2(8, 8),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Fantasma && !atacavel && !invulneravel) {
      var componente = component;
      componente.removeLife(150);
      simpleAttackMelee(
          damage: 150,
          size: Vector2.all(16),
          animation: AnimacoesJogador().jogAtaque);
    }

    return super.onCollision(component, active);
  }

  @override
  void die() {
    playSpriteAnimationOnce(AnimacoesJogador().jogMorre);
    invulneravel = true;
    vidas = vidas - 1;
    //enableCollision(false);
    if (vidas == 0) {
      removeFromParent();
      super.die();
    }
  }

  void adicionaScore(int pontos) {
    _pontos += pontos;
  }

  int get pontos => _pontos;
}

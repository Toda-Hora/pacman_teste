import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_fantasmas.dart';
import 'package:escribo_pacman/const_enum.dart';

class FantasmaVermelho extends SimpleEnemy with ObjectCollision {
  FantasmaVermelho(Vector2 position)
      : super(
            position: position,
            size: Vector2(32, 32),
            animation: SimpleDirectionAnimation(
                idleRight:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantDir,
                runRight:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantDir,
                idleLeft:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantEsq,
                runLeft:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantEsq,
                idleDown:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantBaixo,
                runDown:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantBaixo,
                idleUp:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantCima,
                runUp: AnimacoesFantasmas.fromColor(Fantasmas.vermelho)
                    .fantCima)) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 6,
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
        closePlayer: (jogador) {
          simpleAttackMelee(damage: 150, size: Vector2(16, 16));
        },
        radiusVision: tileSize * 50);
    super.update(dt);
  }

  @override
  void die() {
    replaceAnimation(SimpleDirectionAnimation(
        idleRight:
            AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoDir,
        runRight: AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoDir,
        idleLeft: AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoEsq,
        runLeft: AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoEsq,
        idleDown:
            AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoBaixo,
        runDown:
            AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoBaixo,
        idleUp: AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoCima,
        runUp: AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantMortoCima));
    enableCollision(false);
    super.die();
  }
}

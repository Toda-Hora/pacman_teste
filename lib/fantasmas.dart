import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_fantasmas.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/jogador.dart';

class Fantasma extends SimpleEnemy
    with ObjectCollision, MoveToPositionAlongThePath {
  Fantasma({required Vector2 position, required this.cor})
      : super(
            life: 100,
            speed: 70,
            position: position,
            size: Vector2(32, 32),
            animation: AnimacoesFantasmas.fromColor(cor).fantasma) {
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
  final Fantasmas cor;
  var animacaoAtual = "";
  bool isMorto = false;

  @override
  void update(double dt) {
    if (isMorto) {
      moveToPositionAlongThePath(
        Vector2(tileSize * 14, tileSize * 14),
      );
    }
    if (position.x < tileSize * 17 &&
        position.x > tileSize * 11 &&
        position.y < tileSize * 14 &&
        position.x > tileSize * 13 &&
        isMorto) {
      isMorto = false;
      enableCollision(true);
      addLife(100);
    }

    seePlayer(
        observed: (jogador) {
          if (!isMorto) {
            seeAndMoveToPlayer(
                closePlayer: (jogador) {
                  if (jogador is Jogador) {
                    if (jogador.atacavel && !jogador.invulneravel) {
                      simpleAttackMelee(
                          damage: 150, size: Vector2(tileSize, tileSize));
                    } else {
                      removeLife(150);
                    }
                  }
                },
                radiusVision: tileSize * 16);
          }

          if (jogador is Jogador) {
            if (!jogador.atacavel) {
              if (animacaoAtual != "atacavel" && !isMorto) {
                replaceAnimation(AnimacoesFantasmas.fromColor(cor).atacavel);
                animacaoAtual = "atacavel";
              }
            } else {
              if (animacaoAtual != "normal" && !isMorto) {
                replaceAnimation(AnimacoesFantasmas.fromColor(cor).fantasma);
                animacaoAtual = "normal";
              }
            }
          }
        },
        radiusVision: tileSize * 16);
    super.update(dt);
  }

  @override
  void die() {
    replaceAnimation(AnimacoesFantasmas.fromColor(cor).fantMorto);
    animacaoAtual = "morto";
    isMorto = true;
    enableCollision(false);
  }
}

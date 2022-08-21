import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_fantasmas.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/jogador.dart';

class Fantasma extends SimpleEnemy with ObjectCollision {
  Fantasma(Vector2 position, Fantasmas cor)
      : super(
            life: 100,
            speed: 70,
            position: position,
            size: Vector2(32, 32),
            animation: AnimacoesFantasmas.fromColor(cor).fantasma) {
    _cor = cor;
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
  var _cor;
  var animacaoAtual = "";
  @override
  void update(double dt) {
    seeAndMoveToPlayer(
        closePlayer: (jogador) {
          if (jogador is Jogador) {
            if (jogador.atacavel) {
              simpleAttackMelee(damage: 150, size: Vector2(tileSize, tileSize));
            }
          }
        },
        radiusVision: tileSize * 16);
    seePlayer(
        observed: (jogador) {
          if (jogador is Jogador) {
            if (!jogador.atacavel) {
              if (animacaoAtual != "atacavel" && animacaoAtual != "morto") {
                replaceAnimation(AnimacoesFantasmas.fromColor(_cor).atacavel);
                animacaoAtual = "atacavel";
              }
            } else {
              if (animacaoAtual != "normal") {
                replaceAnimation(AnimacoesFantasmas.fromColor(_cor).fantasma);
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
    animacaoAtual = "morto";
    enableCollision(false);
    removeFromParent();
    super.die();
  }
}

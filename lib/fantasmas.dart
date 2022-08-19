import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/mixins/direction_animation.dart';
import 'package:escribo_pacman/animacoes_fantasmas.dart';
import 'package:escribo_pacman/const_enum.dart';

class FantasmaVermelho extends SimpleEnemy {
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
                runUp:
                    AnimacoesFantasmas.fromColor(Fantasmas.vermelho).fantCima));
}

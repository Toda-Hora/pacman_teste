import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/animacoes_decoracoes.dart';
import 'package:escribo_pacman/const_enum.dart';
import 'package:escribo_pacman/jogador.dart';

class BolasPontos extends GameDecoration with Sensor {
  BolasPontos(Vector2 position)
      : super.withAnimation(
            animation: AnimacoesDecor().bolasPonto,
            position: position,
            size: Vector2.all(tileSize)) {
    setupSensorArea(intervalCheck: 50);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Jogador) {
      component.adicionaScore(10);
      removeFromParent();
    }
  }
}

class BolasPoder extends GameDecoration with Sensor {
  BolasPoder(Vector2 position)
      : super.withAnimation(
            animation: AnimacoesDecor().bolasPoder,
            position: position,
            size: Vector2.all(tileSize));

  @override
  void onContact(GameComponent component) {
    if (component is Jogador) {
      component.adicionaScore(100);
      component.atacavel = false;
      removeFromParent();
    }
  }
}

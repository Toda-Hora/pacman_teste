import 'package:bonfire/bonfire.dart';
import 'package:escribo_pacman/const_enum.dart';

import 'animacoes_decoracoes.dart';
import 'jogador.dart';

class Frutas extends GameDecoration with Sensor {
  Frutas(Vector2 position, FrutasEnum fruta, this._inFruta)
      : super.withAnimation(
            animation: AnimacoesDecor().frutas(fruta),
            position: position,
            size: Vector2.all(tileSize));
  late int pontos;
  final FrutasEnum _inFruta;

  @override
  void onContact(GameComponent component) {
    if (component is Jogador) {
      switch (_inFruta) {
        case FrutasEnum.cereja:
          pontos = 300;
          break;
        case FrutasEnum.morango:
          pontos = 400;
          break;
        case FrutasEnum.pera:
          pontos = 500;
          break;
        case FrutasEnum.maca:
          pontos = 1000;
          break;
      }
      component.adicionaScore(pontos);
      removeFromParent();
    }
  }
}

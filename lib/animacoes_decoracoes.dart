import 'package:bonfire/bonfire.dart';

import 'const_enum.dart';

class AnimacoesDecor {
  final velAnimacao = 0.4;
  late double posiFruta;
  Future<SpriteAnimation> frutas(FrutasEnum fruta) {
    switch (fruta) {
      case FrutasEnum.cereja:
        posiFruta = tileSize * 2;
        break;
      case FrutasEnum.morango:
        posiFruta = tileSize * 3;
        break;
      case FrutasEnum.pera:
        posiFruta = tileSize * 4;
        break;
      case FrutasEnum.maca:
        posiFruta = tileSize * 5;
        break;
    }
    return SpriteAnimation.load(
        'personagens.png',
        SpriteAnimationData.sequenced(
            amount: 1,
            stepTime: velAnimacao,
            textureSize: Vector2(tileSize, tileSize),
            texturePosition: Vector2(posiFruta, tileSize * 3)));
  }

  Future<SpriteAnimation> get bolasPonto => SpriteAnimation.load(
      'bola.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, 0)));
  Future<SpriteAnimation> get bolasPoder => SpriteAnimation.load(
      'poder.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, 0)));
}

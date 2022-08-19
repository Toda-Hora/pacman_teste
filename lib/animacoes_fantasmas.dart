import 'package:bonfire/bonfire.dart';
import 'const_enum.dart';

class AnimacoesFantasmas {
  late double posX;
  final velAnimacao = 0.2;
  AnimacoesFantasmas.fromColor(Fantasmas cor) {
    switch (cor) {
      case Fantasmas.vermelho:
        posX = tileSize * 4;
        break;
      case Fantasmas.rosa:
        posX = tileSize * 5;
        break;
      case Fantasmas.azul:
        posX = tileSize * 6;
        break;
      case Fantasmas.amarelo:
        posX = tileSize * 7;
        break;
    }
  }
  Future<SpriteAnimation> get fantDir => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, posX)));
  Future<SpriteAnimation> get fantEsq => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(posX, tileSize * 2)));
  Future<SpriteAnimation> get fantCima => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(posX, tileSize * 4)));
  Future<SpriteAnimation> get fantBaixo => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(posX, tileSize * 6)));
}

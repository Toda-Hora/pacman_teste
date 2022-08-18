import 'package:bonfire/bonfire.dart';

class Animacoes {
  Future<SpriteAnimation> get jogPara => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(16, 0)));

  Future<SpriteAnimation> get jogCorre => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));
}

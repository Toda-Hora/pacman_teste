import 'package:bonfire/bonfire.dart';

class AnimacoesJogador {
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
  Future<SpriteAnimation> get jogAtaque => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(0, 0),
          texturePosition: Vector2(0, 0)));
  Future<SpriteAnimation> get jogMorre => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 12,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(32, 0)));
}

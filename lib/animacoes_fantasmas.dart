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
  SimpleDirectionAnimation get atacavel => SimpleDirectionAnimation(
      idleRight: fantAtacavel,
      runRight: fantAtacavel,
      idleDown: fantAtacavel,
      runDown: fantAtacavel,
      idleLeft: fantAtacavel,
      runLeft: fantAtacavel,
      runUp: fantAtacavel,
      idleUp: fantAtacavel);

  SimpleDirectionAnimation get fantasma => SimpleDirectionAnimation(
      idleRight: fantDir,
      runRight: fantDir,
      idleDown: fantBaixo,
      runDown: fantBaixo,
      idleLeft: fantEsq,
      runLeft: fantEsq,
      runUp: fantCima,
      idleUp: fantCima);

  SimpleDirectionAnimation get fantMorto => SimpleDirectionAnimation(
      idleRight: fantMortoDir,
      runRight: fantMortoDir,
      idleDown: fantMortoBaixo,
      runDown: fantMortoBaixo,
      idleLeft: fantMortoEsq,
      runLeft: fantMortoEsq,
      runUp: fantMortoCima,
      idleUp: fantMortoCima);

  Future<SpriteAnimation> get fantAtacavel => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 8, tileSize * 4)));

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
          texturePosition: Vector2(tileSize * 2, posX)));
  Future<SpriteAnimation> get fantCima => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 4, posX)));
  Future<SpriteAnimation> get fantBaixo => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 6, posX)));
  Future<SpriteAnimation> get fantMortoDir => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 8, tileSize * 5)));
  Future<SpriteAnimation> get fantMortoEsq => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 9, tileSize * 5)));
  Future<SpriteAnimation> get fantMortoCima => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 10, tileSize * 5)));
  Future<SpriteAnimation> get fantMortoBaixo => SpriteAnimation.load(
      'personagens.png',
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: velAnimacao,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(tileSize * 11, tileSize * 5)));
}

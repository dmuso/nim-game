import sdl2, sdl2.image, basic2d

type SDLException = object of Exception

type
  Input {.pure.} = enum none, left, right, jump, restart, quit

  Player = ref object
    texture: TexturePtr
    pos: Point2d
    vel: Vector2d 

  Game = ref object
    inputs: array[Input, bool]
    renderer: RendererPtr
    player: Player
    camera: Vector2d


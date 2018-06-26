import sdl2

type SDLException = object of Exception

type
  Input {.pure.} = enum none, left, right, jump, restart, quit

  Game = ref object
    inputs: array[Input, bool]
    renderer: RendererPtr


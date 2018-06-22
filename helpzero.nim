import sdl2

type SDLException = object of Exception

template sdlFailIf(cond: typed, reason: string) = 
  if cond: raise SDLException.newException(
    reason & ", SDL error: " & $getError())

proc main = 
  sdlFailIf(not sdl2.init(INIT_VIDEO or INIT_TIMER or INIT_EVENTS)):
    "SDL initialisation failed"

  # defer blocks get called at the end of the procedure, even it an
  # exception has been thrown
  defer: sdl2.quit()

  sdlFailIf(not setHint("SDL_RENDER_SCALE_QUALITY", "2")):
    "Linear texture filtering could not be enabled"
    
main()

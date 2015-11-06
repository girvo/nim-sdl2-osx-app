## Linking the SDL2.framework file for distribution as an OSX ".app" done via:
## https://github.com/nim-lang/opengl/blob/master/src/opengl.nim#L53
## 
## TODO: Need to set up the pragma for SDL2.framework
## TODO: Setup Makefile to build Example.app bundle: http://joseph-long.com/writing/app-bundles-with-a-makefile/
import sdl2

## Compiler/Linker pragmas
when defined(macosx):
    {.passC: "-F ~/Library/Frameworks -framework SDL2", passL: "-F ~/Library/Frameworks -I ~/Library/Frameworks/SDL2.framework/Headers -framework SDL2 -rpath @executable_path/../Frameworks".}
    {.pragma: sdl_header, header: "<SDL2/SDL.h>".}
elif defined(Windows):
    {.fatal: "Windows compilation yet to be implemented".}
elif defined(Linux):
    {.fatal: "Linux compilation yet to be implemented".{}

var 
  win: WindowPtr
  ren: RendererPtr
  bmp: SurfacePtr
  tex: TexturePtr

discard init(INIT_EVERYTHING)

win = createWindow("Hello World!", 100, 100, 960, 540, SDL_WINDOW_SHOWN)
if win == nil:
  echo("createWindow Error: ", getError())
  quit(1)


delay(2000)

sdl2.quit()

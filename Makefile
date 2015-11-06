## Makefile for Nim-based SDL2 OSX application
## Adapted from: http://joseph-long.com/writing/app-bundles-with-a-makefile/

FRAMEWORK_PATH=$(HOME)/Library/Frameworks
APP_NAME=Example
NIM_OPTIONS=--define:SDL_Static --parallelBuild:1

all: clean build/app
clean:
	rm -r build && mkdir -p build && touch build/.gitkeep
package: clean build/Example.app

build/app: main.nim
	nim c $(NIM_OPTIONS) --out:build/app main.nim

build/Example.app: build/app
	mkdir -p "./build/$(APP_NAME).app"/Contents/{MacOS,Resources,Frameworks}
	cp -R "$(FRAMEWORK_PATH)/SDL2.framework" "./build/$(APP_NAME).app/Contents/Frameworks/"
	cp Info.plist "./build/$(APP_NAME).app/Contents/"
	sed -e "s/APP_NAME/$(APP_NAME)/g" -i "" "./build/$(APP_NAME).app/Contents/Info.plist"
	cp ./build/app "./build/$(APP_NAME).app/Contents/MacOS/$(APP_NAME)"
	chmod +x "./build/$(APP_NAME).app/Contents/MacOS/$(APP_NAME)"

.PHONY: all clean package

# Nim &amp; SDL2 OSX App

This repository holds a working configuration and Makefile for building a proper OS X `.app` bundle with the `SDL2.framework` file included. This is something I've struggled with for nearly 12 months, and have learned a lot about linking on OS X to be able to achieve.

## Requirements

- [`nim`] >= 0.11
- [`sdl2`] Nim library (install with `nimble install sdl2`)
- [`SDL2.framework`] installed in `~/Library/Frameworks`, download from the SDL2 website

## Usage

Compile with `make package`, and just double click on the `Example.app` bundle in `build/`

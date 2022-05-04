---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Tools for gamedev

## 2D graphics: Hi-res art

* Photoshop
  * the industry standard
  * paid monthly
* Clip Studio Paint
  * ~50€
* free options: Krita, Gimp

## 2D graphics: Pixel art
* Aseprite
  * ~15€ (or free if you build it from source)
  * the go-to tool for pixel artists atm
* free option: GraphicsGale
* Hi-res options can also be used

<!-- _footer: "[Building Aseprite from source](https://www.reddit.com/r/PixelArt/comments/i387m1/guide_how_to_build_aseprite_from_source_aseprite/)"-->

## Sound effects

* bfxr
* music tools (see next slide)

## Music

* There isn't an easy recommendation in the free space really
  * LMMS sucks!
* Bosca Ceoil: the simple free option
  * very limited
* Trackers
	* openMPT
	* FamiTracker
	* MilkyTracker
* Otherwise, it's a DAW of your choice
  * unfortunately they're all pretty heavy to get into
  * i've used both FL Studio and Ableton
  * for tracker people: ReNoise
## Levels, 2D

* Unity's own tilemap editor
* Tiled
  * a free application for creating tile-based 2d levels & worlds
  * importing Tiled maps to Unity
    * [SuperTiled2Unity](https://seanba.itch.io/supertiled2unity)

## Levels, 3D
* ProBuilder
  * a package for Unity for grayboxing 3d levels
* Blender3d


## Game engines

* sometimes Unity isn't the best option!
* there are roughly three types of game development depending on your technology
  * these aren't undisputable facts, I made these following descriptions up
  * think for yourself if there's something missing

### Type 1: All-purpose Engine
  * Unity, Unreal, Godot, GameMaker Studio
  * 3D or 2D
  * drag-and-drop GUI
  * not necessarily "real" programming involved
  * when is, you won't be programming the main loop, only gluing your scripts on top of existing structures
  * suited for games big and small
  * jack of all trades, master of none
### Type 2: Framework
  * Love2D, Monogame, Pygame
  * 2D easy, 3D harder
  * no engine "window", almost everything happens in a text editor
  * basically an API full of helper functions
    * "draw sprite on coordinates x,y"
  * suited for people who...
    * want to have a tighter control on what's happening under the hood
    * want to build their own structures
    * think all-purpose engines get on their way 
### Type 3: Specialized Engine
  * Renpy, RPGMaker, Adventure Game Studio, Twine
  * A tool for making a specific kind of game
  * can involve code or its own scripting/description language
  * very fast for what it does
  * easier to fully grasp due to limited output

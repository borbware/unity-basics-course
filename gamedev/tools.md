---
marp: true
paginate: true
title: Tools for gamedev
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Tools for gamedev

## 2D graphics: Hi-res art

* [Photoshop](https://www.adobe.com/products/photoshop.html)
  * the industry standard
  * $21 PER MONTH
    * Adobe sucks
* [Clip Studio Paint](https://www.clipstudio.net/en/)
  * ~50€
* free options: ***Krita***, [Gimp](https://www.gimp.org/), [Paint.net](https://www.getpaint.net/)

## 2D graphics: Pixel art

* [Aseprite](https://www.aseprite.org/)
  * Versatile pixel editor with animation and tilemapping tools
  * $20 (or free if you build it from source)
  * the go-to tool for pixel artists atm, constantly updated
* free option: [GraphicsGale](https://graphicsgale.com/us/)
* Hi-res options can also be used for pixelart
<!-- _footer: "[Building Aseprite from source](https://www.reddit.com/r/PixelArt/comments/i387m1/guide_how_to_build_aseprite_from_source_aseprite/)"-->

## Sound effects

* ***bfxr***
  * An easy-to-get-into tool for creating new sound effects 
* ***Audacity***
  * a versatile tool for audio editing
* [ChipTone](https://sfbgames.itch.io/chiptone)
  * a free tool for generating sound effects
* Extra: [Ableton Tone Generator](https://twitter.com/gruber_music/status/1496108012959846406)
  * ($1 Patreon tier + Ableton Live)

## Music

* There isn't an easy free recommendation really (LMMS sucks)
* [Bosca Ceoil](https://terrycavanagh.itch.io/bosca-ceoil): the simple free option
  * very limited
* [SunVox](https://nightradio.itch.io/sunvox)
* Trackers
	* [openMPT](https://openmpt.org/)
	* [FamiTracker](http://famitracker.com/) (for NES audio chip music)
	* [MilkyTracker](https://milkytracker.org/) (some people like this idk)
* Otherwise, it's a DAW of your choice
  * Unfortunately they're all pretty heavy to get into
  * i've used [FL Studio](https://www.image-line.com/) previously, nowadays [Ableton](https://www.ableton.com/en/)
  * for tracker people: [ReNoise](https://www.renoise.com/)

## Levels, 2D

* Unity's own tilemap editor
* [Tiled](https://www.mapeditor.org/)
  * a free application for creating tile-based 2d levels & worlds
  * importing Tiled maps to Unity
    * [SuperTiled2Unity](https://seanba.itch.io/supertiled2unity)

## Levels, 3D

* [ProBuilder](https://unity.com/features/probuilder)
  * a package for Unity for grayboxing 3d levels
  * [More about ProBuilder in 3d platforming slides](../unity-cookbook/3dplatforming#probuilder)
* [Blender 3D](https://www.blender.org/)
  * Stupidly good for a free 3D editor
* [MagicaVoxel](https://ephtracy.github.io/)
  * A free lightweight voxel art editor
  * Create voxel-based levels
  * You know, the minecraft thing
* [CrocoTile](https://prominent.itch.io/crocotile3d) ($25)
  * a tool for creating 3d scenes with tiles
  * Free version: Saving (over 100 tiles) and exporting is deactivated.

## Story

* There are two good options for making branching stories with Unity
  * [Twine](https://twinery.org/)
  * [Yarn Spinner](https://yarnspinner.dev/)

## Screen recording

* you need to showcase your game to people!
* for recording gifs
  * ***ScreenToGif***
* for recording video with sound:
  * [Unity Recorder](https://learn.unity.com/tutorial/working-with-unity-recorder#:~:text=recorder%2D2019%2D3-,The%20Unity%20Recorder%20is%20an%20Editor%2Donly%20tool%20that%20allows,it%20using%20the%20Package%20Manager.)
  * [OBS Studio](https://obsproject.com/)

## Video editing

* for creating teasers, trailers, etc, you need a video editor
* Best free option: [DaVinci Resolve](https://www.blackmagicdesign.com/fi/products/davinciresolve)
* Blender3D works for this as well

## Other creative stuff...

* [Doodle Studio](https://fernantastic.itch.io/doodle-studio-95) ($45)
  * A FUN 2D drawing and animation tool for Unity. 
* [Playscii](https://jp.itch.io/playscii)
  * an open source ASCII art and animation program

## Other tools...

* [Microsoft PowerToys](https://github.com/microsoft/PowerToys)
  * Has a color picker! 

## Game engines

* sometimes Unity isn't the best option!
* there are roughly three types of game development depending on your technology
  * these aren't undisputable facts, I made up all these types lol

### Type 1: All-purpose Engine

  * Unity, Unreal, Godot, GameMaker Studio
  * 3D or 2D
  * drag-and-drop GUI
  * programming not necessarily involved
    * you won't be programming the main loop, but attaching your scripts on top of existing structures
  * suited for games big and small
  * jack of all trades, master of none

### Type 2: Framework

  * Love2D, Monogame, Pygame
  * Especially suited for 2D
  * no engine application window: almost everything happens in a text editor
  * basically an API full of helper functions
    * "draw sprite on coordinates x,y"
  * suited for people who...
    * want to have a tighter control on what's happening under the hood
    * want to build their own structures
    * think all-purpose engines tend to get in their way 

### Type 3: Specialized Engine

  * Renpy, RPGMaker, Adventure Game Studio, Twine...
  * A tool for making a specific kind of game
  * can involve code or its own scripting/description language
  * very fast for the exact thing it does
  * easier to comprehend fully due to limited scope

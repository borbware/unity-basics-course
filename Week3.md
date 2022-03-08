---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Week 3: Building a game

## What to expect

Emphasis: scene & data management?
## Week schedule

## Week project: Top-down shooter

## Game math 1. Vectors

See: [Vectors](math/1-vectors.md)



## Tools for assets

### Graphics

* Clip Studio Paint
  * ~50€
  * for hi-res art
  * free option: Krita
* Aseprite: for pixel art
  * ~15€ (or free if you build it from source)
  * the go-to tool for pixel artists atm
  * free options: GraphicsGale, Paint

### Sound fx

* bfxr

### Music

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
### Levels

* Tiled
  * a free application for creating tile-based 2d levels & worlds
  * importing to Unity:
* ProBuilder
  * a package for Unity for grayboxing 3d levels
  * another option: Blender3d


## Constraints
## Scene management

* Moving between scenes
## Sprites
* Sprite Animation
	* Window > Animation > Animation
	* Animation Controller
	* Animator
	* Mecanim State Machine

## Collaboration in Unity

* most important rule: don't work on the same thing simultaneously or it's chaos time
  * Be sure to communicate about scene ownership
  * Most Unity work is sent to Scene Owners as prefabs

### Github

* gotcha: logging into Github
  * cannot use password anymore, you have to create a token for https. https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/#what-you-need-to-do-today
  * repo, workflow, gist

 Collaboration tools
	* Unity collab
	* git

## Exporting
* Building an executable

## Scripting continues
* [Unity basics 2/2](#unity-basics)
	* [Important Unity classes 2/2](#important-unity-classes)
		* [Mathf, Random, Debug](#mathf-random-debug)
		* [Quaternion](#quaternion)
	* [Data persistence between scenes](#data-persistence-between-scenes)

## Week project: top-down arcade shooter

* many levels
* game over screen
* active enemies
	* träkkää pelaajaa ja alkaa seurata/ampua kohti kun rangella
* Vaihtoehto: Puzzlepeli?
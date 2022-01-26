# Week 1

## What to expect

- Familiarizing with the tools
- Learning the Unity interface
- GameObjects, Components, Prefabs, Tags & Layers
- Only a bit scripting
- C# basics
- Week project: Catlike Coding's clock exercise


- Video Game Industry introduction
- Erikoistuminen
- Unity basics (in 3d)
- VS code basics
	- hyötyä visual studiosta?
- C# basics

# Day 1

## About me

## About game development

## About game engines

## About Unity

## Installing tools

- Unity
- VS Code
- Discord
- Making accounts
	- Discord
	- Unity
	- later: Github/lab
	- even later: Itch.io

### Exercise 1.

- Install and setup all the tools needed to get the first Unity project of the course, "3DClock", running.

## Editor window

- Hierarchy
  - list of game objects in scene
  - double click to show in Scene view
- Scene & Game
  - scene: the level editor
  - game: the running game
- Inspector
  - list of components inside a game object
  - drag variable to change value
- Project
- Console
- Play & pause
- Adding new stuff
- Moving around existing stuff with QWERTY tools

- Shortcuts
  - [CTRL+C] + [CTRL+V] copy & paste
  - [CTRL+D] duplicate

## Game Objects
- 3d objects
- Empty
- Camera
- Light

## Unity Documentation

## Components
- Transform
- Collider
- Mesh
- Material
- Script

### Exercise 2.



## Prefabs
- prefabricated object
- "same thing, but what if many"
- drag a gameobject from Hierarchy to Project view
- it turns blue! 
- this means it's now an instance of a prefab
- overridden values in Inspector are indicated in **bold** 
- Open, Select, Overrides
## Tags & Layers
- Edit > Project Settings > Tags and Layers
- Tags
- GameObject.FindWithtag("tagname");
- GameObject.FindGameObjectsWithTag("tagname");
- Layers
- Some layers...
	- Default
	- Ignore Raycast
	- Custom
- Ignore some layers in camera
	- Inspector > Camera > Culling Mask > Layers
- Ignore some layers in Viewport
	- Top right: Layers...
## Scripting
- adding functionality with C# script components
- [C# basics 1/2](#c-basics)
	- [Variables and conditionals](#variables-and-conditionals)
	- [Conventions](#conventions)
	- [Arrays and Loops](#arrays-and-loops)
		- 


### Week project: CatlikeCoding clock

- Vaihtoehto: adding stuff to FPS with premade controller & assets
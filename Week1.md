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

- Perttu Tuovinen
- developer & instructor at Buutti
- indie game developer
- participated in >20 game jams
- worked on 36 small games

## About this course

- We will make video games with Unity
- Course is separated into three stages
- Stage 1
    - Learn the basics of Unity & game programming
    - With the acquired skills, make tiny games on your own
- Stage 2
	- Dive deeper in Unity
	- Learn about game design & game industry
	- Create a bit larger (yet still tiny) games in teams
- Stage 3
    - Create a single game project in the span of four weeks

## About YOU

- Your name
- Your gamedev/programming/art/music background
- Which video game you like pops to your mind first?
- What kind of a video game would you like to work on?
- What was your first video game experience?
- What is the last video game you played?

## About game development

## About game engines

## About Unity

- A commericial closed-source game engine
- Free to use for projects under $100 000 revenue
- pretty much the industry standard
	- plenty of resources available online!
- ubiquitous especially in game jams & mobile
- A huge kitchen sink of a software
- made originally for 3D games
- can be used for 2D, 3D, console, PC, mobile, ...
- uses the C# programming language

## The Unity Experience

- Unity is updated continuously
  - usually people are stuck with the version they started the project with
  - -> multiple versions on the same machine
  - about 4 gigs per install
  - Unity Hub!
- can occasionally crash
  - save your work constantly!

## Installing the tools

- Unity
- VS Code
- Discord
- Personal accounts
	- Discord
	- Unity
	- later: Github/lab
	- even later: Itch.io

---

### Exercise 1.

- Install and setup all the tools needed and create your first 3D project for the course with the name "3DClock".

---

## Unity Documentation

- docs.unity.com
- your #1 resource for learning the ins & outs of Unity
- will be heavily featured during the course

## Game Objects

- Pretty much everything in Unity is a game object
- Game objects consist of components
- Some examples
  - 3d primitives
  - Camera
  - Light
  - Empty

## Editor views

- [Unity's Interface in the Docs](https://docs.unity3d.com/Manual/UsingTheEditor.html)
- Views
  - Hierarchy window
  - Scene view
  - Game view
  - Inspector window
  - Project window
  - Console

- Views can be rearranged by dragging & dropping
- Try out different layouts from the top right "Layouts" dropdown menu

## Hierarchy window

- shows the list of game objects in a **scene**
- double click to show object in Scene view
- game objects can be nested
  - parent vs child
- Add new game objects: [RMB] + choose from list

## Scene view

### Navigation
 - [Scene view navigation in Docs](https://docs.unity3d.com/Manual/SceneViewNavigation.html)
- navigation shortcuts
  - move: [MMB]
  - orbit: [ALT+LMB]
  - zoom: roll [MMB] / [ALT+RMB]
  - rotate camera: [RMB]
  - flythru: hold [RMB], fly with [WASD] + [Q/E]
- the scene gizmo
  - "the axis thingy on the top right"
  - axis cones: change view to that axis
  - center cube: perspective / orthographic
- scene view camera settings

## Shortcuts for scene & hierarchy
  - [CTRL+C] + [CTRL+V] copy & paste
  - [CTRL+D] duplicate


### Toolbar

- for manipulating existing stuff
- activating the tool changes the [LMB] behaviour
- navigation shortcuts still available in other tools!
- in move/rotate/scale, you can use the red, green and blue shapes to manipulate x,y,z axes, respectively
- the tools
  - Q: Hand Tool (navigate)
  - W: Move Tool
    - the squares in the center: move along a plane
  - E: Rotate Tool
  - R: Scale Tool
  - those are the most important ones
  - T: Rect Tool
    - Alternative Scale Tool
  - Y: Move+Rotate+Scale
- Pivot / Center
- Local / Global

## Inspector window
- Game object properties
  - Active (the checkbox)
  - Name
  - Tag
  - Layer
- list of components inside a game object
- components can be turned off
- drag variable to change value



## Components

- Transform
  - included even in an empty game object by default
  - position / rotation / scale
- Collider
  - enables collision
  - different shapes and sizes
  - object can collide into other game objects and vice versa
  - isTrigger
- Renderer
  - the visible part of the game object
- Material
- RigidBody
  - for interacting with the physics engine 
- Script
  - custom C# code
  - the most versatile component

## Project window

- List of Assets & Packages in your projects
- Assets
	- Scenes
	- Prefabricated game objects
	- Graphics
	- Sound effects
	- Music

## Console

- Error messages
- Debug messages

## Game Window

- Simulates what your final rendered game will look like through your Scene Cameras
- Play & pause buttons
- When game is running, you can still

---

### Exercise 2.

Create a clock with three hands and 12 indicators.
Create a duplicate of the clock!

---

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

---

### Exercise 3.

Make the clock hands move when time goes on.

---

### Week project: CatlikeCoding clock

- Vaihtoehto: adding stuff to FPS with premade controller & assets
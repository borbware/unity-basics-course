
- [Overview](#overview)
- [Week 1: The toolkit](#week-1-the-toolkit)
	- [Unity basics](#unity-basics)
	- [Exercises](#exercises)
	- [Week project: CatlikeCoding clock](#week-project-catlikecoding-clock)
- [Week 2: Scripting & Game design](#week-2-scripting--game-design)
	- [Week project: Asteroids](#week-project-asteroids)
- [Week 3: Building a game](#week-3-building-a-game)
	- [Week project: top-down arcade shooter](#week-project-top-down-arcade-shooter)
- [Week 4: Advanced techniques](#week-4-advanced-techniques)
	- [Week project](#week-project)
# Overview

- Week 1
	- Familiarizing with the tools
	- Learning the Unity interface
	- GameObjects, Components, Prefabs, Tags & Layers
	- Only a bit scripting
	- C# basics
	- Week project: Catlike Coding's clock exercise
- Week 2
	- More C# concepts
	- Input & movement
	- Important Unity classes like GameObject, Transform and Vector2.
	- Rigidbodies, 2d physics, collision
	- Week project: Asteroids
- Week 3
	- Sprite animation & Mecanim
	- scene management
	- external tools for assets
	- collaboration tools: git & Unity collab
	- more important Unity classes: Mathf, Random, Debug, Quaternion
	- Week project: Top-down arcade shooter
- Week 4
	- Advanced Unity concepts
	- Events, Entity component system
	- Delayed actions
	- interpolation
	- scriptable objects
	- Advanced C#
	- Week project: Turn-based elemental RPG battle
# Week 1: The toolkit

- Installing tools
	- Unity
	- VS Code
	- Discord
- Making accounts
	- Discord
	- Unity
	- Github/lab
	- Itch.io
- Video Game Industry introduction
- Erikoistuminen
- Unity basics (in 3d)
- VS code basics
	- hyötyä visual studiosta?
- C# basics (if there's time.)

## Unity basics
- Editor window
	- Hierarchy
	- Inspector
	- Project
	- Console
	- Play & pause
	- Adding new stuff
	- Moving around existing stuff with QWERTY tools
- Unity Concepts
	- Game Objects
		- 3d objects
		- Empty
		- Camera
		- Light
	- Components
		- Transform
		- Mesh
		- Material
		- Script
		- RigidBody
	- Prefabs
		- prefabricated object
		- "same thing, but what if many"
		- drag a gameobject from Hierarchy to Project view
			- it turns blue! 
			- this means it's now an instance of a prefab
			- overridden values in Inspector are indicated in **bold** 
		- Open, Select, Overrides
	- Tags & Layers
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
- Scripting
	- adding functionality with C# script components
	- [C# basics 1/2](#c-basics)
		- [Variables and conditionals](#variables-and-conditionals)
		- [Conventions](#conventions)
		- [Arrays and Loops](#arrays-and-loops)
## Exercises
- Get to Debug.Log("Hello world")
## Week project: CatlikeCoding clock
- Vaihtoehto: adding stuff to FPS with premade controller & assets

# Week 2: Scripting & Game design

Emphasis: Learning C#
- Unity basics (in 2d)
- Rigidbodies
	- AddTorque
	- AddForce
- Collision
- Movement
- 2d physics
- [C# basics 2/2](#c-basics)
	- [Classes](#classes)
	- [Enums](#enums)
- [Unity basics 1/2](#unity-basics)
	- [Monobehaviour methods](#monobehaviour-methods)
	- [Getting Input](#getting-input)
	- [Important Unity classes 1/2](#important-unity-classes)
		- [GameObject](#gameobject)
		- [Transform](#transform)
		- [Vector3 & Vector2](#vector3--vector2)

## Week project: Asteroids
- 1 screen, passive enemies
- Playing Audio
- Singleton
- Instantiate and Destroy
- Rigidbody
- screen wrap

# Week 3: Building a game

- Tools for assets
	- Graphics, 2d
	- Sound fx
	- Music
	- Level design
- Moving between scenes
- Sprites
- Sprite Animation
	- Window > Animation > Animation
	- Animation Controller
	- Animator
	- Mecanim State Machine
- Collaboration tools
	- Unity collab
	- git
- Building an executable
- [Unity basics 2/2](#unity-basics)
	- [Important Unity classes 2/2](#important-unity-classes)
		- [Mathf, Random, Debug](#mathf-random-debug)
		- [Quaternion](#quaternion)
	- [Data persistence between scenes](#data-persistence-between-scenes)

Emphasis: scene & data management

## Week project: top-down arcade shooter

- many levels
- game over screen
- active enemies
	- träkkää pelaajaa ja alkaa seurata/ampua kohti kun rangella
- Vaihtoehto: Puzzlepeli?

# Week 4: Advanced techniques

- Game design
- Game programming patterns
- [Unity advanced](#unity-advanced)
	- Entity-component-system (ECS)
	- [Delayed actions](#delayed-actions)
	- [Delegates and Events (3b)](#delegates-and-events-3b)
		- [Delegates](#delegates)
		- [Events](#events)
		- [Actions](#actions)
		- [Unity Events](#unity-events)
		- [Scriptable object Unity Event](#scriptable-object-unity-event)
	- [Generics, IEnumerable (4c)](#generics-ienumerable-4c)
	- [ScriptableObject](#scriptableobject)
	
## Week project
- ???
- RPG-taistelu
- Vaihtoehto: 2d platformer
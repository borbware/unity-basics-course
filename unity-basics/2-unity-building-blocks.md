---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# 2. Unity's building blocks

## Scenes

* [Manual: Scenes](https://docs.unity3d.com/Manual/CreatingScenes.html)
* Scene is a container for content
  * A game can be just one scene, or a combination of multiple ones
* Example scenes:
  * Main Menu
  * A scene for every level
  * Game Over
* Create New Scene: ***Assets > Create > Scene***
* New scenes use Unity's default Scene template, but you can create your own
  * [Manual: Scene templates](https://docs.unity3d.com/Manual/scene-templates.html)

## GameObjects

* [Manual: GameObjects](https://docs.unity3d.com/Manual/GameObjects.html)
* Pretty much everything in Unity is a ***GameObject***
* Fundamental objects in Unity that represent characters, props and scenery
* Some examples...
  * [Manual: 3d primitives](https://docs.unity3d.com/Manual/PrimitiveObjects.html): Cube, Cylinder, Sphere
  * Camera
  * Light
  * Empty


## GameObject Hierarchy

![](imgs/gameobject-hierarchy.png)

* GameObjects can have multiple ***child*** gameobjects
  * Children inherit their parent's translation, rotation, scale and activeness
  * [Manual: Hierarchy: Parenting](https://docs.unity3d.com/Manual/Hierarchy.html#Parenting)
  * [Manual: Transform: Parenting](https://docs.unity3d.com/Manual/class-Transform.html#Parenting)


## Components
* GameObjects act as containers for ***Components*** that implement various functionalities
* [Manual: Components](https://docs.unity3d.com/Manual/Components.html)

### Spatial information

* ***Transform***
  * [Manual: Transform](https://docs.unity3d.com/Manual/class-Transform.html)
  * position, rotation, scale
  * parenting information
  * included in every GameObject

### Interacting with other GameObjects

* ***Collider***
  * enables collision
  * different shapes and sizes
  * object can collide into other game objects and vice versa
  * isTrigger
* ***RigidBody***
  * for interacting with the physics engine 

### Drawing the GameObject

* ***Renderer***
  * how is the GameObject drawn on screen?
* ***Material***
  * What material does the Renderer use?

### Custom Functionality

* ***Script***
  * custom C# code
  * the most versatile component
  * We'll dive deeper into this in [4. Scripting GameObjects](4-scripting-gameobjects.md)

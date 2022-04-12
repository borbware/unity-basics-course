---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# 2D basics

## Using Unity for 2D games

* [Manual: 2D or 3D](https://docs.unity3d.com/Manual/2Dor3D.html)
* [Manual: 2D and 3D Mode settings](https://docs.unity3d.com/Manual/2DAnd3DModeSettings.html)
* [Manual: 2D Game Development Quickstart Guide](https://docs.unity3d.com/Manual/Quickstart2D.html)
  * [Manual: Initial Setup for 2D Games](https://docs.unity3d.com/Manual/Quickstart2DSetup.html)
* Unity is first and foremost a 3D engine (x, y, z)
  * there is no dedicated 2D (x, y) mode
* There is a dedicated `Vector2` class for 2D vectors
  * Some vectors used in 2D, like `transform` are still `Vector3`

## 2D Project template

* When creating a new project, you can choose a 2D project template
* ***IT'S STILL SECRETLY 3D***, the z axis is just disregarded
* It basically just adjusts the Unity UI
  * some 2D GameObject templates, like sprites and tilemaps available
* You can change between 3D and 2D view modes by pressing the *2D* button in the Scene view


## 2D Primitive GameObjects

* For drawing basic shapes in 2D
* [Manual: 2D Primitives](https://docs.unity3d.com/Manual/2DPrimitiveObjects.html)


## Camera component

* 2D camera needs to be orthographic
  ![](imgs/camera.png)

# Collision & Physics

## Collider components

* See: [Collision](collision.md)
* Remember to use the 2D versions
  * Polygon Collider ***2D***
  * Circle Collider ***2D***
  * ...

## RigidBody2D component

* See: [Physics](physics.md)

## Effectors

* [Manual: Effectors 2D](https://docs.unity3d.com/Manual/Effectors2D.html)

# Rendering

## Line Renderer component

* [Manual: Line Renderer](https://docs.unity3d.com/Manual/class-LineRenderer.html)
* Use for drawing a line on screen

## Sprite Renderer component

* 2d images in games are called ***sprites***
* They're drawn on screen with the ***Sprite Renderer*** component

	![](imgs/sprite-renderer.png)

### Example: Using Sprite Assets

1) Create a .png image file
2) Add it to your Assets folder
3) Click it once to see its properties in the Inspector. Set the values:
   * ***Pixels per unit*** value tells how big the sprite should be on screen
   * If you're using pixelart, you need to take some more things into consideration
     * See: [Pixelart in Unity](../unity-cookbook/2d-art.md#pixelart-in-unity)
4) Drag it from the Project window into the Sprite field in the Sprite Renderer component


## Extra: 2D shooting
<!-- _backgroundColor: pink -->

* [Brackeys video: 2D shooting](https://www.youtube.com/watch?v=wkKsl1Mfp5M)
* Slow bullets: Instantiate a bullet prefab
* Instant hit: Raycasting
  ```c#
  RaycastHit2D hit = Physics2D.Raycast(line.transform.position,
    line.transform.up,
    lineDistance);
  ```
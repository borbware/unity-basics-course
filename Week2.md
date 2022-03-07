---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Week 2: Scripting & Game design

## What to expect

* Unity basics (in 2d)
* Input
* Vectors
* Physics
* Collision
* Movement

# Day 1: Input & Vectors

## Week project 2: Asteroids
<!-- _backgroundColor: purple -->
*  Recreate the classic arcade game Asteroids in Unity.
     * [Youtube: Asteroids gameplay](https://www.youtube.com/watch?v=WYSupJ5r2zo)

Goal:
* ⭐ MVP: Create a playable single-screen game of Asteroids.
## Extra goals:
<!-- _backgroundColor: purple -->
* ⭐⭐ Add one of the following features:
  * Hi scores & scoreboard
  * Randomized asteroid spawining
  * Level progression: new asteroids appear
  * Twin-stick: Use right stick to control the bullet direction 
* ⭐⭐⭐ Spice up the game: Add a game mechanic of your own


## Exercise 0.
<!-- _backgroundColor: purple -->
Examine the gameplay video, then play the example Unity-built Asteroids.

In you groups, write down:
* What features do you see? 
* How would you begin implementing them?
* Which feature would you implement first?

## Using Unity for 2D games

* Last week we focused on 3D (x, y, z)
* Unity does not have a dedicated 2D (x, y) mode
* You can create a 2D project template, however
  * This essentially hides some gameobject templates like 3d primitives
    * Replaces them with 2d primitives
  * It still uses the 3D engine, the z axis is just disregarded
* There is a dedicated Vector2 class for 2D vectors
  * Some vectors used in 2D **are still 3D** due to Unity being a 3D engine!


## Input handling

See: [Input handling](unity-cookbook/input-handling.md)

## Game math 1. Vectors

See: [Vectors](math/1-vectors.md)

## Exercise 1.
<!-- _backgroundColor: purple -->

Create the Player controlled ship for the Asteroids game.

# Day 2: Scripting 2
[Scripting 2: Lists and Loops](scripting/2-lists-loops.md)

# Day 3: Physics & Collision

## Physics

See: [Physics](unity-cookbook/physics.md)

* Physics
  * Rigidbody
    * .velocity
    * .angularVelocity
  * AddForce
  * AddTorque
* Math
  * Mathf.Abs
  * Mathf.Clamp

## Week Project Components

### The ship
* Components
  * Sprite Renderer
  * Rigidbody2D
  * PolygonCollider
  * Audio Source
  * Scripts
    * Movement
    * Ship
    * WrapAround
    * BounceScale
### Child components
* ShotPos
* ThrustPos
* ThrustParticles
  * Particle System
* Laser
  * Line Renderer
### Bullet

* SpriteRenderer
* Rigidbody2D
* Circle Collider 2D
* Bullet Script
* prefab
* instantiating
### The UI
* Main Camera
  * camera
  * flare layer
  * audio listener
### Canvas
  * Components
    * RectTransform
    * Graphic Raycaster
    * ScoreManager script
    * UI script
    * Life Gameobject
  * Life1..3
    * Canvas Renderer
    * Image
  * Score
    * Text
### Asteroids

* SpriteRenderer
* Circle Collider 2D
* Rigidbody 2D
* Asteroid Script
* WrapAround Script
* extra: generating a level



# Day 4: Git

TODO: vain absolute basics gitistä
* initialisointi
* add
* commit
* push

[Project management 1: Git](project-management/1-git.md)

# Day 5: Playtesting


---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Pathfinding

## Artificial Intelligence (AI)

* A catch-all term for techniques to create ***seemingly*** intelligent non-player characters (NPCs)
* The most important problem in programming a game AI:
  * *"How to figure out a path from A to B?"*
  * After this is solved, we can easily...
  	* make enemies patrol around
  	* make enemies follow the player
  	* make enemies attack other enemies?!?
* Pathfinding is not necessary in all games to create interesting enemies, though
  * In Super Mario Bros, enemies just go left and right lol

## 3D pathfinding

* [Manual: Navigation and pathfinding](https://docs.unity3d.com/Manual/Navigation.html)
* [Learn: Navigation](http://unity3d.com/learn/tutorials/topics/navigation)


## Quick intro to Unity Navigation

* [Manual: Navigation System in Unity](https://docs.unity3d.com/Manual/nav-NavigationSystem.html)
* Unity Navigation System consists of...
  * NavMesh: walkable surfaces
  * NavMesh Agent: entities that walk on NavMeshes
  * NavMesh Link: shortcuts
  * NavMesh Obstacle: movable objects blocking navigation
## 2D pathfinding

* Unity doesn't have 2D NavMeshes by default, yay
* There are many 3rd party assets for that, though
  * [Aron Granberg: A*](https://arongranberg.com/astar/)
  * [H8man: NavMeshPlus](https://github.com/h8man/NavMeshPlus)
  * [Nodal Pathfinding in Unity 2D with A*](http://www.jgallant.com/nodal-pathfinding-in-unity-2d-with-a-in-non-grid-based-games/)
  * [noobtuts: Navigation2D](https://noobtuts.com/unity/navigation2d)

## A*


## Exercise 0.

Make a point and click character controller:
* When you click on a walkable spot, make the character walk to it. 

## Exercise 1.

Create a non-player character that patrols between three points on a 2d top-down area.

## Exercise 2.

Add a visibility cone for the enemy. If it sees the player, make it follow it.

If the player is outside the visibility cone for five seconds, make the enemy return to its patrol area. 

## Learning

* [Brackeys video: 2D Pathfinding](https://www.youtube.com/watch?v=jvtFUfJ6CP8)


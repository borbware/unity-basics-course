---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# 2. The Unity Interface
## Game Objects

* Pretty much everything in Unity is a game object
* Game objects consist of components
* Some examples...
  * 3d primitives (Cube, Cylinder, Sphere...)
  * Camera
  * Light
  * Empty
## Editor views

* [Docs: Unity's Interface](https://docs.unity3d.com/Manual/UsingTheEditor.html)
* Views
  * Hierarchy window
  * Scene view
  * Game view
  * Inspector window
  * Project window
  * Console

* Views can be rearranged by dragging & dropping
* Try out different layouts from the top right "Layouts" dropdown menu
## Hierarchy window

* [Docs: Hierarchy](https://docs.unity3d.com/Manual/Hierarchy.html)
* shows the list of game objects in a **scene**
* double click to show object in Scene view
* game objects can be nested
  * parent vs child
  * position/rotation/scale is inherited from parent
* Add new game objects: [RMB] + choose from list
## Scene view
![the scene view](imgs/week1-sceneview.png)

### Navigation
* [Docs: Scene view navigation](https://docs.unity3d.com/Manual/SceneViewNavigation.html)
* navigation shortcuts
  * move: [MMB]
  * orbit: [ALT+LMB]
  * zoom: roll [MMB] / [ALT+RMB]
  * rotate camera: [RMB]
  * flythru: hold [RMB], fly with [WASD] + [Q/E]
* the scene gizmo
  * "the axis thingy on the top right"
  * axis cones: change view to that axis
  * center cube: perspective / orthographic
* scene view camera settings
## Shortcuts for scene & hierarchy
  * [CTRL+C] + [CTRL+V] copy & paste
  * [CTRL+D] duplicate
  * [F]: center camera on selected object
    * helps e.g., if camera zooms in too large increments
    * press twice to follow the object
### Toolbar

* [Docs: Toolbar](https://docs.unity3d.com/Manual/Toolbar.html)
* for manipulating existing stuff
* activating the tool changes the [LMB] behaviour
* navigation shortcuts still available in other tools!
* in move/rotate/scale, you can use the red, green and blue shapes to manipulate x,y,z axes, respectively
### Toolbar tools
* The tools
  * Q: Hand Tool (navigate)
  * W: Move Tool
    * the squares in the center: move along a plane
  * E: Rotate Tool
  * R: Scale Tool
  * those are the most important ones
  * T: Rect Tool
    * Alternative Scale Tool
  * Y: Move+Rotate+Scale
* Pivot / Center
* Local / Global
## Inspector window

* [Docs: Inspector](https://docs.unity3d.com/Manual/UsingTheInspector.html)
* Game object properties
  * Active (the checkbox)
  * Name
  * Tag
  * Layer
* list of components inside a game object
* components can be turned off
* drag variable to change value
* hover over variable name to show info

## GameObjects

## Cylinder

## Camera

* Tip: Select camera and press [CTRL+SHIFT+F] to align camera view with the Scene window viewpoint

## Light


## Components
### Location in scene
* **Transform**
  * included even in an empty game object by default!
  * position / rotation / scale
### Collision

* **Collider**
  * enables collision
  * different shapes and sizes
  * object can collide into other game objects and vice versa
  * isTrigger
* **RigidBody**
  * for interacting with the physics engine 
### Others
* Drawing the component
  * **Renderer**
    * the visible part of the game object
  * **Material**
* **Script**
  * custom C# code
  * the most versatile component

  
## Game view

* [Docs: Game view](https://docs.unity3d.com/Manual/GameView.html)
* Simulates what your final rendered game will look like through your Scene Cameras
* Play & pause buttons
* When game is running, you can still manipulate the values in the Inspector window
  * a nice way to mess around and find the right values for physics interactions etc.
  * changes made during the play mode do not persist!!!!
  * protip: go to `Edit > Preferences > Colors` and change the play mode tint to red.
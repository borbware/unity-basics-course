---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 1. The Unity Interface

## Editor views

* [Manual: Unity's Interface](https://docs.unity3d.com/Manual/UsingTheEditor.html)
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

* [Manual: Hierarchy](https://docs.unity3d.com/Manual/Hierarchy.html)
* shows the list of GameObjects in a scene
* double click to show object in Scene view
* game objects can be nested
  * parent-child hierarchy
* Add new GameObjects: ***RMB*** + choose from list

<!-- _footer: "LMB, MMB, RMB: Left/Middle/Right mouse button" -->
---
![the scene view](imgs/week1-sceneview.png)
## Scene view
* [Manual: Scene view navigation](https://docs.unity3d.com/Manual/SceneViewNavigation.html)
* Navigation shortcuts
  * move: ***MMB***
  * orbit: ***ALT+LMB***
  * zoom: roll ***MMB*** / ***ALT+RMB***
  * rotate camera: ***RMB***
  * flythrough: hold ***RMB***, fly with ***WASD + Q/E***
* The Scene Gizmo
  * "the axis thingy on the top right"
  * axis cones: change view to that axis
  * center cube: perspective / orthographic
* [Manual: Scene view camera](https://docs.unity3d.com/Manual/SceneViewCamera.html)
## Shortcuts for scene & hierarchy
* ***CTRL+C*** + ***CTRL+V*** copy & paste
* ***CTRL+D*** duplicate
* ***F***: center camera on selected object
  * helps e.g., if camera zooms in too large increments
  * press twice to follow the object
* Tip: Select camera and press ***CTRL+SHIFT+F*** to align camera view with the Scene window viewpoint
### Toolbar

* [Manual: Toolbar](https://docs.unity3d.com/Manual/Toolbar.html)
* Used for manipulating existing stuff
* Activating the tool changes the ***LMB*** behaviour
* Navigation shortcuts still available in other tools!
* In move/rotate/scale, you can use the red, green and blue shapes to manipulate x,y,z axes, respectively
### Toolbar tools
* The tools
  * ***Q***: Hand Tool (navigate)
  * ***W***: Move Tool
    * the squares in the center: move along a plane
  * ***E***: Rotate Tool
  * ***R***: Scale Tool
  * those were the most important ones, but there's also:
  * ***T***: Rect Tool
    * Alternative Scale Tool
  * ***Y***: Move+Rotate+Scale
* Pivot / Center
* Local / Global
## Inspector window

* [Manual: Inspector](https://docs.unity3d.com/Manual/UsingTheInspector.html)
* GameObject properties
  * Active (the checkbox)
  * Name
  * Tag
  * Layer
* Inspector shows what components does a game object have
* Components can be turned off
* UI tips:
  * drag variable to change value
  * hover over variable name to show info
 
## Game view

* [Manual: Game view](https://docs.unity3d.com/Manual/GameView.html)
* Simulates what your final rendered game will look like through your Scene Cameras
* Play & pause buttons
* When game is running, you can still manipulate the values in the Inspector window
  * a nice way to mess around and find the right values for physics interactions etc.
  * changes made during the play mode do not persist!!!!
  * protip: go to *Edit > Preferences > Colors* and change the play mode tint to red.

## Project window

* [Manual: Project window](https://docs.unity3d.com/Manual/ProjectView.html)
* List of ***Assets*** & ***Packages*** in your projects
* Assets
	* Scenes
	* Prefabricated game objects (prefabs)
	* Materials
	* Graphics, Sound effects, Music...
* Packages
  * Additional code & assets installed from the Unity Package Registry

## Console window

* [Manual: Console window](https://docs.unity3d.com/Manual/Console.html)
* Error messages
* Debug messages
* Other messages
* Helpful options:
  * ***Clear*** (remove old messages)
  * ***Collapse*** (don't repeat duplicate messages)
  * *$\vdots$ > Log Entry > 1 Line* (show only one line per message)
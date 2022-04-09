---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# User interface

## Unity UI

* A package for creating User Interface (UI) components
  * contained in new Unity projects by default
* For elements that stay in constantly on screen
  * HP bars, menu buttons...
* [Packages: Unity UI](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/index.html)
* [Packages: Unity UI: Basic layout](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIBasicLayout.html)
* [Learn: UI components](https://learn.unity.com/tutorial/ui-components#5c7f8528edbc2a002053b4d0)


## Canvas
* UI elements are drawn on a separate canvas and on a separate layer
* Create a new ***Canvas*** GameObject with *GameObject > UI > Canvas*
* [Packages: Unity UI: Canvas](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UICanvas.html)
* Screen space vs World space 
  * Screen space
    * UI elements are rendered to fixed place on the screen, on top of the scene
  * World space
    * UI elements are hanging out with the GameObjects
    * "Diegetic interface"


## Canvas GameObject

* The Canvas GameObject has these components by default
  * ***Rect Transform***
  * ***Canvas***
  * ***CanvasScaler***
    * [Packages: Unity UI: CanvasScaler](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-CanvasScaler.html)
  * ***Graphic Raycaster***

### Rect Transform Component

* [Packages: Unity UI: Rect Transform](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/class-RectTransform.html)
* UI counterpart for Transform
  * RectTransform inherits from Transform
* `RectTransform.position` is the world space position
* `RectTransform.localPosition` is the position relative to its parent
* [`RectTransform.anchoredPosition`](https://docs.unity3d.com/ScriptReference/RectTransform-anchoredPosition.html) is the screen space position of the pivot of relative to the anchor reference point
* ***Do not use SpriteRenderer component in UI***
  * instead, draw images on screen with the ***Image*** component

<!-- _footer: "[Unity forums: anchoredPosition vs localPosition vs pivotPosition](https://forum.unity.com/threads/difference-between-all-anchoredposition-localposition-and-pivotposition.903722/)" -->

### Canvas Component

### CanvasScaler Component

### Graphic Raycaster




## Adding 2d graphics to a 3d scene

* https://www.tutorialspoint.com/unity/unity_creating_sprites.htm
* create a .png file in your chosen graphics software
* drag the graphics file to unity Project view
* make sure the Texture type is Sprite (2D and UI)
* Drag the texture from Project to Hierarchy

## UI Gotchas

### There's a weird white box surrounding my UI elements

* Turn off the Canvas Gizmo in Play mode, under the Gizmos dropdown menu.

### My sprite is moving wildly when I resize the screen

* you have to change the Anchor presets
* *Inspector > Rect Transform > the square* 
  * Pressing down ***Shift+Alt*** exposes additional options

# UI exercise 1

Continue the Exercise 3 from Collision. Create a counter for the collected items that sits on the top left corner of the screen.




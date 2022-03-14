---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Crating User Interface

## Unity UI

* A package for creating User Interface components
  * contained in new Unity projects by default
* for elements that stay in constantly on screen
  * HP bars, menu buttons...
* [Packages: Unity UI](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/index.html)
* [Packages: Unity UI: Basic layout](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIBasicLayout.html)
* [Learn: UI components](https://learn.unity.com/tutorial/ui-components#5c7f8528edbc2a002053b4d0)


## Canvas
* UI elements are drawn on a separate canvas and on a separate layer
* Create a new ***Canvas*** GameObject with *GameObject > UI > Canvas*
* [Packages: Unity UI: Canvas](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UICanvas.html)
  * world space vs screen space


## Canvas components

* The Canvas GameObject has these components by default
  * Rect Transform
  * Canvas
  * CanvasScaler
    * [Packages: Unity UI: CanvasScaler](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-CanvasScaler.html)
  * Graphic Raycaster

### Rect Transform

* [Packages: Unity UI: Rect Transform](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/class-RectTransform.html)
* UI counterpart for Transform
  * RectTransform inherits from Transform
  * [Unity forums: anchoredPosition vs localPosition vs pivotPosition](https://forum.unity.com/threads/difference-between-all-anchoredposition-localposition-and-pivotposition.903722/)
* `RectTransform.position` is the worldspace position.
* `RectTransform.localPosition` is the position based on its parent's coordinate system.
* `RectTransform.anchoredPosition` is the object's self-coordinate.(screenspace).It will be influenced by anchors and pivot.
* do not use spriteRenderer in UI
  * instead, draw images on screen with Image component
 
### Canvas

### CanvasScaler

### Graphic Raycaster


## WP Exercise 1. Add a basic UI

Show Player's lives and Score.

## Adding 2d graphics to a 3d scene

* https://www.tutorialspoint.com/unity/unity_creating_sprites.htm
* create a .png file in your chosen graphics software
* drag the graphics file to unity Project view
* make sure the Texture type is Sprite (2D and UI)
* Drag the texture from Project to Hierarchy

### Help!! My sprite is moving wildly when I resize the screen

* you have to change the Anchor presets
* Inspector > Rect Transform > the square 
  * shift
  * alt
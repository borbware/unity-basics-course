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

<!-- _footer: "[Learn: UI components](https://learn.unity.com/tutorial/ui-components#5c7f8528edbc2a002053b4d0)" -->

## Canvas
* UI elements are drawn on a separate canvas and on a separate layer
  * Canvas represents the rectangular area in which the UI is drawn
  * More about it later!
* Create a new ***Canvas*** GameObject with *GameObject > UI > Canvas*
* [Packages: Unity UI: Canvas](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UICanvas.html)

## Canvas GameObject

* The Canvas GameObject has these components by default
  * ***Rect Transform***
  * ***Canvas***
  * ***CanvasScaler***
  * ***Graphic Raycaster***

## Rect Transform Component

* [Packages: Unity UI: Rect Transform](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/class-RectTransform.html)
* UI counterpart for the Transform component
  * Has width and height as well
  * (RectTransform inherits from Transform!)
* Has also ***anchor points*** for aligning with the canvas, or a parent UI GameObject

## Canvas Component

* [Packages: Unity UI: Canvas class](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/class-Canvas.html)
* Screen space vs World space 
  * Screen space
    * UI elements are rendered to fixed place on the screen, on top of the scene
  * World space
    * UI elements are hanging out with other GameObjects
    * "Diegetic interface"

## CanvasScaler Component

* [Packages: Unity UI: CanvasScaler](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-CanvasScaler.html)

* Important setting: *UI Scale mode*
  * *Constant pixel size* & *Constant physical size*:
    * Elements get bigger on lower resolutions 
  * *Scale with screen size*:
    * Elements are defined as always taking a given ratio of the screen size
    * you can choose if you rather match the screen width or screen height with *Screen Match Mode*

## Graphic Raycaster Component

* The Graphic Raycaster is used to raycast against a Canvas.
* The Raycaster looks at all Graphics on the canvas and determines if any of them have been hit.
* [Graphic Raycaster](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-GraphicRaycaster.html)
* Can be used to determine if the cursor is over a Graphics element in the Scene:
  * [GraphicRaycaster.Raycast](https://docs.unity3d.com/2017.3/Documentation/ScriptReference/UI.GraphicRaycaster.Raycast.html)

## Visual components

* These are used for actually drawing things in the UI 
* [Packages: Unity UI: Visual Components](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIVisualComponents.html)
  * [Text](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-Text.html) 
  * [Image](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-Image.html) (& [Raw Image](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-RawImage.html))
  * [Mask](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-Mask.html) (& [RectMask2D](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-RectMask2D.html))
* ***NOTE:*** For drawing images on UI, you need to use the Image component, ***NOT the Sprite Renderer!***

## More RectTransform stuff

### Rect Transform position

* `RectTransform.position` is the world space position
* `RectTransform.localPosition` is the position relative to its parent
* [`RectTransform.anchoredPosition`](https://docs.unity3d.com/ScriptReference/RectTransform-anchoredPosition.html) is the screen space position of the pivot of relative to the anchor reference point
<!-- _footer: "[Unity forums: anchoredPosition vs localPosition vs pivotPosition](https://forum.unity.com/threads/difference-between-all-anchoredposition-localposition-and-pivotposition.903722/)" -->

### Rect Transform Anchor points

* [Packages: Unity UI: Basic Layout](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIBasicLayout.html)
* RectTransform Uses ***Anchors***: four small triangular handles in the Scene View
  * Anchors can be set from the *Scene view*, with the *Anchor presets*, or from the *Inspector*
  * See the link above and mess around with anchors while doing so!

## UI Gotchas!

### There's a weird white box surrounding my UI elements

* Turn off the Canvas Gizmo in Play mode, under the Gizmos dropdown menu.

### My sprite is moving wildly when I resize the screen

* you have to change the ***Anchor presets***
* *Inspector > Rect Transform* and click on the square on the left 
  * Pressing down ***Shift+Alt*** exposes additional options

## UI exercise 1: Basics
<!-- _backgroundColor: Khaki -->

Continue the Exercise 3 from Collision. Create a counter for the collected items that sits on the top left corner of the screen.

See how UI scaling changes when you change the CanvasScaler component settings!

## UI exercise 2: Buttons
<!-- _backgroundColor: Khaki -->

Create a UI with three buttons.

Change the color of the button when it has been pressed!

Try out setting RectTransform anchor points and see how the UI changes when you change the game resolution in the Game view.
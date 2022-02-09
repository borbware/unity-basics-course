## UI elements

- Unity UI system
  - [Docs: Unity UI](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/index.html)
  - [Docs: Unity UI: Basic layout](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIBasicLayout.html)
- components
  - rectTransform
    - UI counterpart for transform
    - [Unity forums: anchoredPosition vs localPosition vs pivotPosition](https://forum.unity.com/threads/difference-between-all-anchoredposition-localposition-and-pivotposition.903722/)
    - RectTransform inherits from Transform.
	- RectTransform.position is the worldspace position.
	- RectTransform.localPosition is the position based on its parent's coordinate system.
	- RectTrasnform.anchoredPosition is the object's self-coordinate.(screenspace).It will be influenced by anchors and pivot.
  - do not use spriteRenderer in UI
    - instead, draw images on screen with Image component
 
- [Learn: UI components](https://learn.unity.com/tutorial/ui-components#5c7f8528edbc2a002053b4d0)
- UI elements are drawn on a different canvas and on a different layer (UI)
- Canvas
  - [Docs: Unity UI: Canvas](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UICanvas.html)
    - world space vs screen space
  - [Docs: Unity UI: CanvasScaler](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-CanvasScaler.html)

## Adding 2d graphics to a 3d scene

- https://www.tutorialspoint.com/unity/unity_creating_sprites.htm
- create a .png file in your chosen graphics software
- drag the file to unity Project view
- make sure the Texture type is Sprite (2D and UI)
- Drag the texture from Project to Hierarchy

### Help!! My sprite is moving wildly when I resize the screen

- you have to change the Anchor presets
- > Inspector > Rect Transform > the square 
  - shift
  - alt
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
* *Render mode*: Screen space vs World space 
  * Screen space
    * UI elements are rendered to fixed place on the screen, on top of the scene
  * World space
    * UI elements are hanging out with other GameObjects
    * "Diegetic interface"
* *Order in Layer*: Change this to arrange which UI elements are drawn on top
  * ***Note:*** You can add a new canvas component to an UI component inside a canvas and change its sorting order!

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

### Updating UI

* You can update the text fields of a Text component with code:
```c#
[SerializeField] Text textComponent;
...
  public void setScore(int newScore)
  {
      textComponent.text = $"Score: {newScore}";
  }
```

## Interaction components

* [Packages: Unity UI: Interaction components](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIInteractionComponents.html)

* Button
* Toggle
* Slider
* Scrollbar
* Dropdown
* Input Field
* ...

### Creating functionality with the UI

* Functional UI GameObjects can be connected to your other GameObjects
* For example, for the ***Button*** GameObject:
  1) *Inspector > Button Component > On Click()*
  1) Press "+"
  1) Drag your GameObject to *None*
  1) Choose function from list to call when button is clicked

### Invoking button press by pressing a controller button

* Use this script to invoke UI button press with a controller even though the UI button wasn't really pressed: 
```c#
[SerializeField] Button _button;
...
if (Input.ButtonDown("Fire1"))
  _button.onClick.Invoke();
```

### Arrow keys menu
* Event System GameObject > Event System Component > First Selected
* [Video: Menu Navigation with Arrow Keys in Unity | Easy Unity Tutorial](https://www.youtube.com/watch?v=8mFWJwxV3ps)
```c#
using EventSystem
...
EventSystem.current.SetSelectedGameObject(myButton);
```


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

### UI Example: HP bar

* RectTransform: Set pivot to left
* Control the HP bar width from code:
  ```c#
  hpBarRT = GetComponent<RectTransform>();
  ...
  public void AddHP(float newHP)
  {
      hp += newHP;
      hp = Mathf.Clamp(hp, 0, 100);
      hpBarRT.sizeDelta = new Vector2(width * hp / 100, hpBarRT.rect.height);
  }
  ```
* Use ***9-Slicing*** for HP bar art

### UI Example: Dialogue system

* [Brackeys video: How to make a Dialogue System in Unity](https://www.youtube.com/watch?v=_nRzoTzeyxU)
* [Semag Games video series: Dialogue Tutorial](https://www.youtube.com/playlist?list=PLCGaK2yqfY2IrJYnOnlgdmzWVUFXsRQXA)
* [BMo video: 5 Minute dialogue system](https://www.youtube.com/watch?v=8oTYabhj248) (code examples below)
  * ***Note:*** This example does not do word wrapping properly: the last word of the line can jump to the next line when it's being drawn on screen letter by letter!
  ```c#
  [SerializeField] TextMeshProUGUI textComponent;
  [SerializeField] string[] lines = [],
  [SerializeField] float textSpeed
  int index;
  IEnumerator coTypeLine;

  void Start()
  {
    coTypeLine = TypeLine();
    textComponent.text = "";
    StartDialogue();
  }
  ```
---
  ```c#
  void StartDialogue()
  {
    index = 0;
    StartCoroutine(coTypeLine);
  }

  IEnumerator TypeLine()
  {
    foreach (char c in lines[index].ToCharArray())
    {
      textComponent.text += c;
      yield return new WaitForSeconds(textSpeed);
    }
  }
  ```
---
  ```c#
  void Update()
  {
    if (Input.GetButtonDown("Fire1") && (textComponent.text == lines[index]))
    {
      NextLine();
    }
    if (Input.GetButtonDown("Fire2") && (textComponent.text != lines[index]))
    {
      StopCoroutine(coTypeLine);
      textComponent.text = lines[index];
    }
  }
  void NextLine()
  {
    if (index < lines.length - 1)
    {
      index++;
      textComponent.text = "";
      StartCoroutine(coTypeLine);
    }
  }
  ```
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

Change the color of a GameObject in your scene when the button has been pressed!

Try out setting RectTransform anchor points and see how the UI changes when you change the game resolution in the Game view.
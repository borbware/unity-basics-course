---
title: Unity Cookbook. User interface
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

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
  * *Constant pixel size*
    * UI elements take the same amount of pixels regardless of screen size
  * *Constant physical size*:
    * UI elements take the same amount of pixels/DPI regardless of screen size
  * *Scale with screen size*:
    * UI elements take a given portion of the screen size
    * This is the one we usually want
    * You can choose if you rather match the screen width or screen height with *Screen Match Mode*

## Graphic Raycaster Component

* The Graphic Raycaster is used to raycast against a Canvas.
* The Raycaster looks at all Graphics on the canvas and determines if mouse is top on any of them
* [Graphic Raycaster](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-GraphicRaycaster.html)
* Can be used to determine if the cursor is over a Graphics element in the Scene:
  * [GraphicRaycaster.Raycast](https://docs.unity3d.com/2017.3/Documentation/ScriptReference/UI.GraphicRaycaster.Raycast.html)

## Visual components

* These are used for actually drawing things in the UI 
* [Packages: Unity UI: Visual Components](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIVisualComponents.html)
  * [Text](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-Text.html) 
  * [Image](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-Image.html) (& [Raw Image](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-RawImage.html))
    * ***NOTE:*** For drawing images on UI, you need to use the Image component, ***NOT the Sprite Renderer!***
  * [Mask](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-Mask.html) (& [RectMask2D](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/script-RectMask2D.html))
* Add e.g., image to scene with *GameObject > UI > Image*
  * All UI element GameObjects have to be under the Canvas GameObject!

## TextMeshPro

* [Packages: TextMeshPro user guide](https://docs.unity3d.com/Packages/com.unity.textmeshpro@3.0/manual/index.html)
* There are two ways to draw text to UIs in Unity
  * The legacy ***Text*** GameObject that is easier to use
  * The newer, more feature-packed ***Text - TextMeshPro***
* TextMeshPro is a separate package that comes with new Unity Projects by default
* To start using it, install TextMeshPro Essentials
  * A prompt will appear when you add a TextMeshPro GameObject
  * If you missed it, install it manually with *Window > TextMeshPro > Import TextMeshPro Essential Resources*

### TextMeshPro: Using a custom font

* You need to create a new font asset before you can use your own font with TextMeshPro

1) Add your font file (.ttf, for example) to your Assets folder
2) Open *Window > TextMeshPro > Font Asset Creator*
3) Drag the font file to *Source Font File*
4) Click *Generate Font Atlas*
5) Click *Save* to save the generated Font assets

* Now you can set the new font asset to a TextMeshPro component! 

## Updating UI with code

* You can update the text field of a TextMeshPro component with code:
```c#
[SerializeField] TextMeshProUGUI textComponent;
...
  public void setScore(int newScore)
  {
      textComponent.text = $"Score: {newScore}";
  }
```
* ***Note:*** To use the `TextMeshProUGUI` component, you need to add `using TMPro;` on top of the script file.

### UI manager

* We usually want to create a UI manager that handles updating the UI
  * For instance with a name `UIManager` 
* We can make it a ***singleton*** with a name `instance` to access it easily from wherever we want to use it in the game
  * That way, we can call `UIManager.instance.UpdateScore()` from wherever we need
  * An example code below
  * See also [Scene management: Creating a data manager](scenes#creating-a-data-manager)

---

```c#
using TMPro;

public class UIManager : MonoBehaviour
{
    public static UIManager instance;

    [SerializeField] TextMeshProUGUI scoreText;
    public int score = 0;

    void Start()
    {
        if (instance != null) Destroy(gameObject);
        else instance = this;
    }

    public void UpdateScore(int scoreChange)
    {
        score += scoreChange;
        scoreText.text = score.ToString();
    }
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

### Navigating menu with Arrow keys & game controller

* By default, your buttons are only interactable with mouse
* To add support controller & keyboard input, you need to do two things:
  * In every button, set *Navigation* to *Automatic*
    * You can visualize button navigation flow with *Visualize*
    * If *Automatic* doesn't give desired results, try other options.
  * Then, drag the button you want to be highlighted first to your Event System GameObject's *First Selected* property
* Extra stuff:
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

* You have to change the ***Anchor presets***
* *Inspector > Rect Transform* and click on the square on the left 
  * Pressing down ***Shift+Alt*** exposes additional options

### I can't press my buttons!

* When clicking on buttons doesn't work, you might have invisible UI elements on top of the button that block clicking on the buttons underneath.

## UI exercise 1: Basics
<!-- _backgroundColor: #29366f -->

Continue the Exercise 3 from Collision. Create a counter for the collected items that sits on the top left corner of the screen.

See how UI scaling changes when you change the CanvasScaler component settings!

## UI exercise 2: Buttons
<!-- _backgroundColor: #29366f -->

Create a UI with three buttons.

Change the color of a GameObject in your scene when the button has been pressed!

Try out setting RectTransform anchor points and see how the UI changes when you change the game resolution in the Game view.

## Reading

* [Unity UI manual: Designing UI for multiple resolutions](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/HOWTO-UIMultiResolution.html)
* [Unity UI manual: Creating UI elements from scripting](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/HOWTO-UICreateFromScripting.html)

## Extra: IMGUI - Immediate Mode Graphical User Interface
<!-- _backgroundColor: #5d275d -->

* Code-driven system to create UI elements quickly
* [Manual: GUI scripting guide](https://docs.unity3d.com/Manual/GUIScriptingGuide.html)
* [ScriptReference: GUI](https://docs.unity3d.com/ScriptReference/GUI.html)
* Example: Button
  ```c#
  if (GUI.Button(new Rect(100, 30, 150, 30), "Do a thing!"))
  {
      // When button is pressed, do a thing here
  }
  ```
* Example: Input Field
  ```c#
  value = GUI.TextField(new Rect(300, 30, 200, 20), value, 25);
  ```

---

![width:700px](imgs/imgui.png)
* This is the kind of elements you can create with IMGUI.

## Extra: UI toolkit
<!-- _backgroundColor: #5d275d -->

* [UI Toolkit](https://docs.unity3d.com/Manual/UIElements.html)
  * Collection of features, resources, and tools for UI
    * Create UIs with style sheets


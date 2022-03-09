---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Input handling

## The two ways: Input Manager
* [Docs: Input](https://docs.unity3d.com/Manual/Input.html)
* There are two ways to get input in Unity
* The legacy **Input Manager**
  * uses the Input class
  * uses Directinput
  * works almost always
  * (but sometimes controller axes are screwed up)
  * easier to setup -> this is the one we'll be using

## The two ways: Input system
* The new **Input System**
  * [Docs: Input system](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.3/manual/index.html)
  * needs to be installed as a separate package
  * action-based
  * uses XInput
  * won't be covered on this course
## Keyboard input

* `Input.GetKeyDown(KeyCode.Space)`
  * returns `true` for one frame when pressed down 
  * Good for jumps, navigating the UI, other ***discrete*** actions 
* `Input.GetKey(KeyCode.Space)`
  * returns `true` for the duration of pressage
  * Good for movement or other ***continuous*** actions
* `Input.GetKeyUp(KeyCode.Space)`
  * True for one frame when we stop pressing a button
  * Needed less often than the previous ones
## Input table

* What if you want to be able to change game controls?
* Or check both keyboard and game controller input?
* Use the ***Input table*** instead
  * `Input.GetButtonDown("Jump")`
  * `Input.GetButton("Jump")`
  * `Input.GetButtonUp("Jump")`
* Input table
  * *Edit > Project Settings > Input*
  * "positive button"
## Analog input

* [Docs: Input.GetAxis](https://docs.unity3d.com/ScriptReference/Input.GetAxis.html)
* how to account for analog sticks? They aren't buttons you press
  * rather a two-dimensional field of many possible coordinates
  * -> separate input to two axes, vertical and horizontal
* `Input.GetAxis(axisName)`
  * sliding scale between -1 and 1
  * Gravity vs Sensitivity
  * Deadzone
  * `float h = Input.GetAxis("Horizontal");`
  * `float h = Input.GetAxisRaw("Horizontal");`

## Exercise 1. Player input
<!-- _backgroundColor: teal -->
Create a top-down player character that can
* move with the analog stick
* shoot with the Fire button


## Extra: Mouse input
<!-- backgroundColor: black -->
* `Input.GetMouseButton(0)`
  * Down & Up methods work similarly to previous examples as well
* get mouse position:
  * `Vector2 mousePos = Input.mousePosition;`
* you can also use a dedicated method for checking if mouse clicked on a gameobject:
  * `OnMouseDown()`


## Mouse input example

```c#
    private Rigidbody rb;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    void OnMouseDown()
    {
        rb.AddForce(-transform.forward * 500f);
        rb.useGravity = true;
    }
```
## Extra: Touch input
* [Docs: Input.GetTouch](https://docs.unity3d.com/ScriptReference/Input.GetTouch.html)
* [Docs: Input.touches](https://docs.unity3d.com/ScriptReference/Input-touches.html)
  ```c#
  if (Input.touchCount > 0)
    {
      Touch touch = Input.GetTouch(0);
      // Move thing if the screen has the finger moving.
      if (touch.phase == TouchPhase.Moved)
      {
        Vector3 position = new Vector3(touch.position.x, 0f, touch.position.y);
        transform.position = position;
      }
    }
  }
  ```

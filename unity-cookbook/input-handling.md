---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Input handling

## The two ways: Input Manager
* [Manual: Input](https://docs.unity3d.com/Manual/Input.html)
* There are two ways to get input in Unity
* The legacy **Input Manager**
  * uses the Input class
  * uses Directinput
  * works almost always
  * (but sometimes controller axes are screwed up)
  * easier to setup -> this is the one we'll be using

## The two ways: Input system
* The new **Input System**
  * [Packages: Input system](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.3/manual/index.html)
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
  * return `true` for one frame when we stop pressing a button
  * Good for a charge weapon: hold down for charge, release button to shoot
  * Needed less often than the previous ones

## More general input

* What if you want to be able to change game controls?
* Or check both keyboard and game controller input?
* Use the ***GetButton*** functions instead
  * `Input.GetButtonDown("Jump")`
  * `Input.GetButton("Jump")`
  * `Input.GetButtonUp("Jump")`

### Input table
* Input table
  * *Edit > Project Settings > Input*
* *Positive button* refers to a button being pressed
* *Negative button* is only needed for directional input
* You can assign an Alt Button for an alternate input method
* ***Note***: Keyboard and controller bindings are in their separate entries!
* Add new entries by increasing the *Size* property
  * It will duplicate the last entry in the list. Oh wow
* Use [this link](https://ritchielozada.com/2016/01/16/part-11-using-an-xbox-one-controller-with-unity-on-windows-10/) to see which button numbers correspond to which controller buttons
  * For example, `joystick button 0` is the Xbox button A
 
## Analog input

* [Script Reference: Input.GetAxis](https://docs.unity3d.com/ScriptReference/Input.GetAxis.html)
* how to account for analog sticks? They aren't buttons you press
  * rather a two-dimensional field of many possible coordinates
  * -> separate input to two axes, vertical and horizontal
  * Sliding scale between -1 and 1
* `Input.GetAxis(axisName)`
  * Smoothing with *Gravity* and *Sensitivity*
  * *Deadzone* applied (no input registered if only move the analog stick a bit)
  * `float h = Input.GetAxis("Horizontal");`
  * `float h = Input.GetAxisRaw("Horizontal");`

### GetAxisRaw

* [Script Reference: Input.GetAxisRaw](https://docs.unity3d.com/ScriptReference/Input.GetAxisRaw.html)
* `Input.GetAxisRaw(axisName)`
  * just the raw input data as-is
  * no deadzone, no smoothing

## Exercise 1. Player input
<!-- _backgroundColor: Khaki -->
Create a top-down player character with a sprite renderer that can
* change color with the ***Fire1*** button
* move with the analog stick


## Extra: Mouse input
<!-- backgroundColor: pink -->
* `Input.GetMouseButton(0)`
  * Down & Up methods work similarly to previous examples as well
* get mouse position:
  * `Vector2 mousePos = Input.mousePosition;`
* you can also create a dedicated method for checking if mouse clicked on a GameObject:
  ```c#
  OnMouseDown()
  {
      // do stuff
  }
  ```


### Mouse input example

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
* [Script Reference: Input.GetTouch](https://docs.unity3d.com/ScriptReference/Input.GetTouch.html)
* [Script Reference: Input.touches](https://docs.unity3d.com/ScriptReference/Input-touches.html)
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

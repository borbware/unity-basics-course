- [Getting Input](#getting-input)
  - [The two ways](#the-two-ways)
  - [Keyboard input](#keyboard-input)
  - [Input table](#input-table)
  - [Analog input](#analog-input)
  - [Mouse input](#mouse-input)
  - [Touch input](#touch-input)

# Getting Input

## The two ways

- [Docs: Input](https://docs.unity3d.com/Manual/Input.html)
- There are two ways to get input in Unity
- The legacy **Input Manager**
  - uses Directinput
  - works almost always (TM)
  - sometimes controller axes are screwed up
- The new **Input System**
  - [Docs: Input system](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.3/manual/index.html)
  - needs to be installed as a package
  - action-based
  - supports XInput
  - won't be covered on this course

## Keyboard input

- `Input.GetKeyDown(KeyCode.Space)`
  - True for one frame when pressed down 
  - Good for jumps, moving in UI, other discrete actions 
- `Input.GetKey(KeyCode.Space)`
  - True for the duration of pressage
  - Good for movement or other continuous actions
- `Input.GetKeyUp(KeyCode.Space)`
  - True for one frame when we stop pressing a button
  - Needed less often than the ones above

## Input table

- More versatile usage with Input mappings
  - `Input.GetButtonDown("Jump")`
  - `Input.GetButton("Jump")`
  - `Input.GetButtonUp("Jump")`
- Input table
  - Edit > Project Settings > Input
  - "positive button"

## Analog input

- GetAxis()
  - sliding scale between -1 and 1
  - Gravity vs Sensitivity
  - Deadzone
  - `float h = Input.GetAxis("Horizontal");`
  - `float h = Input.GetAxisRaw("Horizontal");`

## Mouse input

- `Input.GetMouseButton(0)`
  - Down & Up methods work similarly to previous examples as well
- get mouse position:
  - `Vector2 mousePos = Input.mousePosition;`
- you can also use a dedicated method for checking if mouse clicked on a gameobject:
  - `OnMouseDown()`
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

## Touch input
- [Docs: Input.GetTouch](https://docs.unity3d.com/ScriptReference/Input.GetTouch.html)
- [Docs: Input.touches](https://docs.unity3d.com/ScriptReference/Input-touches.html)
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